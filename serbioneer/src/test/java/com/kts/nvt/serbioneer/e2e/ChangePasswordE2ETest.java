package com.kts.nvt.serbioneer.e2e;

import com.kts.nvt.serbioneer.e2e.pages.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.PageFactory;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertFalse;

public class ChangePasswordE2ETest {

    private WebDriver driver;

    private HeaderPage headerPage;

    private ChangePasswordAdminPage changePasswordPage;

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
        changePasswordPage = PageFactory.initElements(driver, ChangePasswordAdminPage.class);
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

        driver.get("http://localhost:4200/change-password");
    }

    @Test
    public void changePassTestSuccess() throws InterruptedException {
        justWait();

        changePasswordPage.ensureIsDisplayedChangePasswordForm();

        headerPage.ensureIsAdmin();

        changePasswordPage.getOldPassword().sendKeys("admin");

        changePasswordPage.getNewPassword().sendKeys("new");

        changePasswordPage.getRepeatPassword().sendKeys("new");

        changePasswordPage.getViewPass().click();

        justWait();

        assertTrue(changePasswordPage.getChangePassBtn().isEnabled());

        changePasswordPage.getChangePassBtn().click();

        changePasswordPage.toastSuccess();

        homepagePage.ensureIsDisplayedHomepage();

        headerPage.ensureIsAdmin();

        assertEquals("http://localhost:4200/homepage", driver.getCurrentUrl());

        justWait();

        //vracanje stare sifre

        driver.get("http://localhost:4200/change-password");

        justWait();

        changePasswordPage.getOldPassword().sendKeys("new");

        changePasswordPage.getNewPassword().sendKeys("admin");

        changePasswordPage.getRepeatPassword().sendKeys("admin");

        changePasswordPage.getViewPass().click();

        justWait();

        changePasswordPage.getChangePassBtn().click();

        justWait();
    }

    @Test
    public void changePassTestOldPassIsIncorrect() throws InterruptedException {
        justWait();

        changePasswordPage.ensureIsDisplayedChangePasswordForm();

        headerPage.ensureIsAdmin();

        changePasswordPage.getOldPassword().sendKeys("invalid");

        changePasswordPage.getNewPassword().sendKeys("new");

        changePasswordPage.getRepeatPassword().sendKeys("new");

        changePasswordPage.getViewPass().click();

        justWait();

        assertTrue(changePasswordPage.getChangePassBtn().isEnabled());

        changePasswordPage.getChangePassBtn().click();

        changePasswordPage.toastError("Old password is incorrect.");

        changePasswordPage.ensureIsDisplayedChangePasswordForm();

        headerPage.ensureIsAdmin();

        assertEquals("http://localhost:4200/change-password", driver.getCurrentUrl());

        justWait();

    }

    @Test
    public void changePassTestNewPassCantBeOldPass() throws InterruptedException {
        justWait();

        changePasswordPage.ensureIsDisplayedChangePasswordForm();

        headerPage.ensureIsAdmin();

        changePasswordPage.getOldPassword().sendKeys("admin");

        changePasswordPage.getNewPassword().sendKeys("admin");

        changePasswordPage.getRepeatPassword().sendKeys("admin");

        changePasswordPage.getViewPass().click();

        justWait();

        assertTrue(changePasswordPage.getChangePassBtn().isEnabled());

        changePasswordPage.getChangePassBtn().click();

        changePasswordPage.toastError("New password cannot be the same as old password.");

        changePasswordPage.ensureIsDisplayedChangePasswordForm();

        headerPage.ensureIsAdmin();

        assertEquals("http://localhost:4200/change-password", driver.getCurrentUrl());

        justWait();

    }

    @Test
    public void changePassTestOldPassEmpty() throws InterruptedException {
        justWait();

        changePasswordPage.ensureIsDisplayedChangePasswordForm();

        headerPage.ensureIsAdmin();

        changePasswordPage.getOldPassword().sendKeys("");

        changePasswordPage.getNewPassword().sendKeys("admin");

        changePasswordPage.getRepeatPassword().sendKeys("admin");

        changePasswordPage.getViewPass().click();

        justWait();

        assertEquals(changePasswordPage.getOldPassError().getText(), "Required field");

        assertFalse(changePasswordPage.getChangePassBtn().isEnabled());

        changePasswordPage.ensureIsDisplayedChangePasswordForm();

        headerPage.ensureIsAdmin();

        assertEquals("http://localhost:4200/change-password", driver.getCurrentUrl());

        justWait();

    }

    @Test
    public void changePassTestNewPassEmpty() throws InterruptedException {
        justWait();

        changePasswordPage.ensureIsDisplayedChangePasswordForm();

        headerPage.ensureIsAdmin();

        changePasswordPage.getOldPassword().sendKeys("admin");

        changePasswordPage.getNewPassword().sendKeys("");

        changePasswordPage.getRepeatPassword().sendKeys("admin");

        changePasswordPage.getViewPass().click();

        justWait();

        assertEquals(changePasswordPage.getNewPassError().getText(), "Required field");
        assertEquals(changePasswordPage.getPasswordsDontMatchError().getText(), "Passwords must match");

        assertFalse(changePasswordPage.getChangePassBtn().isEnabled());

        changePasswordPage.ensureIsDisplayedChangePasswordForm();

        headerPage.ensureIsAdmin();

        assertEquals("http://localhost:4200/change-password", driver.getCurrentUrl());

        justWait();

    }

    @Test
    public void changePassTestRepeatPassEmpty() throws InterruptedException {
        justWait();

        changePasswordPage.ensureIsDisplayedChangePasswordForm();

        headerPage.ensureIsAdmin();

        changePasswordPage.getOldPassword().sendKeys("admin");

        changePasswordPage.getNewPassword().sendKeys("admin");

        changePasswordPage.getRepeatPassword().sendKeys("");

        changePasswordPage.getViewPass().click();

        justWait();

        assertEquals(changePasswordPage.getRepeatPassError().getText(), "Required field");
        assertEquals(changePasswordPage.getPasswordsDontMatchError().getText(), "Passwords must match");

        assertFalse(changePasswordPage.getChangePassBtn().isEnabled());

        changePasswordPage.ensureIsDisplayedChangePasswordForm();

        headerPage.ensureIsAdmin();

        assertEquals("http://localhost:4200/change-password", driver.getCurrentUrl());

        justWait();

    }

    @Test
    public void changePassTestPassDontMatch() throws InterruptedException {
        justWait();

        changePasswordPage.ensureIsDisplayedChangePasswordForm();

        headerPage.ensureIsAdmin();

        changePasswordPage.getOldPassword().sendKeys("admin");

        changePasswordPage.getNewPassword().sendKeys("dont");

        changePasswordPage.getRepeatPassword().sendKeys("match");

        changePasswordPage.getViewPass().click();

        justWait();

        assertEquals(changePasswordPage.getPasswordsDontMatchError().getText(), "Passwords must match");

        assertFalse(changePasswordPage.getChangePassBtn().isEnabled());

        changePasswordPage.ensureIsDisplayedChangePasswordForm();

        headerPage.ensureIsAdmin();

        assertEquals("http://localhost:4200/change-password", driver.getCurrentUrl());

        justWait();

    }

    @Test
    public void changePassTestAllFieldsEmpty() throws InterruptedException {
        justWait();

        changePasswordPage.ensureIsDisplayedChangePasswordForm();

        headerPage.ensureIsAdmin();

        changePasswordPage.getOldPassword().sendKeys("");

        changePasswordPage.getNewPassword().sendKeys("");

        changePasswordPage.getRepeatPassword().sendKeys("");

        changePasswordPage.getViewPass().click();

        justWait();

        assertEquals(changePasswordPage.getOldPassError().getText(), "Required field");

        assertEquals(changePasswordPage.getNewPassError().getText(), "Required field");

        assertEquals(changePasswordPage.getRepeatPassError().getText(), "Required field");

        assertFalse(changePasswordPage.getChangePassBtn().isEnabled());

        changePasswordPage.ensureIsDisplayedChangePasswordForm();

        headerPage.ensureIsAdmin();

        assertEquals("http://localhost:4200/change-password", driver.getCurrentUrl());

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
            driver.wait(3500);
        }
    }
}
