import { Component, OnDestroy, OnInit } from '@angular/core';
import { MatIconRegistry } from '@angular/material/icon';
import { DomSanitizer } from '@angular/platform-browser';
import { NavigationEnd, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';
import { AuthenticationService } from 'src/app/services/authentication.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.sass'],
})
export class HeaderComponent implements OnInit, OnDestroy {

  activeLink = '';
  role = '';
  subscription!: Subscription;

  constructor(
    iconRegistry: MatIconRegistry,
    sanitizer: DomSanitizer,
    private router: Router,
    private authenticationService: AuthenticationService,
    private toastr: ToastrService
  ) {
    // dodavanje custom ikonice
    iconRegistry.addSvgIcon(
      'logo',
      sanitizer.bypassSecurityTrustResourceUrl(
        '../../../assets/images/srbija_logo.svg'
      )
    );
    iconRegistry.addSvgIcon(
      'user',
      sanitizer.bypassSecurityTrustResourceUrl(
        '../../../assets/images/user_logo.svg'
      )
    );
  }

  ngOnInit(): void {
    // preuzimanje trenutne rute
    this.router.events.subscribe((val) => {
      if ( val instanceof NavigationEnd) {
        const routePaths = this.router.url.split('/');
        this.activeLink = routePaths[routePaths.length - 1];
      }
    });

    // subscribe
    this.subscription = this.authenticationService.role
        .subscribe(role => {
          this.role = role;
        });
  }

  logout(): void {
    this.authenticationService.logout();
    this.toastr.info('Logged out successfully!');
  }

  onClick(path: string): void {
    this.activeLink = path;
    this.router.navigate([path]);
  }

  ngOnDestroy(): void {
    this.subscription.unsubscribe();
  }
}
