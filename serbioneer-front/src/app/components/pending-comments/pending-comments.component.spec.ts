import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PendingCommentsComponent } from './pending-comments.component';

describe('PendingCommentsComponent', () => {
  let component: PendingCommentsComponent;
  let fixture: ComponentFixture<PendingCommentsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PendingCommentsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PendingCommentsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
