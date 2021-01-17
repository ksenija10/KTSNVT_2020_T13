import { Injectable } from "@angular/core";
import { HttpClient, HttpHeaders } from "@angular/common/http";
import { environment } from "src/environments/environment";

@Injectable({
    providedIn: 'root',
  })
  export class AuthenticatedUserService {
  
    private headers = new HttpHeaders({ 'Content-Type': 'application/json' });
  
    constructor(
      private http: HttpClient, 
    ) {}

    subscribe(id : number){
        return this.http.post<void>(environment.apiEndpoint + 'authenticated-user/subscribe/' + id, null);
    }
    
    unsubscribe(id : number){
        return this.http.post<void>(environment.apiEndpoint + 'authenticated-user/unsubscribe/' + id, null);
    }
}