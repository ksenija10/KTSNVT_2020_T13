import { HttpClient } from '@angular/common/http';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { fakeAsync, getTestBed, TestBed, tick } from '@angular/core/testing';
import { Router } from '@angular/router';
import { Admin } from 'src/app/model/admin.model';
import { AdminData, AdminService } from '../admin.service';

describe('Admin service', () => {

    let injector;
    let adminService: AdminService;
    let httpMock: HttpTestingController;
    let httpClient: HttpClient;
    let router: Router;

    const routerMock = {
        navigate: jasmine.createSpy('navigate')
    };

    beforeEach(() => {

        TestBed.configureTestingModule({
            imports: [HttpClientTestingModule],
            providers: [
                AdminService,
                { provide: Router, useValue: routerMock}
            ]
        });

        injector = getTestBed();
        adminService = TestBed.inject(AdminService);
        httpClient = TestBed.inject(HttpClient);
        httpMock = TestBed.inject(HttpTestingController);
        router = TestBed.inject(Router);
    });

    afterEach(() => {
        httpMock.verify();
    });

    it('should be created', () => {
        expect(adminService).toBeTruthy();
    });

    it('should create new admin', fakeAsync(() => {
        let newAdmin: Admin = new Admin(
            'new@admin.com',
            'admin',
            'Noviadminko',
            'Noviadminic',
            new Date('January 17, 1990')
        );

        const mockAdmin: Admin = new Admin(
            'new@admin.com',
            'admin',
            'Noviadminko',
            'Noviadminic',
            new Date('January 17, 1990'),
            1
        );

        adminService.createAdmin(newAdmin).subscribe(
            data => {
                newAdmin = data;
            }
        );

        const req = httpMock.expectOne('https://localhost:8080/api/admin');
        expect(req.request.method).toBe('POST');
        req.flush(mockAdmin);

        tick();

        expect(newAdmin).toBeDefined();
        expect(newAdmin.id).toEqual(1);
        expect(newAdmin.email).toEqual('new@admin.com');
        expect(newAdmin.password).toEqual('admin');
        expect(newAdmin.name).toEqual('Noviadminko');
        expect(newAdmin.surname).toEqual('Noviadminic');
        expect(newAdmin.dateOfBirth).toEqual(new Date('January 17, 1990'));
    }));


    it('should get admins by page', fakeAsync(() => {
        const mockAdmins: Admin[] = [
            {
                id: 1,
                name: 'Nameadmin',
                surname: 'Surnameadmin',
                email: 'some1@admin.com',
                password: 'admin',
                dateOfBirth: new Date('January 17, 1990')
            },
            {
                id: 2,
                name: 'Nameadmin',
                surname: 'Surnameadmin',
                email: 'some2@admin.com',
                password: 'admin',
                dateOfBirth: new Date('January 17, 1990')
            }
        ];

        const mockResponse: AdminData = {
            content: mockAdmins,
            totalPages: 1,
            totalElements: 2,
            size: 2
        };

        let response: AdminData = {
            content: [],
            totalPages: 0,
            totalElements: 0,
            size: 0
        };

        adminService.findAllByPage(0, 2).subscribe(
            data => {
                response = data;
            }
        );

        const req = httpMock.expectOne('https://localhost:8080/api/admin/by-page?page=0&size=2');
        expect(req.request.method).toBe('GET');
        req.flush(mockResponse);

        tick();
        expect(response.content.length).toEqual(2);

        expect(response.content[0].id).toEqual(1);
        expect(response.content[0].name).toEqual('Nameadmin');
        expect(response.content[0].surname).toEqual('Surnameadmin');
        expect(response.content[0].email).toEqual('some1@admin.com');
        expect(response.content[0].password).toEqual('admin');
        expect(response.content[0].dateOfBirth).toEqual(new Date('January 17, 1990'));

        expect(response.content[1].id).toEqual(2);
        expect(response.content[1].name).toEqual('Nameadmin');
        expect(response.content[1].surname).toEqual('Surnameadmin');
        expect(response.content[1].email).toEqual('some2@admin.com');
        expect(response.content[1].password).toEqual('admin');
        expect(response.content[1].dateOfBirth).toEqual(new Date('January 17, 1990'));
    }));
});
