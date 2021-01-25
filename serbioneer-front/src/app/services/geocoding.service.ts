/// <reference types="@types/googlemaps" />
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
    providedIn: 'root',
})
export class GeocodingService {

    private googleKey = 'AIzaSyBCtbTPTKPVG3w-mkIaB5PTczTaOhKXTfI';
    private apiEndpoint = 'https://maps.googleapis.com/maps/api/geocode/json';
    // allow cors
    private proxyurl = 'https://cors-anywhere.herokuapp.com/';

    constructor(private http: HttpClient) {}

    getLatlong(address: string): Observable<any> {
        let params = new HttpParams();

        params = params.append('address', address);
        params = params.append('key', this.googleKey);

        return this.http.get(this.proxyurl + this.apiEndpoint, {params});
      }

  }
