package com.kts.nvt.serbioneer.e2e;

import com.kts.nvt.serbioneer.e2e.pages.HeaderPage;
import com.kts.nvt.serbioneer.e2e.pages.LoginPage;
import com.kts.nvt.serbioneer.e2e.pages.NewAdminPage;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.PageFactory;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertFalse;

public class NewAdminE2ETest {

    private WebDriver driver;

    private HeaderPage headerPage;

    private NewAdminPage newAdminPage;

    private LoginPage loginPage;

    @Before
    public void setUp() throws InterruptedException {
        System.setProperty("webdriver.chrome.driver", "src/test/resources/chromedriver.exe");
        driver = new ChromeDriver();

        driver.manage().window().maximize();

        headerPage = PageFactory.initElements(driver, HeaderPage.class);
        newAdminPage = PageFactory.initElements(driver, NewAdminPage.class);
        loginPage = PageFactory.initElements(driver, LoginPage.class);

        driver.get("http://localhost:4200/login-register/login");
        justWait();
        loginPage.getEmail().sendKeys("admin@admin.com");
        loginPage.getPassword().sendKeys("admin");
        justWait();
        loginPage.getLoginBtn().click();
        justWait();

        driver.get("http://localhost:4200/new-admin");

    }

    @Test
    public void AddNewAdminTestSuccess() throws InterruptedException{
        justWait();

        headerPage.ensureIsAdmin();

        newAdminPage.ensureIsVisibleNewAdminForm();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        newAdminPage.getEmail().sendKeys("jabuka@grani.com");

        newAdminPage.getPassword().sendKeys("admin");

        newAdminPage.getConfirmPassword().sendKeys("admin");

        newAdminPage.getName().sendKeys("Stanivoje");

        newAdminPage.getSurname().sendKeys("Adminovic");

        newAdminPage.getDateOfBirth().sendKeys("1/19/2005");

        newAdminPage.getViewPass().click();

        assertTrue(newAdminPage.getAddButton().isEnabled());

        justWait();

        newAdminPage.getAddButton().click();

        justWait();

        // Fali prikaz nove strane

        newAdminPage.toastSuccess();

        justWait();

        assertEquals("http://localhost:4200/view-admin", driver.getCurrentUrl());

    }

    @Test
    public void AddNewAdminTestEmailAlreadyExists() throws InterruptedException{
        justWait();

        headerPage.ensureIsAdmin();

        newAdminPage.ensureIsVisibleNewAdminForm();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        newAdminPage.getEmail().sendKeys("admin@admin.com");

        newAdminPage.getPassword().sendKeys("admin");

        newAdminPage.getConfirmPassword().sendKeys("admin");

        newAdminPage.getName().sendKeys("Stanivoje");

        newAdminPage.getSurname().sendKeys("Adminovic");

        newAdminPage.getDateOfBirth().sendKeys("1/19/2005");

        newAdminPage.getViewPass().click();

        assertTrue(newAdminPage.getAddButton().isEnabled());

        justWait();

        newAdminPage.getAddButton().click();

        justWait();

        newAdminPage.ensureIsVisibleNewAdminForm();

        headerPage.ensureIsAdmin();

        newAdminPage.toastError("Admin with given email already exists");

        justWait();

        assertEquals("http://localhost:4200/new-admin", driver.getCurrentUrl());

    }

    @Test
    public void AddNewAdminTestInvalidEmailFormat() throws InterruptedException{
        justWait();

        headerPage.ensureIsAdmin();

        newAdminPage.ensureIsVisibleNewAdminForm();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        newAdminPage.getEmail().sendKeys("jabukanagrani");

        newAdminPage.getPassword().sendKeys("admin");

        newAdminPage.getConfirmPassword().sendKeys("admin");

        newAdminPage.getName().sendKeys("Stanivoje");

        newAdminPage.getSurname().sendKeys("Adminovic");

        newAdminPage.getDateOfBirth().sendKeys("1/19/2005");

        newAdminPage.getViewPass().click();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        justWait();

        assertEquals(newAdminPage.getEmailError().getText(), "Not a valid email");

        newAdminPage.ensureIsVisibleNewAdminForm();

        headerPage.ensureIsAdmin();

        assertEquals("http://localhost:4200/new-admin", driver.getCurrentUrl());

    }

