import { Component, OnInit } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { AuthenticationService } from './services/authentication.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.sass']
})
export class AppComponent implements OnInit {
  title = 'serbioneer';

  constructor(
    private authService: AuthenticationService,
    private toastr: ToastrService
    ) {}

  ngOnInit(): void {
    if (!this.authService.autoLogin()) {
      this.toastr.info('Please log in.');
    } else {
      this.authService.startAutoLoginRefreshTokenTimer();
    }
  }
}
