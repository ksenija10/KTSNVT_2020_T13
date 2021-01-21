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
import org.openqa.selenium.support.PageFactory;

import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class HomepageE2ETest {

    private WebDriver driver;

    private HeaderPage headerPage;

    private TableViewPage tableViewPage;

    private HomepagePage homepagePage;

    private LoginPage loginPage;

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
        loginPage = PageFactory.initElements(driver, LoginPage.class);

        //redirekcija na pocetak interakcije tj na homepage
        driver.get("http://localhost:4200/homepage");
    }

    @Test
    public void filterByCategoryTestSuccess() throws InterruptedException {
        justWait();

        homepagePage.ensureIsDisplayedHomepage();

        tableViewPage.ensureIsDisplayedTableView();

        //broj elemenata u tabeli pre filter
        String text = tableViewPage.getPaginator().getText();
        String[] bits = text.split(" ");
        int beforeFilter = Integer.parseInt(bits[bits.length-1]);

        homepagePage.getCategoryChips().sendKeys("Institucija");
        homepagePage.getCategoryChips().sendKeys(Keys.ENTER);

        justWait();

        homepagePage.getFilterBtn().click();
        justWait();

        text = tableViewPage.getPaginator().getText();
        bits = text.split(" ");

        //provera da je broj elemenata u tabeli posle filtera manji
        assertTrue(Integer.parseInt(bits[bits.length-1]) < beforeFilter);

        //provera da prvi element u tabeli ima kategoriju institucija => pretpostavka da je filtriranje bilo
        //uspesno i da svi imaju
        List<WebElement> rows = tableViewPage.getCulturalSiteTable().findElements(By.tagName("td"));

        assertEquals(rows.get(1).getText(), "Institucija");
    }

    @Test
    public void filterByNameTestSuccess() throws InterruptedException {
        justWait();

        homepagePage.ensureIsDisplayedHomepage();

        tableViewPage.ensureIsDisplayedTableView();

        //broj elemenata u tabeli pre filter
        String text = tableViewPage.getPaginator().getText();
        String[] bits = text.split(" ");
        int beforeFilter = Integer.parseInt(bits[bits.length-1]);

        homepagePage.getCulturalSiteNameInput().sendKeys("biblioteka");

        justWait();

        homepagePage.getFilterBtn().click();
        justWait();

        text = tableViewPage.getPaginator().getText();
        bits = text.split(" ");

        //provera da je broj elemenata u tabeli posle filtera manji
        assertTrue(Integer.parseInt(bits[bits.length-1]) < beforeFilter);

        //provera da prvi element u tabeli ima podstring biblioteka => pretpostavka da je filtriranje bilo
        //uspesno i da svi imaju
        List<WebElement> rows = tableViewPage.getCulturalSiteTable().findElements(By.tagName("td"));

        assertTrue(rows.get(0).getText().toLowerCase().contains("biblioteka"));
    }

    @Test
    public void filterByLocationTestSuccess() throws InterruptedException {
        justWait();

        homepagePage.ensureIsDisplayedHomepage();

        tableViewPage.ensureIsDisplayedTableView();

        //broj elemenata u tabeli pre filter
        String text = tableViewPage.getPaginator().getText();
        String[] bits = text.split(" ");
        int beforeFilter = Integer.parseInt(bits[bits.length-1]);

        homepagePage.getCulturalSiteLocationSelect().sendKeys("Novi Sad");

        justWait();

        homepagePage.getFilterBtn().click();
        justWait();

        text = tableViewPage.getPaginator().getText();
        bits = text.split(" ");

        //provera da je broj elemenata u tabeli posle filtera manji
        assertTrue(Integer.parseInt(bits[bits.length-1]) < beforeFilter);

        //provera da prvi element u tabeli ima lokaciju => pretpostavka da je filtriranje bilo
        //uspesno i da svi imaju
        List<WebElement> rows = tableViewPage.getCulturalSiteTable().findElements(By.tagName("td"));

        assertEquals(rows.get(4).getText(), "Novi Sad");
    }

    @Test
    public void filterByCategoryAndLocationAndNameTestSuccess() throws InterruptedException {
        justWait();

        homepagePage.ensureIsDisplayedHomepage();

        tableViewPage.ensureIsDisplayedTableView();

        //broj elemenata u tabeli pre filter
        String text = tableViewPage.getPaginator().getText();
        String[] bits = text.split(" ");
        int beforeFilter = Integer.parseInt(bits[bits.length-1]);

        homepagePage.getCategoryChips().sendKeys("Manifestacija");
        homepagePage.getCategoryChips().sendKeys(Keys.ENTER);
        homepagePage.getCulturalSiteLocationSelect().sendKeys("Beograd");
        homepagePage.getCulturalSiteNameInput().sendKeys("sajam");

        justWait();

        homepagePage.getFilterBtn().click();
        justWait();

        text = tableViewPage.getPaginator().getText();
        bits = text.split(" ");

        //provera da je broj elemenata u tabeli posle filtera manji
        assertTrue(Integer.parseInt(bits[bits.length-1]) < beforeFilter);

        //provera da prvi element u tabeli ima lokaciju => pretpostavka da je filtriranje bilo
        //uspesno i da svi imaju
        List<WebElement> rows = tableViewPage.getCulturalSiteTable().findElements(By.tagName("td"));

        assertEquals(rows.get(1).getText(), "Manifestacija");
        assertEquals(rows.get(4).getText(), "Beograd");
        assertTrue(rows.get(0).getText().toLowerCase().contains("sajam"));
    }

    @Test
    public void filterByCategoryAndLocationAndNameTestNoMatchSuccess() throws InterruptedException {
        justWait();

        homepagePage.ensureIsDisplayedHomepage();

        tableViewPage.ensureIsDisplayedTableView();

        homepagePage.getCategoryChips().sendKeys("Manifestacija");
        homepagePage.getCategoryChips().sendKeys(Keys.ENTER);
        homepagePage.getCulturalSiteLocationSelect().sendKeys("Novi Sad");
        homepagePage.getCulturalSiteNameInput().sendKeys("sajam");

        justWait();

        homepagePage.getFilterBtn().click();
        justWait();

        //provera da li je tabela prazna
        List<WebElement> rows = tableViewPage.getCulturalSiteTable().findElements(By.tagName("tr"));

        assertEquals(rows.get(1).getText(), "No existing cultural sites.");
    }
    
    @After
    public void cleanUp() {

        driver.quit();

    }

    /*Omogucava cekanje da bi nam bile vidljivije promene tokom testa*/
    private void justWait() throws InterruptedException {
        synchronized (driver)
        {
            driver.wait(2000);
        }
    }
}
