package com.kts.nvt.serbioneer.e2e;

import com.kts.nvt.serbioneer.e2e.pages.CulturalSiteViewPage;
import com.kts.nvt.serbioneer.e2e.pages.HeaderPage;
import com.kts.nvt.serbioneer.e2e.pages.HomepagePage;
import com.kts.nvt.serbioneer.e2e.pages.TableViewPage;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;

import java.util.List;

import static org.junit.Assert.assertEquals;

public class ViewCulturalSiteUnauthenticatedUserE2ETest {

    private WebDriver driver;

    private HeaderPage headerPage;

    private TableViewPage tableViewPage;

    private HomepagePage homepagePage;

    private CulturalSiteViewPage culturalSiteViewPage;

    @Before
    public void setUp() throws InterruptedException {
        //default-ni browser za selenium je firefox, pa ukoliko zelimo da koristimo chrome moramo da ubacimo
        //chrome ekstenziju i podesimo chrome kao default-ni driver
        System.setProperty("webdriver.chrome.driver", "src/test/resources/chromedriver.exe");
        driver = new ChromeDriver();

        //prosirenje prozora za bolji pregled
        driver.manage().window().maximize();
        //instanciranje potrebnih page objekata
        headerPage = PageFactory.initElements(driver, HeaderPage.class);
        tableViewPage = PageFactory.initElements(driver, TableViewPage.class);
        homepagePage = PageFactory.initElements(driver, HomepagePage.class);
        culturalSiteViewPage = PageFactory.initElements(driver, CulturalSiteViewPage.class);

        //redirekcija na pocetak interakcije tj na homepage
        driver.get("http://localhost:4200/homepage");

        justWait();

        headerPage.ensureIsUnauthenticatedUser();

        homepagePage.ensureIsDisplayedHomepage();

        tableViewPage.ensureIsDisplayedTableView();

        justWait();

        List<WebElement> rows = tableViewPage.getCulturalSiteTable().findElements(By.tagName("tr"));

        List<WebElement> data = tableViewPage.getCulturalSiteTable().findElements(By.tagName("td"));

        String name = data.get(0).getText();
        String address = data.get(3).getText() + ", " + data.get(4).getText();

        rows.get(1).click();

        culturalSiteViewPage.ensureIsDisplayedUnauthenticatedUser();

        justWait();

        assertEquals(driver.getCurrentUrl(), "http://localhost:4200/cultural-site/1");
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
