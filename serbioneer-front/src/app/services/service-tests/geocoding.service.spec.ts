import { HttpClient } from '@angular/common/http';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { fakeAsync, getTestBed, TestBed, tick } from '@angular/core/testing';
import { GeocodingService } from '../geocoding.service';

describe('Geocoding service', () => {

    let injector;
    let geocodingService: GeocodingService;
    let httpMock: HttpTestingController;
    let httpClient: HttpClient;

    beforeEach(() => {
        TestBed.configureTestingModule({
            imports: [HttpClientTestingModule],
            providers: [
                GeocodingService
            ]
        });

        injector = getTestBed();
        geocodingService = TestBed.inject(GeocodingService);
        httpClient = TestBed.inject(HttpClient);
        httpMock = TestBed.inject(HttpTestingController);
    });

    afterEach(() => {
        httpMock.verify();
    });

    it('should be created', () => {
        expect(geocodingService).toBeTruthy();
    });

    it('should get latitude and longitude for address', fakeAsync(() => {
        const address = 'Ilije Bircanina 37 Novi Sad';
        const mockLatLng = {};
        let latLng = null;

        geocodingService.getLatlong(address).subscribe(
            data => {
                latLng = data;
            }
        );

        const req = httpMock.expectOne(
            'https://cors-anywhere.herokuapp.com/https://maps.googleapis.com/maps/api/geocode/json?address=Ilije%20Bircanina%2037%20Novi%20Sad&key=AIzaSyBCtbTPTKPVG3w-mkIaB5PTczTaOhKXTfI');
        expect(req.request.method).toBe('GET');
        req.flush(mockLatLng);

        tick();

        expect(latLng).toBeTruthy();
    }));
});
