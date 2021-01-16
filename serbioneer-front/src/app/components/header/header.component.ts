import { Component, OnDestroy, OnInit } from '@angular/core';
import { MatIconRegistry } from '@angular/material/icon';
import { DomSanitizer } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';
import { AuthenticationService } from 'src/app/services/authentication.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.sass'],
})
export class HeaderComponent implements OnInit, OnDestroy {

  role: string = '';
  subscription!: Subscription;

  constructor(
    iconRegistry: MatIconRegistry,
    sanitizer: DomSanitizer,
    private router: Router,
    private authenticationService: AuthenticationService,
    private toastr : ToastrService
  ) {
    // dodavanje custom ikonice
    iconRegistry.addSvgIcon(
      'logo',
      sanitizer.bypassSecurityTrustResourceUrl(
        '../../../assets/images/srbija_logo.svg'
      )
    );
  }

  ngOnInit(
  ): void {
    this.subscription = this.authenticationService.role
        .subscribe(role => {
          this.role = role;
        })
  }

  onHome(): void {
    this.router.navigate(['homepage']);
  }

  logout(): void {
    this.authenticationService.logout();
    this.toastr.success("Logged out successfully!");
  }

  onClick(path: string) {
    this.router.navigate([path]);
  }

  ngOnDestroy(): void {
    this.subscription.unsubscribe();
  }
}
