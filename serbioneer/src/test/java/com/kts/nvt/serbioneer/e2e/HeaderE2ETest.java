package com.kts.nvt.serbioneer.e2e;

import com.kts.nvt.serbioneer.e2e.pages.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;

import static org.junit.Assert.assertEquals;

public class HeaderE2ETest {

    private WebDriver driver;

    private LoginPage loginPage;

    private HeaderPage headerPage;

    private HomepagePage homepagePage;

    private NewsfeedPage newsfeedPage;

    private MyProfilePage myProfilePage;

    private ChangePasswordPage changePasswordPage;

    private CategoriesPage categoriesPage;

    private PendingCommentsPage pendingCommentsPage;

    private ViewAdminPage viewAdminPage;
    
    private SubscribedSitesPage subscribedSitesPage;

    private NewCulturalSitePage newCulturalSitePage;

    @Before
    public void setUp() throws InterruptedException {
        //default-ni browser za selenium je firefox, pa ukoliko zelimo da koristimo chrome moramo da ubacimo
        //chrome ekstenziju i podesimo chrome kao default-ni driver
        System.setProperty("webdriver.chrome.driver", "src/test/resources/chromedriver.exe");
        ChromeOptions option= new ChromeOptions();
        option.addArguments("ignore-certificate-errors");
        driver = new ChromeDriver(option);

        //prosirenje prozora za bolji pregled
        driver.manage().window().maximize();
        //instanciranje potrebnih page objekata
        loginPage = PageFactory.initElements(driver, LoginPage.class);
        headerPage = PageFactory.initElements(driver, HeaderPage.class);
        homepagePage = PageFactory.initElements(driver, HomepagePage.class);
        newsfeedPage = PageFactory.initElements(driver, NewsfeedPage.class);
        myProfilePage = PageFactory.initElements(driver, MyProfilePage.class);
        changePasswordPage = PageFactory.initElements(driver, ChangePasswordPage.class);
        categoriesPage = PageFactory.initElements(driver, CategoriesPage.class);
        pendingCommentsPage = PageFactory.initElements(driver, PendingCommentsPage.class);
        viewAdminPage = PageFactory.initElements(driver, ViewAdminPage.class);
        subscribedSitesPage = PageFactory.initElements(driver, SubscribedSitesPage.class);
        newCulturalSitePage = PageFactory.initElements(driver, NewCulturalSitePage.class);

        //redirekcija na pocetak interakcije tj na login
        driver.get("https://localhost:4200/login-register/login");
    }

    @After
    public void cleanUp() {

        driver.quit();

    }

    @Test
    public void headerUnauthenticatedUserTestSuccess() throws InterruptedException {
        //provera da li je neulogovani korisnik i da li se nalazi na login stranici
        headerPage.ensureIsUnauthenticatedUser();
        loginPage.ensureIsDisplayedLoginForm();

        justWait();

        //provera da klikom na homepage ide na homepage stranicu
        headerPage.getHomeBtn().click();
        headerPage.ensureIsUnauthenticatedUser();
        homepagePage.ensureIsDisplayedHomepage();
        assertEquals(driver.getCurrentUrl(), "https://localhost:4200/homepage");

        justWait();

        //provera da klikom na login ide na login
        headerPage.getLoginHeaderBtn().click();
        headerPage.ensureIsUnauthenticatedUser();
        loginPage.ensureIsDisplayedLoginForm();
        assertEquals(driver.getCurrentUrl(), "https://localhost:4200/login-register/login");

        justWait();
    }

