import { Component, OnInit, ViewChild } from '@angular/core';
import { CulturalSite, CulturalSiteView, SubscribedCulturalSiteDTO } from 'src/app/model/cultural-site.model';
import { Image } from 'src/app/model/image.model';
import { CommentDto, CulturalSiteService, NewsData } from 'src/app/services/cultural-site.service';
import { map } from 'rxjs/operators';
import { CommentData } from 'src/app/services/comment.service';
import { Router } from '@angular/router';
import { MatPaginator, PageEvent } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { RatingCreateDTO, RatingDTO, RatingService } from 'src/app/services/rating.service';
import { FormGroup, FormControl, Validators} from '@angular/forms';
import { ImageService } from 'src/app/services/image.service';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { AddNewsArticleComponent } from './add-news-article/add-news-article.component';
import { AuthenticatedUserService } from 'src/app/services/auth-user.service';
import { ToastrService } from 'ngx-toastr';
import { ConfirmDeleteDialogComponent } from 'src/app/components/core/confirm-dialog/confirm-dialog.component';

@Component({
  selector: 'app-view-cultural-site',
  templateUrl: './view-cultural-site.component.html',
  styleUrls: ['./view-cultural-site.component.sass']
  })
  export class ViewCulturalSiteComponent implements OnInit {

  culturalSiteId: number;
  culturalSite!: CulturalSiteView;
  starRating: RatingCreateDTO = {id: 0, value: 0, culturalSiteId: 0, authenticatedUserId: 0};
  initialStarRating = 0;
  news!: NewsData;
  comments!: CommentData;
  images: any = [];
  newImages: any = [];
  files: any = [];
  newImageFiles: any = [];
  myForm = new FormGroup({
    text: new FormControl('', [Validators.required]),
    file: new FormControl(''),
    fileSource: new FormControl('')});
  buttonValue!: string;
  userIsLogged = false;
  adminIsLogged = false;
  addNewImages = false;
  addNewComment = false;

  // map div id
  mapCulturalSite = 'map-cultural-site';
  // images array
  siteImageSlider: Array<object> = [];

  pageEventNews: PageEvent = new PageEvent();
  pageEventComments: PageEvent = new PageEvent();
  page = 0;
  size = 1;

  constructor(
    private culturalSiteService: CulturalSiteService,
    private router: Router,
    private toastr: ToastrService,
    private authenticationService: AuthenticationService,
    private authUserService: AuthenticatedUserService,
    private ratingService: RatingService,
    private imageService: ImageService,
    private newsDialog: MatDialog,
    private confirmDeleteDialog: MatDialog) {
      const siteUrl = this.router.url.split('/');
      this.culturalSiteId = +siteUrl[siteUrl.length - 1];
      this.loggedUser();
  }

  fetchNews(id: number): void {
    this.culturalSiteService.getAllCulturalSiteNews(id, this.page, this.size).pipe(
      map((news: NewsData) => this.news = news)
    ).subscribe();
  }

  fetchComments(id: number): void {
    this.culturalSiteService.getAllCulturalSiteComments(id, this.page, this.size).pipe(
      map((comments: CommentData) => this.comments = comments)
    ).subscribe();
  }

  ngOnInit(): void {
    this.culturalSiteService.getCulturalSite(this.culturalSiteId).pipe(
      map((culturalSite: CulturalSiteView) => {
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
        // dobavljamo sve news
        this.fetchNews(this.culturalSiteId);
        // dobavi komentare
        this.fetchComments(this.culturalSiteId);
      })
    ).subscribe(
      response => {},
      error => {
        this.toastr.error('Requested cultural site does not exist.');
        this.router.navigate(['homepage']);
      }
    );
  }

  onPaginateChangeNews(event: PageEvent): void {
    this.pageEventNews = event;
    this.page = event.pageIndex;
    this.size = event.pageSize;
    this.fetchNews(this.culturalSiteId);
  }

  onPaginateChangeComments(event: PageEvent): void {
    this.pageEventComments = event;
    this.page = event.pageIndex;
    this.size = event.pageSize;
    this.fetchComments(this.culturalSiteId);
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

  onFileChange(event: any): void {
    if (event.target.files && event.target.files[0]) {
      for (const file of event.target.files) {
        const reader = new FileReader();
        this.files.push(file);
        reader.onload = (loadEvent: any) => {
          this.images.push(loadEvent.target.result);
          this.myForm.patchValue({
            fileSource: this.images
          });
        };
        reader.readAsDataURL(file);
      }
    }
  }

  submit(): void {
    const commentText = this.myForm.get('text')?.value;
    this.culturalSiteService.createComment(this.culturalSiteId, commentText).pipe(map(
      (newComment: CommentDto) => {
        // provera da li je lista slika prazna
        if (this.files.length > 0){
          // ako nije onda dodajemo jedan po jedan fajl
          for (const file of this.files) {
            this.imageService.createForComment(newComment.id || 0, file).pipe(map(
              (image: Image) => {
                this.images = [];
                this.files = [];
                this.addNewComment = false;
                this.fetchComments(this.culturalSiteId);
              }
            )).subscribe();
          }
        }
      }
    )).subscribe(
      // zavrsio kreiranje komentara
      response => {
        this.toastr.success('Successfully reviewed cultural site!\n' +
                            'Your review will be visible after approval.');
        this.addNewComment = false;
        this.myForm.reset();
      },
      error => {
        if (error.error.message){
          this.toastr.error(error.error.message);
        } else {
          this.toastr.error('503 Server Unavailable');
        }
      }
    );
  }

  openDialog(): void {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.data = { culturalSite: this.culturalSite};
    dialogConfig.width = '900px';
    const dialogRef = this.newsDialog.open(AddNewsArticleComponent, dialogConfig);

    dialogRef.afterClosed().subscribe(value => {
      this.fetchNews(this.culturalSiteId);
    });
  }

  addImages(): void {
    this.addNewImages = !this.addNewImages;
    this.newImageFiles = [];
    this.newImages = [];
  }

  addComments(): void {
    this.addNewComment = !this.addNewComment;
    this.images = [];
    this.myForm.reset();
  }

  onNewImageChange(event: any): void {
    if (event.target.files && event.target.files[0]) {
      for (const file of event.target.files) {
        const reader = new FileReader();
        this.newImageFiles.push(file);
        reader.onload = (loadEvent: any) => {
          this.newImages.push(loadEvent.target.result);
          this.myForm.patchValue({
            fileSource: this.newImages
          });
        };
        reader.readAsDataURL(file);
      }
    }
  }

  submitImages(): void {
    // provera da li je lista slika prazna
    if (this.newImageFiles.length > 0){
      // ako nije onda dodajemo jedan po jedan fajl
      for (const file of this.newImageFiles) {
        this.imageService.createForCulturalSite(this.culturalSiteId, file).pipe(map(
          (image: Image) => {
            this.newImages = [];
            this.newImageFiles = [];
            this.addNewImages = false;
            this.culturalSite.images?.push(image);
            this.siteImageSlider.push({
              image: 'data:image/jpg;base64,' + image.content,
              thumbImage: 'data:image/jpg;base64,' + image.content,
              title: image.name});
          }
        )).subscribe(
          response => {
            this.toastr.success('Successfully added image for cultural site!');
          },
          error => {
            if (error.error.message){
              this.toastr.error(error.error.message);
            } else {
              this.toastr.error('503 Server Unavailable');
            }
          }
        );
      }
    }

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

  getTextErrorMessage(): string {
    if (this.myForm.controls.text.touched) {
        if ( this.myForm.controls.text.hasError('required')) {
        return 'Required field';
        }
    }
    return '';
  }
}

export interface DialogData {
  culturalSiteId: number;
}
