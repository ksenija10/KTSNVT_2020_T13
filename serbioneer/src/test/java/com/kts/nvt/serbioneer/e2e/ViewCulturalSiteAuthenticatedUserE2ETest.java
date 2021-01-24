package com.kts.nvt.serbioneer.e2e;

import com.kts.nvt.serbioneer.e2e.pages.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;

import java.util.List;

import static org.junit.Assert.assertEquals;

public class ViewCulturalSiteAuthenticatedUserE2ETest {

    private WebDriver driver;

    private LoginPage loginPage;

    private HeaderPage headerPage;

    private TableViewPage tableViewPage;

    private HomepagePage homepagePage;

    private CulturalSiteViewPage culturalSiteViewPage;

    private PendingCommentsPage pendingCommentsPage;

    private DialogPage dialogPage;

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
        tableViewPage = PageFactory.initElements(driver, TableViewPage.class);
        homepagePage = PageFactory.initElements(driver, HomepagePage.class);
        culturalSiteViewPage = PageFactory.initElements(driver, CulturalSiteViewPage.class);
        pendingCommentsPage = PageFactory.initElements(driver, PendingCommentsPage.class);
        dialogPage = PageFactory.initElements(driver, DialogPage.class);

        //redirekcija na pocetak interakcije tj na homepage
        driver.get("https://localhost:4200/login-register/login");

        justWait();

        loginPage.getEmail().sendKeys("drugi@user.com");
        loginPage.getPassword().sendKeys("user");

        justWait();

        loginPage.getLoginBtn().click();

        justWait();

        List<WebElement> rows = tableViewPage.getCulturalSiteTable().findElements(By.tagName("tr"));

        List<WebElement> data = tableViewPage.getCulturalSiteTable().findElements(By.tagName("td"));

        String name = data.get(5).getText();
        String address = data.get(8).getText() + ", " + data.get(9).getText();

        rows.get(2).click();

        culturalSiteViewPage.ensureIsDisplayedUnauthenticatedUser();

        justWait();

