import { HttpClient } from '@angular/common/http';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { getTestBed, TestBed } from '@angular/core/testing';
import { NewsDTO } from '../../model/news.model';
import { NewsDataByPage, NewsService } from '../news.service';

describe('News service', () => {
    let injector;
    let newsService: NewsService;
    let httpMock: HttpTestingController;
    let httpClient: HttpClient;

    beforeEach(() => {

        TestBed.configureTestingModule({
            imports: [HttpClientTestingModule],
            providers: [NewsService]
        });

        injector = getTestBed();
        newsService = TestBed.inject(NewsService);
        httpClient = TestBed.inject(HttpClient);
        httpMock = TestBed.inject(HttpTestingController);
    });

    afterEach(() => {
        httpMock.verify();
    });

    it('should be created', () => {
        expect(newsService).toBeTruthy();
    });

    it('should get all subscribed news', () => {
        const mockNews: NewsDTO[] = [
            {
                information: 'Djoaki Rosini, Seviljski berberin. Subota, 23. januar u 19.00, scena Jovan Djordjevic',
                dateTime: new Date('2021-01-16'),
                culturalSiteName: 'Srpsko narodno pozoriste',
                images: []
            },
            {
                information: 'Premijera gostujuce predstave Amateri. Petak, 29. januar u 19.00, scena Pera Dobrinovic',
                dateTime: new Date('2021-01-12'),
                culturalSiteName: 'Srpsko narodno pozoriste',
                images: []
            }
        ];

        const mockResponse: NewsDataByPage = {
            content: mockNews,
            totalPages: 1,
            totalElements: 2,
            size: 2
        };

        let response: NewsDataByPage = {
            content: [],
            totalPages: 0,
            totalElements: 0,
            size: 0
        };

        newsService.getAllSubscribedNews(0, 2).subscribe( data => {
            response = data;
        });

        const req = httpMock.expectOne('https://localhost:8080/api/news/subscribed/by-page?page=0&size=2');
        expect(req.request.method).toBe('GET');
        req.flush(mockResponse);

        expect(response.content.length).toEqual(2);

        expect(response.content[0].information).toEqual('Djoaki Rosini, Seviljski berberin. Subota, 23. januar u 19.00, scena Jovan Djordjevic');
        expect(response.content[0].dateTime).toEqual(new Date('2021-01-16'));
        expect(response.content[0].culturalSiteName).toEqual('Srpsko narodno pozoriste');

        expect(response.content[1].information).toEqual('Premijera gostujuce predstave Amateri. Petak, 29. januar u 19.00, scena Pera Dobrinovic');
        expect(response.content[1].dateTime).toEqual(new Date('2021-01-12'));
        expect(response.content[1].culturalSiteName).toEqual('Srpsko narodno pozoriste');

    });
});
