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

import static com.kts.nvt.serbioneer.constants.ImageConstants.separator;
import static org.junit.Assert.assertEquals;

public class ViewCulturalSiteAdminE2ETest {

    private WebDriver driver;

    private LoginPage loginPage;

    private HeaderPage headerPage;

    private TableViewPage tableViewPage;

    private HomepagePage homepagePage;

    private CulturalSiteViewPage culturalSiteViewPage;

    private PendingCommentsPage pendingCommentsPage;

    private DialogPage dialogPage;

    private AddNewsArticlePage addNewsArticlePage;

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
        addNewsArticlePage = PageFactory.initElements(driver, AddNewsArticlePage.class);

        //redirekcija na pocetak interakcije tj na homepage
        driver.get("https://localhost:4200/login-register/login");

        justWait();

        loginPage.getEmail().sendKeys("admin@admin.com");
        loginPage.getPassword().sendKeys("admin");

        justWait();

        loginPage.getLoginBtn().click();

        justWait();

        List<WebElement> rows = tableViewPage.getCulturalSiteTable().findElements(By.tagName("tr"));

        List<WebElement> data = tableViewPage.getCulturalSiteTable().findElements(By.tagName("td"));

        String name = data.get(0).getText();
        String address = data.get(3).getText() + ", " + data.get(4).getText();

        rows.get(1).click();

        culturalSiteViewPage.ensureIsDisplayedUnauthenticatedUser();

        justWait();

        assertEquals(driver.getCurrentUrl(), "https://localhost:4200/cultural-site/1");
        assertEquals(name, culturalSiteViewPage.getCulturalSiteName().getText());
        assertEquals(address, culturalSiteViewPage.getCulturalSiteAddress().getText());
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

        WebElement image = driver.findElement(By.xpath("(//*[@title=\"news3\"])[1]"));

        image.click();

        justWait();

        Actions action = new Actions(driver);
        action.sendKeys(Keys.ESCAPE).perform();

        justWait();
    }

    @Test
    public void viewCommentsTestSuccess() throws InterruptedException {

        culturalSiteViewPage.getCommentsPanel().click();

        justWait();
    }

    @Test
    public void addImageTestSuccess() throws InterruptedException {

        culturalSiteViewPage.getAddImageBtn().click();

        justWait();

        culturalSiteViewPage.getNewImageInput().sendKeys("C:\\Users\\Ksenija\\Desktop\\Keva\\IMG_20191012_201221.jpg");

        justWait();

        culturalSiteViewPage.getSubmitNewImageBtn().click();

        justWait();

        WebElement image = driver.findElement(By.xpath("(//*[@title=\"IMG_20191012_201221.jpg\"])[1]"));

        image.click();

        justWait();

        Actions action = new Actions(driver);
        action.sendKeys(Keys.ESCAPE).perform();

        justWait();
    }

    @Test
    public void addImageTestError() throws InterruptedException {

        culturalSiteViewPage.getAddImageBtn().click();

        justWait();

        culturalSiteViewPage.getNewImageInput().sendKeys("C:\\Users\\Ksenija\\Desktop\\Keva\\KSENIJA.docx");

        justWait();

        culturalSiteViewPage.getSubmitNewImageBtn().click();

        synchronized (driver)
        {
            driver.wait(500);
        }

        assertEquals(culturalSiteViewPage.getToast().getText(), "You can only upload images");

        justWait();
    }

    @Test
    public void addNewsTestSuccess() throws InterruptedException {

        culturalSiteViewPage.getAddNewsBtn().click();

        justWait();

        addNewsArticlePage.getTextInput().sendKeys("Nova vest");

        justWait();

        addNewsArticlePage.getSubmitNewNewsBtn().click();

        synchronized (driver)
        {
            driver.wait(500);
        }

        assertEquals(culturalSiteViewPage.getToast().getText(), "Successfully added news for cultural site!");

        justWait();

    }

    @Test
    public void addNewsTestEmptyFieldError() throws InterruptedException {

        culturalSiteViewPage.getAddNewsBtn().click();

        justWait();

        addNewsArticlePage.getTextInput().sendKeys("");

        justWait();

        addNewsArticlePage.getSubmitNewNewsBtn().click();

        synchronized (driver)
        {
            driver.wait(500);
        }

        assertEquals(addNewsArticlePage.getNameError().getText(), "Required field");

        justWait();

    }

    @After
    public void cleanUp() {

        driver.quit();

    }

    /*Omogucava cekanje da bi nam bile vidljivije promene tokom testa*/
    private void justWait() throws InterruptedException {
        synchronized (driver)
        {
            driver.wait(2500);
        }
    }
}
