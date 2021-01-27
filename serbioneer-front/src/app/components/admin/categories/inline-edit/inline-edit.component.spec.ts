import { ComponentFixture, TestBed } from '@angular/core/testing';
import { SatPopover, SatPopoverModule } from '@ncstate/sat-popover';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { InlineEditComponent } from './inline-edit.component';
import { HarnessLoader } from '@angular/cdk/testing';
import { of } from 'rxjs';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { TestbedHarnessEnvironment } from '@angular/cdk/testing/testbed';
import { MatInputHarness } from '@angular/material/input/testing';

describe('InlineEditComponent', () => {
  let component: InlineEditComponent;
  let fixture: ComponentFixture<InlineEditComponent>;
  // injektovani servisi i ostalo
  let popover: SatPopover;
  let loader: HarnessLoader;

  beforeEach(() => {
    const satPopoverMock = {
      closed: jasmine.createSpy('closed')
        .and.returnValue(of({})),
      close: jasmine.createSpy('close')
    };

    TestBed.configureTestingModule({
      declarations: [InlineEditComponent],
      providers: [{ provide: SatPopover, useValue: satPopoverMock }],
      imports: [
        ReactiveFormsModule,
        FormsModule,
        MatFormFieldModule,
        MatInputModule,
        BrowserAnimationsModule,
        SatPopoverModule
      ]
    }).compileComponents();

    fixture = TestBed.createComponent(InlineEditComponent);
    component = fixture.componentInstance;
    popover = TestBed.inject(SatPopover);
    loader = TestbedHarnessEnvironment.loader(fixture);

    component.popover = popover;

    InlineEditComponent.prototype.ngOnInit = () => {}; // override ngOnInit

  });


  it('can load instance', () => {
    InlineEditComponent.prototype.ngOnInit = () => {}; // override ngOnInit

    expect(component).toBeTruthy();


  });

  it(`namePattern has default value`, () => {
    InlineEditComponent.prototype.ngOnInit = () => {}; // override ngOnInit

    expect(component.namePattern).toEqual(`([A-ZŠĐČĆŽ]{1}[a-zšđčćž]*)( [a-zšđčćž]*)*`);

  });

  it('onSubmit', () => {
    InlineEditComponent.prototype.ngOnInit = () => {}; // override ngOnInit

    component.onSubmit();
    expect(popover.close).toHaveBeenCalled();

  });

  it('onCancel', () => {
    InlineEditComponent.prototype.ngOnInit = () => {}; // override ngOnInit

    component.onCancel();
    expect(popover.close).toHaveBeenCalled();

  });

  it('get edit error message - valid', async () => {
    InlineEditComponent.prototype.ngOnInit = () => {}; // override ngOnInit

    const inlineInput = await loader.getHarness(MatInputHarness.with({selector: '#inline-input'}));
    await inlineInput.setValue('Valid');
    await inlineInput.blur();

    const returned = component.getEditErrorMessage();
    // sta ocekujemo da je povratna vrednost
    expect(returned).toEqual('');
  });

  it('get required field error-invalid', async () => {
    InlineEditComponent.prototype.ngOnInit = () => {}; // override ngOnInit

    const inlineInput = await loader.getHarness(MatInputHarness.with({selector: '#inline-input'}));
    await inlineInput.setValue('');
    await inlineInput.blur();

    const returned = component.getEditErrorMessage();
    // sta ocekujemo da je povratna vrednost
    expect(returned).toEqual('Required field');

  });

  it('get capital letter error-invalid', async () => {
    InlineEditComponent.prototype.ngOnInit = () => {}; // override ngOnInit

    const inlineInput = await loader.getHarness(MatInputHarness.with({selector: '#inline-input'}));
    await inlineInput.setValue('invalid');
    await inlineInput.blur();

    const returned = component.getEditErrorMessage();
    // sta ocekujemo da je povratna vrednost
    expect(returned).toEqual('Must start with capital letter');

  });

  it('get special characters error-invalid', async () => {
    InlineEditComponent.prototype.ngOnInit = () => {}; // override ngOnInit

    const inlineInput = await loader.getHarness(MatInputHarness.with({selector: '#inline-input'}));
    await inlineInput.setValue('In3v%');
    await inlineInput.blur();

    const returned = component.getEditErrorMessage();
    // sta ocekujemo da je povratna vrednost
    expect(returned).toEqual('Cannot contain special characters or numbers');

  });

});