        assertEquals(driver.getCurrentUrl(), "https://localhost:4200/cultural-site/2");
        assertEquals(name, culturalSiteViewPage.getCulturalSiteName().getText());
        assertEquals(address, culturalSiteViewPage.getCulturalSiteAddress().getText());
    }

    @Test
    public void subscribeAndUnsubscribeTestSuccess() throws InterruptedException {
        //podaci o cultural site na koji se subscribe
        String name = culturalSiteViewPage.getCulturalSiteName().getText();
        //provera da li je moze da se subscribe
        assertEquals(culturalSiteViewPage.getSubscribeBtn().getText(), "Subscribe");

        culturalSiteViewPage.getSubscribeBtn().click();

        synchronized (driver)
        {
            driver.wait(500);
        }

        assertEquals(culturalSiteViewPage.getToast().getText(), "Successfully subscribed to cultural site!");

        justWait();

        //da li se kulturno dobro nalazi u subscribed
        headerPage.getSubscribedBtn().click();

        justWait();

        List<WebElement> data = tableViewPage.getCulturalSiteTable().findElements(By.tagName("td"));
        assertEquals(name, data.get(0).getText());

        List<WebElement> rows = tableViewPage.getCulturalSiteTable().findElements(By.tagName("tr"));
        rows.get(1).click();

        justWait();
        //unsubscribe
        assertEquals(culturalSiteViewPage.getSubscribeBtn().getText(), "Unsubscribe");
        culturalSiteViewPage.getSubscribeBtn().click();

        synchronized (driver)
        {
            driver.wait(500);
        }

        assertEquals(culturalSiteViewPage.getToast().getText(), "Successfully unsubscribed from cultural site. Sad to see you leave.");

        justWait();
        //da li se kulturno dobro vise ne nalazi u subscribed
        headerPage.getSubscribedBtn().click();

        //provera da li je tabela prazna
        rows = tableViewPage.getCulturalSiteTable().findElements(By.tagName("tr"));

        assertEquals(rows.get(1).getText(), "No existing cultural sites.");
        justWait();

    }

    @Test
    public void rateCulturalSiteTestSuccess() throws InterruptedException {
        WebElement fiveStarBtn = driver.findElement(By.xpath("(//*[@class=\"ng-star-inserted\"])[6]"));

        fiveStarBtn.click();

        justWait();

        assertEquals(culturalSiteViewPage.getRating().getText(), "5");

        justWait();
    }

    @Test
    public void viewNewsTestSuccess() throws InterruptedException {

        culturalSiteViewPage.getNewsPanel().click();

        justWait();

        WebElement nextPageBtn = driver.findElement(By.xpath("(//*[@aria-label=\"Next page\"])[1]"));

        nextPageBtn.click();

        justWait();

        WebElement previousPageBtn = driver.findElement(By.xpath("(//*[@aria-label=\"Previous page\"])[1]"));

        previousPageBtn.click();

        justWait();

        WebElement image = driver.findElement(By.xpath("(//*[@title=\"news6\"])[1]"));

        image.click();

        justWait();

        Actions action = new Actions(driver);
        action.sendKeys(Keys.ESCAPE).perform();

        justWait();
    }

    @Test
    public void viewCommentsAndEditTestSuccess() throws InterruptedException {

        culturalSiteViewPage.getCommentsPanel().click();

        justWait();

        WebElement editBtn = driver.findElement(By.xpath("(//*[@color=\"primary\"])[1]"));

        editBtn.click();

        WebElement editCommentInput = driver.findElement(By.id("edit-comment-input"));

        clearField(editCommentInput, editCommentInput.getAttribute("value").length());

        justWait();

        editCommentInput.sendKeys("Neverovatni talenti!");

        WebElement saveBtn = driver.findElement(By.id("save-comment"));

        justWait();

        saveBtn.click();

        justWait();

        editBtn.click();

        justWait();

        editCommentInput = driver.findElement(By.id("edit-comment-input"));

        clearField(editCommentInput, editCommentInput.getAttribute("value").length());

        justWait();

        editCommentInput.sendKeys("Zište");

        justWait();

        saveBtn = driver.findElement(By.id("save-comment"));

        saveBtn.click();

        justWait();
    }

    @Test
    public void addCommentTestEmptyFieldError() throws InterruptedException {

        culturalSiteViewPage.getCommentsPanel().click();

        justWait();

        culturalSiteViewPage.getLeaveReviewBtn().click();

        justWait();

        culturalSiteViewPage.getAddCommentInput().sendKeys("");

        justWait();

        culturalSiteViewPage.getAddCommentBtn().click();
        assertEquals(culturalSiteViewPage.getNewCommentError().getText(), "Required field");

        justWait();

    }

    @Test
    public void addCommentAndDeleteTestSuccess() throws InterruptedException {

        //korisnik je napisao komentar koji je otisao na review
        culturalSiteViewPage.getCommentsPanel().click();

        justWait();

        culturalSiteViewPage.getLeaveReviewBtn().click();

        justWait();

        culturalSiteViewPage.getAddCommentInput().sendKeys("Novi komentar");

        justWait();

        culturalSiteViewPage.getAddCommentBtn().click();

        synchronized (driver)
        {
            driver.wait(500);
        }

        assertEquals(culturalSiteViewPage.getToast().getText(), "Successfully reviewed cultural site! Your review will be visible after approval.");

        justWait();

        //admin odobrava komentar
        Actions a= new Actions(driver);
        a.moveToElement(headerPage.getUserDropDown()).build().perform();
        headerPage.getLogoutBtn().click();

        justWait();

        loginPage.getEmail().sendKeys("admin@admin.com");
        loginPage.getPassword().sendKeys("admin");

        justWait();

        loginPage.getLoginBtn().click();

        justWait();

        headerPage.getPendingCommentsBtn().click();

        justWait();

        pendingCommentsPage.getLastPage().click();

        justWait();

        pendingCommentsPage.getAcceptLastComm().click();

        justWait();

        //korisnik se loguje i brise odobren komentar
        a.moveToElement(headerPage.getUserDropDown()).build().perform();
        headerPage.getLogoutBtn().click();

        justWait();

        loginPage.getEmail().sendKeys("drugi@user.com");
        loginPage.getPassword().sendKeys("user");

        justWait();

        loginPage.getLoginBtn().click();

        justWait();

        List<WebElement> rows = tableViewPage.getCulturalSiteTable().findElements(By.tagName("tr"));
        rows.get(2).click();

        justWait();

        culturalSiteViewPage.getCommentsPanel().click();

        justWait();

        culturalSiteViewPage.getLastPageComment().click();

        justWait();

        culturalSiteViewPage.getDeleteLastComment().click();

        justWait();

        dialogPage.getDialogYes().click();

        justWait();
    }

    @After
    public void cleanUp() {

        driver.quit();

    }

    private void clearField(WebElement field, int backspaces) {
        for(int i = 0; i <=backspaces; i++ ){
            field.sendKeys(Keys.BACK_SPACE);
        }
    }

    /*Omogucava cekanje da bi nam bile vidljivije promene tokom testa*/
    private void justWait() throws InterruptedException {
        synchronized (driver)
        {
            driver.wait(2500);
        }
    }
}
