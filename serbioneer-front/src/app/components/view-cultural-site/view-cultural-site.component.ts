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
import { AddNewsArticleComponent } from '../add-news-article/add-news-article.component';
import { AuthenticatedUserService } from 'src/app/services/auth-user.service';

@Component({
  selector: 'app-view-cultural-site',
  templateUrl: './view-cultural-site.component.html',
  styleUrls: ['./view-cultural-site.component.sass']
  })
  export class ViewCulturalSiteComponent implements OnInit {

  culturalSite! : CulturalSiteView;
  starRating! : RatingCreateDTO;
  initialStarRating = 0;
  news! : NewsData;
  comments! : CommentData;
  images : any = [];
  newImages: any = []
  files: any = [];
  newImageFiles : any = [];
  myForm = new FormGroup({
    name: new FormControl('', [Validators.required, Validators.minLength(3)]),
    file: new FormControl('', [Validators.required]),
    fileSource: new FormControl('', [Validators.required])});
  buttonValue! : string;
  userIsLogged : boolean = false;
  adminIsLogged : boolean = false;
  addNewImages : boolean = false;
  addNewComment : boolean = false;

  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;
  pageEventNews: PageEvent = new PageEvent();
  pageEventComments: PageEvent = new PageEvent();
  page : number = 0;
  size : number = 1;

  constructor(
    private culturalSiteService: CulturalSiteService,
    private router: Router,
    private authenticationService : AuthenticationService,
    private authUserService: AuthenticatedUserService,
    private ratingService : RatingService,
    private imageService : ImageService,
    private newsDialog : MatDialog) { 
      let id = this.culturalSiteService.getData();
      if(id == undefined){
        this.router.navigate(['homepage']);
      }
      this.loggedUser();
  }

  fetchNews(id: number){
    this.culturalSiteService.getAllCulturalSiteNews(id, this.page, this.size).pipe(
      map((news: NewsData) => this.news = news)
    ).subscribe();
  }

  fetchComments(id: number){
    this.culturalSiteService.getAllCulturalSiteComments(id, this.page, this.size).pipe(
      map((comments: CommentData) => this.comments = comments)
    ).subscribe();
  }

  ngOnInit(): void {
    this.culturalSiteService.getCulturalSite(this.culturalSiteService.getData()).pipe(
      map((culturalSite: CulturalSiteView) => {
        this.culturalSite = culturalSite;
        if(this.userIsLogged){
          this.loggedSubscribedUser();
        }
        // dobavljamo sve news
        this.fetchNews(this.culturalSite.id!);
        //dobavi komentare
        this.fetchComments(this.culturalSite.id!);
      })
    ).subscribe();
  }

  onPaginateChangeNews(event : PageEvent){
    this.page = this.pageEventNews.pageIndex;
    this.size = this.pageEventNews.pageSize;
    this.fetchNews(this.culturalSiteService.getData());
  }

  onPaginateChangeComments(event : PageEvent){
    this.page = this.pageEventComments.pageIndex;
    this.size = this.pageEventComments.pageSize;
    this.fetchComments(this.culturalSiteService.getData());
  }

  loggedUser(){
    let role = this.authenticationService.getLoggedInUserAuthority()
    if(role == 'ROLE_USER'){
      this.userIsLogged = true;
    }else if(role == 'ROLE_ADMIN'){
      this.adminIsLogged = true;
      this.buttonValue = 'Add news';
    }
  }

  loggedSubscribedUser(){
    let email = this.authenticationService.getLoggedInUserEmail()

    this.fetchUserRating(this.culturalSite.id!, email);

    const subscribedCulturalSiteDTO : SubscribedCulturalSiteDTO
      = new SubscribedCulturalSiteDTO(false, email, this.culturalSite.id!);

    this.culturalSiteService.getUserCulturalSite(subscribedCulturalSiteDTO).pipe(map(
      (subscribedCulturalSiteDTO: SubscribedCulturalSiteDTO) => 
      {
        if(subscribedCulturalSiteDTO.subscribed){
          this.buttonValue = "Unsubscribe";
        }
        else{
          this.buttonValue = "Subscribe";
        }
      }
      )
    ).subscribe();
  }

  fetchUserRating(culturalSiteId : number, email : string){
    this.ratingService.getUserRatingForCulturalSite(culturalSiteId, email).pipe(map(
      (ratingDto : RatingDTO) => {
        this.starRating = new RatingCreateDTO(ratingDto.id, ratingDto.value, ratingDto.culturalSiteId, ratingDto.authenticatedUserId);
        this.initialStarRating = ratingDto.value;
      }
    )).subscribe()
  }

  onChangeSubscription(event : Event){
    if(this.buttonValue == "Subscribe"){
      this.authUserService.subscribe(this.culturalSite.id!).subscribe();
      this.buttonValue = "Unsubscribe";
    }
    else{
      this.authUserService.unsubscribe(this.culturalSite.id!).subscribe();
      this.buttonValue = "Subscribe";
    }
  }

  isLogged() : boolean{
    if(this.userIsLogged){
      return true;
    }
    return false;
  }

  onRatingChange(){
    if(this.initialStarRating == 0){
      this.ratingService.createRating(this.culturalSite.id!, this.starRating.value).pipe(map(
        (ratingDto : RatingDTO) => {
          this.initialStarRating = ratingDto.value;
          this.starRating = ratingDto;
          this.culturalSiteService.getCulturalSite(this.culturalSite.id!).pipe(
            map((culturalSite: CulturalSite) => {
              this.culturalSite = culturalSite;
            })
          ).subscribe()
        }
      )).subscribe();
    }
    else{
      if(this.initialStarRating != this.starRating.value){
        this.ratingService.updateRating(this.starRating.id, 
        this.starRating.value, this.culturalSite.id!).pipe(map(
          (ratingDto : RatingDTO) => {
            this.initialStarRating = ratingDto.value;
            this.culturalSiteService.getCulturalSite(this.culturalSite.id!).pipe(
              map((culturalSite: CulturalSite) => {
                this.culturalSite = culturalSite;
              })
            ).subscribe()
          }
        )).subscribe();
      }
    }
  }

  onFileChange(event : any) {
    if (event.target.files && event.target.files[0]) {
      for (let i = 0; i < event.target.files.length; i++) {
        let name = event.target.files[i].name
        var reader = new FileReader();
        this.files.push(event.target.files[i]);
        reader.onload = (event:any) => {
          this.images.push(event.target.result);
          this.myForm.patchValue({
            fileSource: this.images
          });
        }

        reader.readAsDataURL(event.target.files[i]);
      }
    }
  }

  submit(event: any){
    let commentText = event!.target.newCommentText.value;
    this.culturalSiteService.createComment(this.culturalSite.id!, commentText).pipe(map(
      (newComment : CommentDto) => {
        //provera da li je lista slika prazna
        if(this.files.length > 0){
          //ako nije onda dodajemo jedan po jedan fajl
          for (let i = 0; i < this.files.length; i++) {
            this.imageService.createForComment(newComment.id!, this.files[i]).pipe(map(
              (image : Image) => {
                this.images = []
                this.files = []
                this.addNewComment = false;
                this.fetchComments(this.culturalSite.id!);
              }
            )).subscribe()
          }
        }
      }
    )).subscribe()
  }

  openDialog(){
    const dialogConfig = new MatDialogConfig();
    dialogConfig.data = { culturalSite: this.culturalSite};
    dialogConfig.width = '900px';
    let dialogRef = this.newsDialog.open(AddNewsArticleComponent, dialogConfig);

    dialogRef.afterClosed().subscribe(value => {
      this.fetchNews(this.culturalSite.id!);
    });
  }

  addImages(){
    this.addNewImages = true;
  }

  addComments(){
    this.addNewComment = true;
  }

  onNewImageChange(event : any) {
    if (event.target.files && event.target.files[0]) {
      for (let i = 0; i < event.target.files.length; i++) {
        var reader = new FileReader();
        this.newImageFiles.push(event.target.files[i]);
        reader.onload = (event:any) => {
          this.newImages.push(event.target.result);
          this.myForm.patchValue({
            fileSource: this.newImages
          });
        }
        reader.readAsDataURL(event.target.files[i]);
      }
    }
  }

  submitImages(event : any){
    //provera da li je lista slika prazna
    if(this.newImageFiles.length > 0){
      //ako nije onda dodajemo jedan po jedan fajl
      for (let i = 0; i < this.newImageFiles.length; i++) {
        this.imageService.createForCulturalSite(this.culturalSite.id!, this.newImageFiles[i]).pipe(map(
          (image : Image) => {
            this.newImages = []
            this.newImageFiles = []
            this.addNewImages = false;
            this.culturalSite.images?.push(image)
          }
        )).subscribe()
      }
    }
    
  }
}

export interface DialogData {
  culturalSiteId: number;
}