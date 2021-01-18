import { HttpClient } from "@angular/common/http";
import { HttpClientTestingModule, HttpTestingController } from "@angular/common/http/testing";
import { fakeAsync, getTestBed, TestBed, tick } from "@angular/core/testing";
import { CommentData, CommentService } from "../comment.service";
import { Comment } from "../../model/comment.model"
import { makeParsedTranslation } from "@angular/localize/src/utils";
import { EmailValidator } from "@angular/forms";

describe('Comment service', ()=>{
    let injector;
    let commentService: CommentService;
    let httpMock: HttpTestingController;
    let httpClient: HttpClient;

    beforeEach(()=>{

        TestBed.configureTestingModule({
            imports: [HttpClientTestingModule],
            providers: [CommentService]
        })

        injector = getTestBed();
        commentService = TestBed.inject(CommentService);
        httpClient = TestBed.inject(HttpClient);
        httpMock = TestBed.inject(HttpTestingController);
    })

    afterEach(() => {
        httpMock.verify();
    })

    it('should be created', () => {
        expect(commentService).toBeTruthy();
    })

    it('should return some comments', fakeAsync(()=> {
        let mockComments: Comment[] = [
            {
                id: 1,
                name: "Marko",
                surname: "Markovic",
                username: "marko.markovic@email.com",
                culturalSiteName: "Biblioteka šabačka",
                text: "Ponosan sam što sam iz Šapca",
                approved: false,
                images: []
            },
            {
                id: 2,
                name: "Jovana",
                surname: "Jovanovic",
                username: "jjovanovic@email.com",
                culturalSiteName: "Srpsko narodno pozorište",
                text: "Vrhunske predstave mladih srpskih glumaca me svaki put ostave bez daha!",
                approved: false,
                images: []
            }
        ];
        
        let mockResponse: CommentData = {
            content: mockComments,
            totalPages: 1,
            totalElements: 2,
            size: 2
        }

        let response: CommentData = {
            content: [],
            totalPages: 0,
            totalElements: 0,
            size: 0
        };

        commentService.getComments(0,2).subscribe( data => {
            response = data;
        });

        const req = httpMock.expectOne("http://localhost:8080/api/comment/unapproved/by-page?page=0&size=2");
        expect(req.request.method).toBe('GET');
        req.flush(mockResponse);

        tick();

        expect(response.content.length).toEqual(2);

        expect(response.content[0].id).toEqual(1);
        expect(response.content[0].name).toEqual("Marko");
        expect(response.content[0].surname).toEqual("Markovic");
        expect(response.content[0].username).toEqual("marko.markovic@email.com");
        expect(response.content[0].culturalSiteName).toEqual("Biblioteka šabačka");
        expect(response.content[0].text).toEqual("Ponosan sam što sam iz Šapca");
        expect(response.content[0].approved).toEqual(false);

        expect(response.content[1].id).toEqual(2);
        expect(response.content[1].name).toEqual("Jovana");
        expect(response.content[1].surname).toEqual("Jovanovic");
        expect(response.content[1].username).toEqual("jjovanovic@email.com");
        expect(response.content[1].culturalSiteName).toEqual("Srpsko narodno pozorište");
        expect(response.content[1].text).toEqual("Vrhunske predstave mladih srpskih glumaca me svaki put ostave bez daha!");
        expect(response.content[1].approved).toEqual(false);

     }))

     it('should approve comment', fakeAsync(()=> {
         let comment: Comment = {
            id: 1,
            name: "Marko",
            surname: "Markovic",
            username: "marko.markovic@email.com",
            culturalSiteName: "Biblioteka šabačka",
            text: "Ponosan sam što sam iz Šapca",
            approved: false,
            images: []
        }

        let mockComment: Comment = {
            id: 1,
            name: "Marko",
            surname: "Markovic",
            username: "marko.markovic@email.com",
            culturalSiteName: "Biblioteka šabačka",
            text: "Ponosan sam što sam iz Šapca",
            approved: true,
            images: []
        }

        commentService.aproveComment(1).subscribe(data => {
            comment = data;
        })

        const req = httpMock.expectOne('http://localhost:8080/api/comment/1/approval');
        expect(req.request.method).toBe('PUT');
        req.flush(mockComment);

        tick();

        expect(comment).toBeDefined();
        expect(comment.name).toEqual("Marko");
        expect(comment.surname).toEqual("Markovic");
        expect(comment.username).toEqual("marko.markovic@email.com");
        expect(comment.culturalSiteName).toEqual("Biblioteka šabačka");
        expect(comment.approved).toEqual(true);
     }))

     it('should decline comment', fakeAsync(()=> {
    
       commentService.declineComment(1).subscribe(data => {
           let response = data;
       })

       const req = httpMock.expectOne('http://localhost:8080/api/comment/1/approval');
       expect(req.request.method).toBe('DELETE');
       req.flush({});

       tick();
    }))


    it('should update comment', fakeAsync(()=> {
        let comment: Comment = {
           id: 1,
           name: "Marko",
           surname: "Markovic",
           username: "marko.markovic@email.com",
           culturalSiteName: "Biblioteka šabačka",
           text: "Ponosan sam što sam iz Šapca",
           approved: true,
           images: []
       }

       let mockComment: Comment = {
           id: 1,
           name: "Marko",
           surname: "Markovic",
           username: "marko.markovic@email.com",
           culturalSiteName: "Biblioteka šabačka",
           text: "Ponosan sam što sam iz Šapca",
           approved: true,
           images: []
       }

       commentService.updateComment(1, comment).subscribe(data => {
           comment = data;
       })

       const req = httpMock.expectOne('http://localhost:8080/api/comment/1');
       expect(req.request.method).toBe('PUT');
       req.flush(mockComment);

       tick();

       expect(comment).toBeDefined();
       expect(comment.name).toEqual("Marko");
       expect(comment.surname).toEqual("Markovic");
       expect(comment.username).toEqual("marko.markovic@email.com");
       expect(comment.culturalSiteName).toEqual("Biblioteka šabačka");
       expect(comment.approved).toEqual(true);
    }))

    it('should delete comment', fakeAsync(()=> {
    
        commentService.deleteComment(1).subscribe(data => {
            let response = data;
        })
 
        const req = httpMock.expectOne('http://localhost:8080/api/comment/1');
        expect(req.request.method).toBe('DELETE');
        req.flush({});
 
        tick();
     }))
})