package com.kts.nvt.serbioneer.e2e;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.PageFactory;

import com.kts.nvt.serbioneer.e2e.pages.CulturalSiteViewPage;
import com.kts.nvt.serbioneer.e2e.pages.DialogPage;
import com.kts.nvt.serbioneer.e2e.pages.HeaderPage;
import com.kts.nvt.serbioneer.e2e.pages.LoginPage;
import com.kts.nvt.serbioneer.e2e.pages.NewCulturalSitePage;

public class NewCulturalSiteE2ETest {

    private WebDriver driver;

    private HeaderPage headerPage;

    private NewCulturalSitePage newCulturalSitePage;

    private LoginPage loginPage;
    
    private CulturalSiteViewPage culturalSiteViewPage;
    
    private DialogPage dialogPage;


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
        culturalSiteViewPage = PageFactory.initElements(driver, CulturalSiteViewPage.class);
        dialogPage = PageFactory.initElements(driver, DialogPage.class);

        driver.get("https://localhost:4200/login-register/login");
        justWait();
        loginPage.getEmail().sendKeys("admin@admin.com");
        loginPage.getPassword().sendKeys("admin");
        justWait();
        loginPage.getLoginBtn().click();
        justWait();

        headerPage.getAddCulturalSiteBtn().click();
    }

    @Test
    public void AddAndDeleteNewCulturalSiteTestSuccess() throws InterruptedException {
        justWait();
        headerPage.ensureIsAdmin();

        newCulturalSitePage.ensureIsVisibleNewCulturalSiteForm();

        assertFalse(newCulturalSitePage.getAddButton().isEnabled());

        newCulturalSitePage.getName().sendKeys("Novo ime");
        newCulturalSitePage.getAddress().sendKeys("Voj");
        justWait();
        newCulturalSitePage.getAddress().sendKeys(Keys.ARROW_DOWN);
        newCulturalSitePage.getDescription().sendKeys("Novo kulturno dobro");
        newCulturalSitePage.getType().sendKeys(Keys.ARROW_DOWN);
        assertTrue(newCulturalSitePage.getAddButton().isEnabled());
        justWait();

        String oldUrl = driver.getCurrentUrl();
        newCulturalSitePage.getAddButton().click();
        justWait();
        newCulturalSitePage.toastSuccess();
        justWait();

        assertNotEquals(oldUrl, driver.getCurrentUrl());
        
        justWait();
        culturalSiteViewPage.getDeleteBtn().click();
        justWait();
        dialogPage.getDialogYes().click();
        justWait();
        
        assertEquals("https://localhost:4200/homepage", driver.getCurrentUrl());
    }

    @Test
    public void AddNewCulturalSiteTestEmptyName() throws InterruptedException {
        justWait();
        headerPage.ensureIsAdmin();

        newCulturalSitePage.ensureIsVisibleNewCulturalSiteForm();

        assertFalse(newCulturalSitePage.getAddButton().isEnabled());
        newCulturalSitePage.getName().sendKeys("");
        newCulturalSitePage.getAddress().sendKeys("Voj");

        assertFalse(newCulturalSitePage.getAddButton().isEnabled());
        justWait();
        assertEquals(newCulturalSitePage.getNameError().getText(), "Required field");

    }

    @Test
    public void AddNewCulturalSiteTestEmptyAddress() throws InterruptedException {
        justWait();
        headerPage.ensureIsAdmin();

        newCulturalSitePage.ensureIsVisibleNewCulturalSiteForm();

        assertFalse(newCulturalSitePage.getAddButton().isEnabled());
        newCulturalSitePage.getAddress().sendKeys("");
        newCulturalSitePage.getName().sendKeys("Ime");

        assertFalse(newCulturalSitePage.getAddButton().isEnabled());
        justWait();
        assertEquals(newCulturalSitePage.getAddressError().getText(), "Required field");
        assertEquals("", newCulturalSitePage.getLatituide().getText());

    }

    @Test
    public void AddNewCulturalSiteTestEmptyLatitude() throws InterruptedException{
        justWait();
        headerPage.ensureIsAdmin();

        newCulturalSitePage.ensureIsVisibleNewCulturalSiteForm();
        newCulturalSitePage.getAddress().sendKeys("Voj");
        assertFalse(newCulturalSitePage.getAddButton().isEnabled());
        justWait();
        assertEquals("", newCulturalSitePage.getLatituide().getText());
        assertFalse(newCulturalSitePage.getAddButton().isEnabled());
    }

    @Test
    public void AddNewCulturalSiteTestEmptyLongitude() throws InterruptedException{
        justWait();
        headerPage.ensureIsAdmin();

        newCulturalSitePage.ensureIsVisibleNewCulturalSiteForm();
        assertFalse(newCulturalSitePage.getAddButton().isEnabled());
        newCulturalSitePage.getAddress().sendKeys("Voj");
        justWait();
        assertEquals("", newCulturalSitePage.getLongitude().getText());
        assertFalse(newCulturalSitePage.getAddButton().isEnabled());
    }

    @Test
    public void AddNewCulturalSiteTestEmptyType() throws InterruptedException{
        justWait();
        headerPage.ensureIsAdmin();

        newCulturalSitePage.ensureIsVisibleNewCulturalSiteForm();
        assertFalse(newCulturalSitePage.getAddButton().isEnabled());
        newCulturalSitePage.getName().sendKeys("Name");
        justWait();
        assertEquals(" ", newCulturalSitePage.getType().getText());
        assertFalse(newCulturalSitePage.getAddButton().isEnabled());
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
