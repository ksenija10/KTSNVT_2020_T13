import { HttpEvent, HttpHandler, HttpInterceptor, HttpParams, HttpRequest } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable } from "rxjs";

@Injectable()
export class AuthInterceptorService implements HttpInterceptor {
    intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
        let jwtToken = localStorage.getItem('jwtToken');
        if(!jwtToken) {
            //ukoliko jwt token ne postoji niko nije ulogovan i authorization header nije potreban
            //samo prosledimo netaknut request
            return next.handle(req);
        }
        //ukoliko je neko ulogovan zakacimo authorization header sa jwt tokenom
        //httpRequest je immutable pa moramo da ga kloniramo da bismo ga izmenili
        const modifiedReq = req.clone({
            params: new HttpParams().set('Authorization', 'Bearer ' +  jwtToken)
          });
        return next.handle(modifiedReq);
    }
    
}