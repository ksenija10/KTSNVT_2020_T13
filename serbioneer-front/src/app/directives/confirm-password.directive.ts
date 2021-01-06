import {AbstractControl, FormControl, FormGroupDirective, NgForm, ValidatorFn} from '@angular/forms';
import { ErrorStateMatcher } from '@angular/material/core';

export function confirmPasswordValidator(): ValidatorFn {
    return (control: AbstractControl): { [key: string]: any } | null => {
        const password = control.get('password');
        const confirmPassword = control.get('confirmPassword');
        return password && confirmPassword && password.value === confirmPassword.value ? null : { passwordsDontMatch: true };
    }
}

export class ConfirmPasswordMatcher implements ErrorStateMatcher {
    isErrorState(control: FormControl | null, form: FormGroupDirective | NgForm | null): boolean {
        if(control && control.parent) {
            return control.parent.invalid && control.touched;
        }
        return false;
    }
}