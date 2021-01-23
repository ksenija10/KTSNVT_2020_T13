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
import org.openqa.selenium.support.PageFactory;

import java.util.List;

import static org.junit.Assert.*;

public class EditCulturalSiteE2ETest {
    private WebDriver driver;

    private HeaderPage headerPage;

    private NewCulturalSitePage newCulturalSitePage;

    private LoginPage loginPage;

    private TableViewPage tableViewPage;

    private CulturalSiteViewPage culturalSiteViewPage;

    @Before
    public void setUp() throws InterruptedException{
        System.setProperty("webdriver.chrome.driver", "src/test/resources/chromedriver.exe");
        ChromeOptions option= new ChromeOptions();
        option.addArguments("ignore-certificate-errors");
        driver = new ChromeDriver(option);

        driver.manage().window().maximize();

        headerPage = PageFactory.initElements(driver, HeaderPage.class);
        newCulturalSitePage = PageFactory.initElements(driver, NewCulturalSitePage.class);
        loginPage = PageFactory.initElements(driver, LoginPage.class);
        tableViewPage = PageFactory.initElements(driver, TableViewPage.class);
        culturalSiteViewPage = PageFactory.initElements(driver, CulturalSiteViewPage.class);

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

        rows.get(3).click();

        justWait();

        culturalSiteViewPage.getEditBtn().click();
    }

    @Test
    public void EditCulturalSiteTestSuccess() throws InterruptedException{
        justWait();
        headerPage.ensureIsAdmin();

        newCulturalSitePage.ensureIsVisibleNewCulturalSiteForm();

        assertTrue(newCulturalSitePage.getAddButton().isEnabled());

        newCulturalSitePage.getName().clear();
        newCulturalSitePage.getName().sendKeys("Novo ime");
        newCulturalSitePage.getAddress().clear();
        newCulturalSitePage.getAddress().sendKeys("Sremska Mitrovic");
        justWait();
        newCulturalSitePage.getAddress().sendKeys(Keys.ARROW_DOWN);

        newCulturalSitePage.getAddButton().click();
        justWait();
        newCulturalSitePage.toastSuccessEdit();
        justWait();
        assertEquals("https://localhost:4200/cultural-site/3", driver.getCurrentUrl());
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
