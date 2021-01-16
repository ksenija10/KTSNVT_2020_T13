import { Component } from '@angular/core';
import { AuthenticationService } from './services/authentication.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.sass']
})
export class AppComponent {
  title = 'serbioneer';

  constructor(private authService: AuthenticationService) {}

  ngOnInit() {
    this.authService.autoLogin();
  }
}