    @Test
    public  void AddNewAdminTestEmptyEmail() throws InterruptedException{
        justWait();

        headerPage.ensureIsAdmin();

        newAdminPage.ensureIsVisibleNewAdminForm();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        newAdminPage.getEmail().sendKeys("");

        newAdminPage.getPassword().sendKeys("admin");

        newAdminPage.getConfirmPassword().sendKeys("admin");

        newAdminPage.getName().sendKeys("Stanivoje");

        newAdminPage.getSurname().sendKeys("Adminovic");

        newAdminPage.getDateOfBirth().sendKeys("1/19/2005");

        newAdminPage.getViewPass().click();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        justWait();

        assertEquals(newAdminPage.getEmailError().getText(), "Required field");

        newAdminPage.ensureIsVisibleNewAdminForm();

        headerPage.ensureIsAdmin();

        assertEquals("http://localhost:4200/new-admin", driver.getCurrentUrl());

    }

    @Test
    public  void AddNewAdminTestEmptyPassword() throws InterruptedException{
        justWait();

        headerPage.ensureIsAdmin();

        newAdminPage.ensureIsVisibleNewAdminForm();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        newAdminPage.getEmail().sendKeys("jabuka@grani.com");

        newAdminPage.getPassword().sendKeys("");

        newAdminPage.getConfirmPassword().sendKeys("admin");

        newAdminPage.getName().sendKeys("Stanivoje");

        newAdminPage.getSurname().sendKeys("Adminovic");

        newAdminPage.getDateOfBirth().sendKeys("1/19/2005");

        newAdminPage.getViewPass().click();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        justWait();

        assertEquals(newAdminPage.getPasswordError().getText(), "Required field");

        newAdminPage.ensureIsVisibleNewAdminForm();

        headerPage.ensureIsAdmin();

        assertEquals("http://localhost:4200/new-admin", driver.getCurrentUrl());

    }

    @Test
    public void AddNewAdminTestPasswordsDontMatch() throws InterruptedException{
        justWait();

        headerPage.ensureIsAdmin();

        newAdminPage.ensureIsVisibleNewAdminForm();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        newAdminPage.getEmail().sendKeys("jabuka@grani.com");

        newAdminPage.getPassword().sendKeys("admin");

        newAdminPage.getConfirmPassword().sendKeys("neadmin");

        newAdminPage.getName().sendKeys("Stanivoje");

        newAdminPage.getSurname().sendKeys("Adminovic");

        newAdminPage.getDateOfBirth().sendKeys("1/19/2005");

        newAdminPage.getViewPass().click();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        justWait();

        assertEquals(newAdminPage.getPasswordsDontMatchError().getText(),"Passwords must match");

        newAdminPage.ensureIsVisibleNewAdminForm();

        headerPage.ensureIsAdmin();

        assertEquals("http://localhost:4200/new-admin", driver.getCurrentUrl());

    }

    @Test
    public  void AddNewAdminTestEmptyConfirmPassword() throws InterruptedException{
        justWait();

        headerPage.ensureIsAdmin();

        newAdminPage.ensureIsVisibleNewAdminForm();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        newAdminPage.getEmail().sendKeys("jabuka@grani.com");

        newAdminPage.getPassword().sendKeys("admin");

        newAdminPage.getConfirmPassword().sendKeys("");

        newAdminPage.getName().sendKeys("Stanivoje");

        newAdminPage.getSurname().sendKeys("Adminovic");

        newAdminPage.getDateOfBirth().sendKeys("1/19/2005");

        newAdminPage.getViewPass().click();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        justWait();

        assertEquals(newAdminPage.getConfirmPasswordError().getText(), "Required field");

        newAdminPage.ensureIsVisibleNewAdminForm();

        headerPage.ensureIsAdmin();

        assertEquals("http://localhost:4200/new-admin", driver.getCurrentUrl());

    }

    @Test
    public  void AddNewAdminTestEmptyName() throws InterruptedException{
        justWait();

        headerPage.ensureIsAdmin();

        newAdminPage.ensureIsVisibleNewAdminForm();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        newAdminPage.getEmail().sendKeys("jabuka@grani.com");

        newAdminPage.getPassword().sendKeys("admin");

        newAdminPage.getConfirmPassword().sendKeys("admin");

        newAdminPage.getName().sendKeys("");

        newAdminPage.getSurname().sendKeys("Adminovic");

        newAdminPage.getDateOfBirth().sendKeys("1/19/2005");

        newAdminPage.getViewPass().click();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        justWait();

        assertEquals(newAdminPage.getNameError().getText(), "Required field");

        newAdminPage.ensureIsVisibleNewAdminForm();

        headerPage.ensureIsAdmin();

        assertEquals("http://localhost:4200/new-admin", driver.getCurrentUrl());

    }