    @Test
    public void headerAuthenticatedUserTestSuccess() throws InterruptedException {
        //provera da li je neulogovani korisnik i da li se nalazi na login stranici
        headerPage.ensureIsUnauthenticatedUser();
        loginPage.ensureIsDisplayedLoginForm();

        justWait();

        //logovanje
        loginPage.getEmail().sendKeys("prvi@user.com");
        loginPage.getPassword().sendKeys("user");
        justWait();
        loginPage.getLoginBtn().click();

        justWait();

        //provera da li se nalazi na homepage
        headerPage.ensureIsAuthenticatedUser();
        homepagePage.ensureIsDisplayedHomepage();
        assertEquals(driver.getCurrentUrl(), "https://localhost:4200/homepage");

        justWait();

        //provera da klikom na newsfeed ide na newsfeed
        headerPage.getNewsfeedBtn().click();
        headerPage.ensureIsAuthenticatedUser();
        newsfeedPage.ensureIsDisplayedNewsfeed();
        assertEquals(driver.getCurrentUrl(), "https://localhost:4200/auth/newsfeed");

        justWait();

        //provera da li klikom na subscribed ide na subscribed
        headerPage.getSubscribedBtn().click();
        headerPage.ensureIsAuthenticatedUser();
        subscribedSitesPage.ensureIsDisplayed();
        assertEquals(driver.getCurrentUrl(), "https://localhost:4200/auth/subscribed");
        
        justWait();

        //provera da li klikom na my profile ide na my profile
        Actions a= new Actions(driver);
        a.moveToElement(headerPage.getUserDropDown()).build().perform();
        headerPage.getMyProfileBtn().click();
        headerPage.ensureIsAuthenticatedUser();
        myProfilePage.ensureIsDisplayedMyProfileAuthenticatedUserForm();
        assertEquals(driver.getCurrentUrl(), "https://localhost:4200/profile/my-profile");

        justWait();

        //provera da li klikom na change password ide na change password
        a.moveToElement(headerPage.getUserDropDown()).build().perform();
        headerPage.getChangePasswordBtn().click();
        headerPage.ensureIsAuthenticatedUser();
        changePasswordPage.ensureIsDisplayedChangePasswordForm();
        assertEquals(driver.getCurrentUrl(), "https://localhost:4200/profile/change-password");

        justWait();

        //provera da li se izloguje klikom na logout
        a.moveToElement(headerPage.getUserDropDown()).build().perform();
        headerPage.getLogoutBtn().click();
        headerPage.ensureIsUnauthenticatedUser();
        loginPage.ensureIsDisplayedLoginForm();
        assertEquals(driver.getCurrentUrl(), "https://localhost:4200/login-register/login");

        justWait();
    }

    @Test
    public void headerAdminTestSuccess() throws InterruptedException {
        //provera da li je neulogovani korisnik i da li se nalazi na login stranici
        headerPage.ensureIsUnauthenticatedUser();
        loginPage.ensureIsDisplayedLoginForm();

        justWait();

        //logovanje
        loginPage.getEmail().sendKeys("admin@admin.com");
        loginPage.getPassword().sendKeys("admin");
        justWait();
        loginPage.getLoginBtn().click();

        justWait();

        //provera da li se nalazi na homepage
        headerPage.ensureIsAdmin();
        homepagePage.ensureIsDisplayedHomepage();
        assertEquals(driver.getCurrentUrl(), "https://localhost:4200/homepage");

        justWait();

        //provera da klikom na add site ide na add site
        headerPage.getAddCulturalSiteBtn().click();
        headerPage.ensureIsAdmin();
        newCulturalSitePage.ensureIsVisibleNewCulturalSiteForm();
        assertEquals(driver.getCurrentUrl(), "https://localhost:4200/admin/new-cultural-site");

        justWait();

        //provera da klikom na categories ide na categories
        headerPage.getCategoriesBtn().click();
        headerPage.ensureIsAdmin();
        categoriesPage.ensureIsDisplayed();
        assertEquals(driver.getCurrentUrl(), "https://localhost:4200/admin/categories");

        justWait();

        //provera da klikom na pending comments ide na pending comments
        headerPage.getPendingCommentsBtn().click();
        headerPage.ensureIsAdmin();
        pendingCommentsPage.ensureIsDisplayedPendingComments();
        assertEquals(driver.getCurrentUrl(), "https://localhost:4200/admin/pending-comments");

        justWait();

        //provera da klikom na view admins ide na view admins
        headerPage.getViewAdminBtn().click();
        headerPage.ensureIsAdmin();
        viewAdminPage.ensureIsDisplayedAdmins();
        assertEquals(driver.getCurrentUrl(), "https://localhost:4200/admin/view-admin");

        justWait();

        //provera da li klikom na my profile ide na my profile
        Actions a= new Actions(driver);
        a.moveToElement(headerPage.getUserDropDown()).build().perform();
        headerPage.getMyProfileBtn().click();
        headerPage.ensureIsAdmin();
        myProfilePage.ensureIsDisplayedMyProfileAuthenticatedUserForm();
        assertEquals(driver.getCurrentUrl(), "https://localhost:4200/profile/my-profile");

        justWait();

        //provera da li klikom na change password ide na change password
        a.moveToElement(headerPage.getUserDropDown()).build().perform();
        headerPage.getChangePasswordBtn().click();
        headerPage.ensureIsAdmin();
        changePasswordPage.ensureIsDisplayedChangePasswordForm();
        assertEquals(driver.getCurrentUrl(), "https://localhost:4200/profile/change-password");

        justWait();

        //provera da li se izloguje klikom na logout
        a.moveToElement(headerPage.getUserDropDown()).build().perform();
        headerPage.getLogoutBtn().click();
        headerPage.ensureIsUnauthenticatedUser();
        loginPage.ensureIsDisplayedLoginForm();
        assertEquals(driver.getCurrentUrl(), "https://localhost:4200/login-register/login");

        justWait();
    }

    /*Omogucava cekanje da bi nam bile vidljivije promene tokom testa*/
    private void justWait() throws InterruptedException {
        synchronized (driver)
        {
            driver.wait(2000);
        }
    }

}
