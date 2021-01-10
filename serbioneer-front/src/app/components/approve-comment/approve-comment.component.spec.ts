import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ApproveCommentComponent } from './approve-comment.component';

describe('ApproveCommentComponent', () => {
  let component: ApproveCommentComponent;
  let fixture: ComponentFixture<ApproveCommentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ApproveCommentComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ApproveCommentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
