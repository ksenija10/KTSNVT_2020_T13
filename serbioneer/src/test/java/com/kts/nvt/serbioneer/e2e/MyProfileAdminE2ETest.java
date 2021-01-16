package com.kts.nvt.serbioneer.e2e;

import com.kts.nvt.serbioneer.e2e.pages.HeaderPage;
import com.kts.nvt.serbioneer.e2e.pages.HomepagePage;
import com.kts.nvt.serbioneer.e2e.pages.LoginPage;
import com.kts.nvt.serbioneer.e2e.pages.MyProfilePage;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.PageFactory;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertFalse;

public class MyProfileAdminE2ETest {

    private WebDriver driver;

    private HeaderPage headerPage;

    private MyProfilePage myProfilePage;

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
        myProfilePage = PageFactory.initElements(driver, MyProfilePage.class);
        homepagePage = PageFactory.initElements(driver, HomepagePage.class);
        loginPage = PageFactory.initElements(driver, LoginPage.class);

        //redirekcija na pocetak interakcije tj na log in page
        driver.get("http://localhost:4200/login-register/login");

        //logovanje
        justWait();

        loginPage.getEmail().sendKeys("admin@admin.com");

        loginPage.getPassword().sendKeys("admin");

        justWait();

        loginPage.getLoginBtn().click();

        justWait();

