import { HttpClient, HttpHeaders, HttpResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { JwtHelperService } from '@auth0/angular-jwt';
import { BehaviorSubject, Observable } from 'rxjs';
import { environment } from '../../environments/environment';
import { AuthenticatedUser } from '../model/authenticated-user.model';
import { UserLogin } from '../model/user-login.model';

@Injectable({
  providedIn: 'root',
})
export class AuthenticationService {

  constructor(
    private http: HttpClient,
    private router: Router
  ) {
    this.jwtService = new JwtHelperService();
  }

  public role: BehaviorSubject<string> = new BehaviorSubject<string>('');

  role$ = this.role.asObservable();

  private headers = new HttpHeaders({ 'Content-Type': 'application/json' });

  private jwtService: JwtHelperService;

  // varira od browser-a u kom pozivamo
  private refreshTokenTimeout: any;
  private refreshedToken = '';
  private expiresInNum = 0;

  register(authUserDto: AuthenticatedUser): Observable<AuthenticatedUser> {
    return this.http.post<AuthenticatedUser>(environment.apiEndpoint + 'register', authUserDto, {
      headers: this.headers,
    });
  }

  login(userLoginDto: UserLogin): Observable<HttpResponse<void>> {
    return this.http.post<void>('https://localhost:8080/login', userLoginDto, {
      headers: this.headers,
      observe: 'response',
    });
  }

  autoLogin(): boolean {
    const user = this.getLoggedInUser();
    // provera postojanja tokena
    if (!user) {
      return true;
    }
    // provera validnosti tokena
    if (user.exp * 1000 < Date.now()) {
      // token vise nije validan
      localStorage.removeItem('jwtToken');
      localStorage.removeItem('expiresIn');
      this.router.navigate(['login-register/login']);
      return false;
    }
    // token je validan, prosledimo rolu kao sledecu vrednost observable
    const role = this.getLoggedInUserAuthority();
    this.role.next(role);
    // pokrenemo refresh
    return true;
  }

  logout(): void {
    localStorage.removeItem('jwtToken');
    localStorage.removeItem('expiresIn');
    this.router.navigate(['login-register/login']);
    this.role.next('');
    this.stopRefreshTokenTimer();
  }

  // geteri i seteri
  // poziva se i za updatePasswordDto i sa loginDto -> response je any
  setLoggedInUser(response: any): void {
    // ekstrakcija tokena
    const jwtTokenBearer = response.headers.get('Authorization');
    const jwtToken = jwtTokenBearer.split(' ')[1];
    const expiresIn = response.headers.get('Expires-In');
    // postavljanje tokena
    localStorage.setItem('jwtToken', jwtToken);
    localStorage.setItem('expiresIn', expiresIn);
    // pokretanje tajmera za refresh tokena
    this.startRefreshTokenTimer(jwtToken);
 }

  // sadrzaj jwt tokena moze biti bilo sta
  getLoggedInUser(): any {
    const token = localStorage.getItem('jwtToken');
    if (!token) {
      return '';
    }
    const info = this.jwtService.decodeToken(token);
    console.log(typeof(info));
    return info;
  }

  getLoggedInUserAuthority(): string {
    const info = this.getLoggedInUser();
    if (info) {
      return info.authorities[0].authority;
    }
    else {
      return '';
    }
  }

  getLoggedInUserEmail(): string {
    const info = this.getLoggedInUser();
    if (info) {
      return info.sub;
    }
    else {
      return '';
    }
  }

  // pomocne metode
  private refreshToken(): Observable<HttpResponse<void>> {
    return this.http.post<void>(
      environment.apiEndpoint + 'refresh',
      {},
      { observe: 'response' }
    );
  }

  public startRefreshTokenTimer(token: string): void {
    // parse json object from base64 encoded jwt token
    const jwtToken = this.jwtService.decodeToken(token);
    // set a timeout to refresh the token a minute before it expires
    const expires = new Date(jwtToken.exp * 1000);
    const timeout = expires.getTime() - Date.now() - 60 * 1000;

    this.refreshedToken = token;

    this.refreshTokenTimeout = setInterval(
      () =>
        this.refreshToken().subscribe((response) => {
          const jwtTokenBearer = response.headers.get('Authorization');
          if (jwtTokenBearer) {
            const jwtResponseToken = jwtTokenBearer.split(' ')[1];
            this.refreshedToken = jwtResponseToken;
            // postavljanje tokena
            localStorage.setItem('jwtToken', this.refreshedToken);
          }
        }),
      timeout
    );
  }

  // poziv pri logout-u
  public stopRefreshTokenTimer(): void {
    clearInterval(this.refreshTokenTimeout);
  }

  public startAutoLoginRefreshTokenTimer(): void {
    const token = localStorage.getItem('jwtToken');
    if (!token) {
      return;
    }
    const expiresIn = localStorage.getItem('expiresIn');
    if (!expiresIn) {
      return;
    } else {
      this.expiresInNum = (expiresIn as unknown as number);
    }
    // parse json object from base64 encoded jwt token
    const jwtToken = this.jwtService.decodeToken(token);
    // set a timeout to refresh the token a minute before it expires
    const expires = new Date(jwtToken.exp * 1000);
    const timeout = expires.getTime() - Date.now() - 60 * 1000;

    this.refreshedToken = token;
    this.refreshTokenTimeout = setTimeout(
      () => {
        this.intervalFunction();
        setInterval(
          () => {
            this.intervalFunction();
          }, this.expiresInNum - 60 * 1000);
      }, timeout);
  }

  private intervalFunction(): void {
    this.refreshToken().subscribe((response) => {
      const jwtTokenBearer = response.headers.get('Authorization');
      if (jwtTokenBearer) {
        const jwtToken = jwtTokenBearer.split(' ')[1];
        this.refreshedToken = jwtToken;
        // postavljanje tokena
        localStorage.setItem('jwtToken', this.refreshedToken);
      }
    });
  }

}