    @Test
    public void AddNewAdminTestInvalidName() throws InterruptedException{
        justWait();

        headerPage.ensureIsAdmin();

        newAdminPage.ensureIsVisibleNewAdminForm();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        newAdminPage.getEmail().sendKeys("jabuka@grani.com");

        newAdminPage.getPassword().sendKeys("admin");

        newAdminPage.getConfirmPassword().sendKeys("admin");

        newAdminPage.getName().sendKeys("stanivoje");

        newAdminPage.getSurname().sendKeys("Adminovic");

        newAdminPage.getDateOfBirth().sendKeys("1/19/2005");

        newAdminPage.getViewPass().click();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        justWait();

        assertEquals(newAdminPage.getNameError().getText(), "Must start with capital letter");

        newAdminPage.ensureIsVisibleNewAdminForm();

        headerPage.ensureIsAdmin();

        assertEquals("http://localhost:4200/new-admin", driver.getCurrentUrl());

    }

    @Test
    public void AddNewAdminTestEmptySurname() throws InterruptedException{
        justWait();

        headerPage.ensureIsAdmin();

        newAdminPage.ensureIsVisibleNewAdminForm();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        newAdminPage.getEmail().sendKeys("jabuka@grani.com");

        newAdminPage.getPassword().sendKeys("admin");

        newAdminPage.getConfirmPassword().sendKeys("admin");

        newAdminPage.getName().sendKeys("Stanivoje");

        newAdminPage.getSurname().sendKeys("");

        newAdminPage.getDateOfBirth().sendKeys("1/19/2005");

        newAdminPage.getViewPass().click();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        justWait();

        assertEquals(newAdminPage.getSurnameError().getText(), "Required field");

        newAdminPage.ensureIsVisibleNewAdminForm();

        headerPage.ensureIsAdmin();

        assertEquals("http://localhost:4200/new-admin", driver.getCurrentUrl());

    }

    @Test
    public void AddNewAdminTestInvalidSurname() throws InterruptedException{
        justWait();

        headerPage.ensureIsAdmin();

        newAdminPage.ensureIsVisibleNewAdminForm();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        newAdminPage.getEmail().sendKeys("jabuka@grani.com");

        newAdminPage.getPassword().sendKeys("admin");

        newAdminPage.getConfirmPassword().sendKeys("admin");

        newAdminPage.getName().sendKeys("Stanivoje");

        newAdminPage.getSurname().sendKeys("adminovic");

        newAdminPage.getDateOfBirth().sendKeys("1/19/2005");

        newAdminPage.getViewPass().click();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        justWait();

        assertEquals(newAdminPage.getSurnameError().getText(), "Must start with capital letter");

        newAdminPage.ensureIsVisibleNewAdminForm();

        headerPage.ensureIsAdmin();

        assertEquals("http://localhost:4200/new-admin", driver.getCurrentUrl());

    }

    @Test
    public  void AddNewAdminTestEmptyDateOfBirth() throws InterruptedException{
        justWait();

        headerPage.ensureIsAdmin();

        newAdminPage.ensureIsVisibleNewAdminForm();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        newAdminPage.getEmail().sendKeys("jabuka@grani.com");

        newAdminPage.getPassword().sendKeys("admin");

        newAdminPage.getConfirmPassword().sendKeys("admin");

        newAdminPage.getName().sendKeys("Stanivoje");

        newAdminPage.getSurname().sendKeys("Adminovic");

        newAdminPage.getDateOfBirth().sendKeys("");

        newAdminPage.getViewPass().click();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        justWait();

        assertEquals("Required field", newAdminPage.getDateOfBirthError().getText());

        newAdminPage.ensureIsVisibleNewAdminForm();

        headerPage.ensureIsAdmin();

        assertEquals("http://localhost:4200/new-admin", driver.getCurrentUrl());

    }

    @Test
    public  void AddNewAdminTestEmptyAllFields() throws InterruptedException{
        justWait();

        headerPage.ensureIsAdmin();

        newAdminPage.ensureIsVisibleNewAdminForm();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        newAdminPage.getEmail().sendKeys("");

        newAdminPage.getPassword().sendKeys("");

        newAdminPage.getConfirmPassword().sendKeys("");

        newAdminPage.getName().sendKeys("");

        newAdminPage.getSurname().sendKeys("");

        newAdminPage.getDateOfBirth().sendKeys("");

        newAdminPage.getViewPass().click();

        assertFalse(newAdminPage.getAddButton().isEnabled());

        justWait();

        assertEquals(newAdminPage.getEmailError().getText(), "Required field");
        assertEquals(newAdminPage.getPasswordError().getText(), "Required field");
        assertEquals(newAdminPage.getConfirmPasswordError().getText(), "Required field");
        assertEquals(newAdminPage.getNameError().getText(), "Required field");
        assertEquals(newAdminPage.getSurnameError().getText(), "Required field");
        assertEquals(newAdminPage.getDateOfBirthError().getText(), "Required field");

        newAdminPage.ensureIsVisibleNewAdminForm();

        headerPage.ensureIsAdmin();

        assertEquals("http://localhost:4200/new-admin", driver.getCurrentUrl());

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