        driver.get("http://localhost:4200/my-profile");
    }

    @Test
    public void editProfileTestSuccess() throws InterruptedException {
        //izmena licnih podataka
        justWait();

        myProfilePage.ensureIsDisplayedMyProfileAdminForm();

        headerPage.ensureIsAdmin();

        assertTrue(myProfilePage.getSaveBtn().isEnabled());

        myProfilePage.getName().clear();
        myProfilePage.getName().sendKeys("Mario");

        myProfilePage.getSurname().clear();
        myProfilePage.getSurname().sendKeys("Filipovic");

        clearField(myProfilePage.getDate(), myProfilePage.getDate().getAttribute("value").length());
        myProfilePage.getDate().sendKeys("1/1/1998");

        justWait();

        assertTrue(myProfilePage.getSaveBtn().isEnabled());

        justWait();

        myProfilePage.getSaveBtn().click();

        myProfilePage.toastSuccess();

        homepagePage.ensureIsDisplayedHomepage();

        headerPage.ensureIsAdmin();

        assertEquals("http://localhost:4200/homepage", driver.getCurrentUrl());

        //vracanje licnih podataka na staro zbog konzistentnosti baze

        driver.get("http://localhost:4200/my-profile");

        justWait();

        myProfilePage.getName().clear();
        myProfilePage.getName().sendKeys("Ksenija");

        myProfilePage.getSurname().clear();
        myProfilePage.getSurname().sendKeys("Prcic");

        clearField(myProfilePage.getDate(), myProfilePage.getDate().getAttribute("value").length());
        myProfilePage.getDate().sendKeys("6/23/2016");

        justWait();

        justWait();

        myProfilePage.getSaveBtn().click();

        assertEquals("http://localhost:4200/homepage", driver.getCurrentUrl());
    }

    @Test
    public void editProfileTestNameEmpty() throws InterruptedException {
        //izmena licnih podataka
        justWait();

        myProfilePage.ensureIsDisplayedMyProfileAdminForm();

        headerPage.ensureIsAdmin();

        assertTrue(myProfilePage.getSaveBtn().isEnabled());

        clearField(myProfilePage.getName(), myProfilePage.getName().getAttribute("value").length());
        myProfilePage.getSurname().click();

        justWait();

        assertFalse(myProfilePage.getSaveBtn().isEnabled());

        assertEquals(myProfilePage.getNameError().getText(), "Required field");

        myProfilePage.ensureIsDisplayedMyProfileAdminForm();

        headerPage.ensureIsAdmin();

        justWait();

        assertEquals("http://localhost:4200/my-profile", driver.getCurrentUrl());
    }

    @Test
    public void editProfileTestNameInvalid() throws InterruptedException {
        //izmena licnih podataka
        justWait();

        myProfilePage.ensureIsDisplayedMyProfileAdminForm();

        headerPage.ensureIsAdmin();

        assertTrue(myProfilePage.getSaveBtn().isEnabled());

        clearField(myProfilePage.getName(), myProfilePage.getName().getAttribute("value").length());
        myProfilePage.getName().sendKeys("ksenija");
        myProfilePage.getSurname().click();

        justWait();

        assertFalse(myProfilePage.getSaveBtn().isEnabled());

        assertEquals(myProfilePage.getNameError().getText(), "Must start with capital letter");

        myProfilePage.ensureIsDisplayedMyProfileAdminForm();

        headerPage.ensureIsAdmin();

        justWait();

        assertEquals("http://localhost:4200/my-profile", driver.getCurrentUrl());
    }

    @Test
    public void editProfileTestSurnameEmpty() throws InterruptedException {
        //izmena licnih podataka
        justWait();

        myProfilePage.ensureIsDisplayedMyProfileAdminForm();

        headerPage.ensureIsAdmin();

        assertTrue(myProfilePage.getSaveBtn().isEnabled());

        clearField(myProfilePage.getSurname(), myProfilePage.getSurname().getAttribute("value").length());
        myProfilePage.getSurname().sendKeys("");
        myProfilePage.getName().click();

        justWait();

        assertFalse(myProfilePage.getSaveBtn().isEnabled());

        assertEquals(myProfilePage.getSurnameError().getText(), "Required field");

        myProfilePage.ensureIsDisplayedMyProfileAdminForm();

        headerPage.ensureIsAdmin();

        justWait();

        assertEquals("http://localhost:4200/my-profile", driver.getCurrentUrl());
    }

    @Test
    public void editProfileTestSurnameInvalid() throws InterruptedException {
        //izmena licnih podataka
        justWait();

        myProfilePage.ensureIsDisplayedMyProfileAdminForm();

        headerPage.ensureIsAdmin();

        assertTrue(myProfilePage.getSaveBtn().isEnabled());

        clearField(myProfilePage.getSurname(), myProfilePage.getSurname().getAttribute("value").length());
        myProfilePage.getSurname().sendKeys("Pr3%");
        myProfilePage.getName().click();

        justWait();

        assertFalse(myProfilePage.getSaveBtn().isEnabled());

        assertEquals(myProfilePage.getSurnameError().getText(), "Cannot contain special characters or numbers");

        myProfilePage.ensureIsDisplayedMyProfileAdminForm();

        headerPage.ensureIsAdmin();

        justWait();

        assertEquals("http://localhost:4200/my-profile", driver.getCurrentUrl());
    }

    @Test
    public void editProfileTestDateInvalid() throws InterruptedException {
        //izmena licnih podataka
        justWait();

        myProfilePage.ensureIsDisplayedMyProfileAdminForm();

        headerPage.ensureIsAdmin();

        assertTrue(myProfilePage.getSaveBtn().isEnabled());

        clearField(myProfilePage.getDate(), myProfilePage.getDate().getAttribute("value").length());
        myProfilePage.getDate().sendKeys("invalidDate");
        myProfilePage.getName().click();
        assertEquals(myProfilePage.getDateError().getText(), "Invalid date format");

        justWait();

        assertFalse(myProfilePage.getSaveBtn().isEnabled());

        myProfilePage.ensureIsDisplayedMyProfileAdminForm();

        headerPage.ensureIsAdmin();

        justWait();

        assertEquals("http://localhost:4200/my-profile", driver.getCurrentUrl());
    }

    @Test
    public void editProfileTestAllRequiredFieldsEmpty() throws InterruptedException {
        //izmena licnih podataka
        justWait();

        myProfilePage.ensureIsDisplayedMyProfileAdminForm();

        headerPage.ensureIsAdmin();

        assertTrue(myProfilePage.getSaveBtn().isEnabled());

        clearField(myProfilePage.getName(), myProfilePage.getName().getAttribute("value").length());
        clearField(myProfilePage.getSurname(), myProfilePage.getSurname().getAttribute("value").length());

        myProfilePage.getDate().click();

        justWait();

        assertFalse(myProfilePage.getSaveBtn().isEnabled());

        assertEquals(myProfilePage.getNameError().getText(), "Required field");
        assertEquals(myProfilePage.getSurnameError().getText(), "Required field");

        myProfilePage.ensureIsDisplayedMyProfileAdminForm();

        headerPage.ensureIsAdmin();

        justWait();

        assertEquals("http://localhost:4200/my-profile", driver.getCurrentUrl());
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
            driver.wait(2000);
        }
    }
}
