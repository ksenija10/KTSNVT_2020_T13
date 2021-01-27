import { Component, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { PageEvent } from '@angular/material/paginator';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { map } from 'rxjs/operators';
import { ConfirmDeleteDialogComponent } from 'src/app/components/core/confirm-dialog/confirm-dialog.component';
import { CulturalSite, SubscribedCulturalSiteDTO } from 'src/app/model/cultural-site.model';
import { Image, SliderImage } from 'src/app/model/image.model';
import { AuthenticatedUserService } from 'src/app/services/auth-user.service';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { CommentData } from 'src/app/services/comment.service';
import { CommentDto, CulturalSiteService } from 'src/app/services/cultural-site.service';
import { ImageService } from 'src/app/services/image.service';
import { NewsData } from 'src/app/services/news.service';
import { RatingCreateDTO, RatingDTO, RatingService } from 'src/app/services/rating.service';
import { AddImageComponent } from './add-image/add-image.component';
import { AddNewsArticleComponent } from './add-news-article/add-news-article.component';
import { CommentsListComponent } from './comments-list/comments-list.component';
import { NewsListComponent } from './news-list/news-list.component';

@Component({
  selector: 'app-view-cultural-site',
  templateUrl: './view-cultural-site.component.html',
  styleUrls: ['./view-cultural-site.component.sass']
  })
  export class ViewCulturalSiteComponent implements OnInit {

  culturalSiteId: number;
  culturalSite!: CulturalSite;
  starRating: RatingCreateDTO = {id: 0, value: 0, culturalSiteId: 0, authenticatedUserId: 0};
  initialStarRating = 0;
  myForm = new FormGroup({
    text: new FormControl('', [Validators.required]),
    file: new FormControl(''),
    fileSource: new FormControl('')});
  buttonValue!: string;
  userIsLogged = false;
  adminIsLogged = false;
  addNewImages = false;

  // map div id
  mapCulturalSite = 'map-cultural-site';
  // images array
  siteImageSlider: Array<SliderImage> = [];

  @ViewChild(NewsListComponent) private newsListComponent! : NewsListComponent;
  @ViewChild(AddImageComponent) private addImageComponent! : AddImageComponent;
  
  constructor(
    private culturalSiteService: CulturalSiteService,
    private router: Router,
    private toastr: ToastrService,
    private authenticationService: AuthenticationService,
    private authUserService: AuthenticatedUserService,
    private ratingService: RatingService,
    private newsDialog: MatDialog,
    private confirmDeleteDialog: MatDialog) {
      const siteUrl = this.router.url.split('/');
      this.culturalSiteId = +siteUrl[siteUrl.length - 1];
      this.loggedUser();
  }

  ngOnInit(): void {
    this.culturalSiteService.getCulturalSite(this.culturalSiteId).pipe(
      map((culturalSite: CulturalSite) => {
        this.culturalSite = culturalSite;
        if (this.culturalSite.rating) {
          this.culturalSite.rating = +(this.culturalSite.rating.toFixed(1));
        }
        // ubacivanje svih slika u listu slika kulturnog dobra
        if (culturalSite.images) {
          culturalSite.images.map((image: Image) => {
            this.siteImageSlider.push({
              image: 'data:image/jpg;base64,' + image.content,
              thumbImage: 'data:image/jpg;base64,' + image.content,
              title: image.name});
          });
        }
        if (this.userIsLogged){
          this.loggedSubscribedUser();
        }
      })
    ).subscribe(
      response => {},
      error => {
        this.toastr.error('Requested cultural site does not exist.');
        this.router.navigate(['homepage']);
      }
    );
  }

  updateImageSlider(): void {
    this.siteImageSlider = [];
    if (this.culturalSite.images) {
      this.culturalSite.images.map((image: Image) => {
        this.siteImageSlider.push({
          image: 'data:image/jpg;base64,' + image.content,
          thumbImage: 'data:image/jpg;base64,' + image.content,
          title: image.name});
      });
    }
  }

  loggedUser(): void {
    const role = this.authenticationService.getLoggedInUserAuthority();
    if (role === 'ROLE_USER'){
      this.userIsLogged = true;
    }else if (role === 'ROLE_ADMIN'){
      this.adminIsLogged = true;
      this.buttonValue = 'Add news';
    }
  }

  loggedSubscribedUser(): void {
    const email = this.authenticationService.getLoggedInUserEmail();

    this.fetchUserRating(this.culturalSiteId, email);

    const subscribedCulturalSiteDTO: SubscribedCulturalSiteDTO
      = new SubscribedCulturalSiteDTO(false, email, this.culturalSiteId);

    this.culturalSiteService.getUserCulturalSite(subscribedCulturalSiteDTO).pipe(map(
      (subscribedCulturalSite: SubscribedCulturalSiteDTO) =>
      {
        if (subscribedCulturalSite.subscribed){
          this.buttonValue = 'Unsubscribe';
        }
        else{
          this.buttonValue = 'Subscribe';
        }
      }
      )
    ).subscribe();
  }

  fetchUserRating(culturalSiteId: number, email: string): void {
    this.ratingService.getUserRatingForCulturalSite(culturalSiteId, email).pipe(map(
      (ratingDto: RatingDTO) => {
        this.starRating = new RatingCreateDTO(ratingDto.id, ratingDto.value, ratingDto.culturalSiteId, ratingDto.authenticatedUserId);
        this.initialStarRating = ratingDto.value;
      }
    )).subscribe();
  }

  onChangeSubscription(): void {
    if (this.buttonValue === 'Subscribe'){
      this.authUserService.subscribe(this.culturalSiteId)
        .subscribe(
          response => {
            this.toastr.success('Successfully subscribed to cultural site!');
            this.buttonValue = 'Unsubscribe';
          },
          error => {
            if (error.error.message){
              this.toastr.error(error.error.message);
            } else {
              this.toastr.error('503 Server Unavailable');
            }
        });
    }
    else{
      this.authUserService.unsubscribe(this.culturalSiteId)
        .subscribe(
          response => {
            this.toastr.info('Successfully unsubscribed from cultural site. Sad to see you leave.');
            this.buttonValue = 'Subscribe';
          },
          error => {
            if (error.error.message){
              this.toastr.error(error.error.message);
            } else {
              this.toastr.error('503 Server Unavailable');
            }
        });
    }
  }

  onRatingChange(): void {
    if (this.initialStarRating === 0){
      this.ratingService.createRating(this.culturalSiteId, this.starRating.value).pipe(map(
        (ratingDto: RatingDTO) => {
          this.initialStarRating = ratingDto.value;
          this.starRating = ratingDto;
          this.culturalSiteService.getCulturalSite(this.culturalSiteId).pipe(
            map((culturalSite: CulturalSite) => {
              this.culturalSite = culturalSite;
              if (this.culturalSite.rating) {
                this.culturalSite.rating = +(this.culturalSite.rating.toFixed(1));
              }
            })
          ).subscribe();
        }
      )).subscribe();
    }
    else{
      if (this.initialStarRating !== this.starRating.value){
        this.ratingService.updateRating(this.starRating.id,
        this.starRating.value, this.culturalSiteId).pipe(map(
          (ratingDto: RatingDTO) => {
            this.initialStarRating = ratingDto.value;
            this.culturalSiteService.getCulturalSite(this.culturalSiteId).pipe(
              map((culturalSite: CulturalSite) => {
                this.culturalSite = culturalSite;
                if (this.culturalSite.rating) {
                  this.culturalSite.rating = +(this.culturalSite.rating.toFixed(1));
                }
              })
            ).subscribe();
          }
        )).subscribe();
      }
    }
  }

  openDialog(): void {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.data = { culturalSiteId: this.culturalSiteId, culturalSiteName: this.culturalSite.name};
    dialogConfig.width = '900px';
    const dialogRef = this.newsDialog.open(AddNewsArticleComponent, dialogConfig);

    dialogRef.afterClosed().subscribe(value => {
      this.newsListComponent.fetchNews(this.culturalSiteId);
    });
  }

  addImages(): void {
    this.addImageComponent.addNewImages = !this.addImageComponent.addNewImages;
    this.addImageComponent.newImageFiles = [];
    this.addImageComponent.newImages = [];
  }

  editCulturalSite(): void {
    this.router.navigate(['admin/edit-cultural-site/' + this.culturalSiteId]);
  }

  deleteCulturalSite(): void {
    // confirm delete dialog
    const dialogRef = this.confirmDeleteDialog.open(ConfirmDeleteDialogComponent, {
      data: {
        entity: 'cultural site',
        name: this.culturalSite.name
      }
    });

    dialogRef.afterClosed()
      .subscribe(
        response => {
          if (response) {
            this.culturalSiteService.deleteCulturalSite(this.culturalSiteId)
              .subscribe(
                serviceResponse => {
                  this.toastr.success('Successfully deleted cultural site!');
                  // redirekcija na stranicu sa svim kulturnim dobrima
                  this.router.navigate(['homepage']);
                },
                error => {
                  if (error.error.message){
                    this.toastr.error(error.error.message);
                  } else {
                    this.toastr.error('503 Server Unavailable');
                  }
                });
          }
        }
      );
  }
  
}
