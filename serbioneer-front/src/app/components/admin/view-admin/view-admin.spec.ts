import { ComponentFixture, TestBed } from '@angular/core/testing';
import { Router } from '@angular/router';
import { MatPaginatorHarness } from '@angular/material/paginator/testing';
import { MatListItemHarness } from '@angular/material/list/testing';
import { MatListModule } from '@angular/material/list';
import { MatPaginator, MatPaginatorModule } from '@angular/material/paginator';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatIcon, MatIconModule } from '@angular/material/icon';
import { MatTableHarness } from '@angular/material/table/testing';

import { AdminService } from 'src/app/services/admin.service';
import { ViewAdminComponent } from './view-admin.component';
import { By } from '@angular/platform-browser';
import { of } from 'rxjs';
import { HarnessLoader } from '@angular/cdk/testing';
import { ToastrService } from 'ngx-toastr';
import { TestbedHarnessEnvironment } from '@angular/cdk/testing/testbed';
import { DebugElement } from '@angular/core';
import { MatTableModule } from '@angular/material/table';

describe('ViewAdminComponent', () => {
  let component: ViewAdminComponent;
  let fixture: ComponentFixture<ViewAdminComponent>;
  let adminService: AdminService;
  let router: Router;
  let loader: HarnessLoader;
  let paginator: any;

  beforeEach(() => {
    let adminServiceMock = {
      findAllByPage: jasmine.createSpy('findAllByPage').and.returnValue(
        of({
          content: [{}, {}, {}, {}],
          totalPages: 2,
          totalElements: 4,
          size: 2,
        })
      ),
    };

    let routerMock = {
      navigate: jasmine.createSpy('navigate'),
    };

    let paginatorMock = {
      paginator: jasmine.createSpy('paginator'),
    };

    TestBed.configureTestingModule({
      declarations: [ViewAdminComponent],
      providers: [
        { provide: AdminService, useValue: adminServiceMock },
        { provide: Router, useValue: routerMock },
      ],
      imports: [
        MatListModule,
        MatPaginatorModule,
        BrowserAnimationsModule,
        MatIconModule,
        MatTableModule,
      ],
    }).compileComponents();

    fixture = TestBed.createComponent(ViewAdminComponent);
    component = fixture.componentInstance;
    //component.paginator = new MatPaginator(new MatPaginatorIntl(), ChangeDetectorRef.prototype);
    adminService = TestBed.inject(AdminService);
    router = TestBed.inject(Router);
    loader = TestbedHarnessEnvironment.loader(fixture);
  });

  it('should fetch the list of admins on init', async () => {
    component.ngOnInit();

    expect(adminService.findAllByPage).toHaveBeenCalled();

    fixture.whenStable().then(async () => {
      expect(component.dataSource.content.length).toBe(4);
      fixture.detectChanges();

      let table = await loader.getHarness(
        MatTableHarness.with({ selector: '#admin-table' })
      );

      expect((await table.getRows()).length).toBe(4);
      // paginator
      const paginator = await loader.getHarness(
        MatPaginatorHarness.with({ selector: '#admins-paginator' })
      );
      const label = await paginator.getRangeLabel();
      expect(label).toEqual('1 – 2 of 4');
    });
  });

  it('should change page in paginator', async () => {
    component.ngOnInit();

    expect(adminService.findAllByPage).toHaveBeenCalled();

    const paginator = await loader.getHarness(
      MatPaginatorHarness.with({ selector: '#admins-paginator' })
    );

    await paginator.goToNextPage();

    expect(adminService.findAllByPage).toHaveBeenCalled();
    expect(component.pageEvent.pageIndex).toEqual(1);
  });
});
