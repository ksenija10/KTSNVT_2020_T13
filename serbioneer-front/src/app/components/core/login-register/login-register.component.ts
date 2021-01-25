import { Component, OnInit } from '@angular/core';
import { NavigationEnd, Router } from '@angular/router';

@Component({
  selector: 'app-login-register',
  templateUrl: './login-register.component.html',
  styleUrls: ['./login-register.component.sass']
})
export class LoginRegisterComponent implements OnInit {

  activeLink = '';

  constructor(private router: Router) { }

  ngOnInit(): void {
    let routePaths: string[] = this.router.url.split('/');
    this.activeLink = routePaths[routePaths.length - 1];
    this.router.events.subscribe((val) => {
      if ( val instanceof NavigationEnd) {
        routePaths = this.router.url.split('/');
        this.activeLink = routePaths[routePaths.length - 1];
      }
    });
  }

}
