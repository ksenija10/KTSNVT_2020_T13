package com.kts.nvt.serbioneer.e2e;

import com.kts.nvt.serbioneer.e2e.pages.HeaderPage;
import com.kts.nvt.serbioneer.e2e.pages.HomepagePage;
import com.kts.nvt.serbioneer.e2e.pages.LoginPage;
import com.kts.nvt.serbioneer.e2e.pages.MyProfilePage;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class MyProfileAuthenticatedUserE2ETest {

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
        ChromeOptions option= new ChromeOptions();
        option.addArguments("ignore-certificate-errors");
        driver = new ChromeDriver(option);

        //prosirenje prozora za bolji pregled
        driver.manage().window().maximize();
        //instanciranje potrebnih page objekata
        headerPage = PageFactory.initElements(driver, HeaderPage.class);
        myProfilePage = PageFactory.initElements(driver, MyProfilePage.class);
        homepagePage = PageFactory.initElements(driver, HomepagePage.class);
        loginPage = PageFactory.initElements(driver, LoginPage.class);

        //redirekcija na pocetak interakcije tj na log in page
        driver.get("https://localhost:4200/login-register/login");

        //logovanje
        justWait();

        loginPage.getEmail().sendKeys("prvi@user.com");

        loginPage.getPassword().sendKeys("user");

        justWait();

        loginPage.getLoginBtn().click();

        justWait();

        Actions a= new Actions(driver);
        a.moveToElement(headerPage.getUserDropDown()).build().perform();

        justWait();

        headerPage.getMyProfileBtn().click();
    }

    @Test
    public void editProfileTestSuccess() throws InterruptedException {
        //izmena licnih podataka
        justWait();

        myProfilePage.ensureIsDisplayedMyProfileAuthenticatedUserForm();

        headerPage.ensureIsAuthenticatedUser();

        assertTrue(myProfilePage.getSaveBtn().isEnabled());

        myProfilePage.getName().clear();
        myProfilePage.getName().sendKeys("Mario");

        myProfilePage.getSurname().clear();
        myProfilePage.getSurname().sendKeys("Filipovic");

        justWait();

        assertTrue(myProfilePage.getSaveBtn().isEnabled());

        justWait();

        myProfilePage.getSaveBtn().click();

        myProfilePage.toastSuccess();

        homepagePage.ensureIsDisplayedHomepage();

        headerPage.ensureIsAuthenticatedUser();

        assertEquals("https://localhost:4200/homepage", driver.getCurrentUrl());

        //vracanje licnih podataka na staro zbog konzistentnosti baze

        Actions a= new Actions(driver);
        a.moveToElement(headerPage.getUserDropDown()).build().perform();

        justWait();

        headerPage.getMyProfileBtn().click();

        justWait();

        myProfilePage.getName().clear();
        myProfilePage.getName().sendKeys("Isidor");

        myProfilePage.getSurname().clear();
        myProfilePage.getSurname().sendKeys("Gavric");

        justWait();

        justWait();

        myProfilePage.getSaveBtn().click();

        assertEquals("https://localhost:4200/homepage", driver.getCurrentUrl());
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
