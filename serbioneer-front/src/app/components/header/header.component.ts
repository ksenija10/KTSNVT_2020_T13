import { Component, OnInit } from '@angular/core';
import { MatIconRegistry } from '@angular/material/icon';
import { DomSanitizer } from '@angular/platform-browser';
import { Router } from '@angular/router';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.sass']
})
export class HeaderComponent implements OnInit {

  constructor(iconRegistry: MatIconRegistry, sanitizer: DomSanitizer,
    private router: Router) {
      // dodavanje custom ikonice
      iconRegistry.addSvgIcon(
          'logo',
          sanitizer.bypassSecurityTrustResourceUrl('../../../assets/images/srbija_logo.svg'));
   }

  ngOnInit(): void {
  }

  onHome(): void {
    this.router.navigate(['homepage']);
  }
}
