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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class CategoriesE2ETest {

    private WebDriver driver;

    private LoginPage loginPage;

    private HeaderPage headerPage;

    private CategoriesPage categoriesPage;

    private DialogPage dialogPage;

    private InlineEditPage inlineEditPage;

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
        categoriesPage = PageFactory.initElements(driver, CategoriesPage.class);
        dialogPage = PageFactory.initElements(driver, DialogPage.class);
        inlineEditPage = PageFactory.initElements(driver, InlineEditPage.class);

        //redirekcija na pocetak interakcije tj na login page
        driver.get("https://localhost:4200/login-register/login");

        //logovanje kao admin
        loginPage.getEmail().sendKeys("admin@admin.com");
        loginPage.getPassword().sendKeys("admin");

        justWait();

        loginPage.getLoginBtn().click();

        justWait();

        //prelazak na kategorije
        headerPage.getCategoriesBtn().click();
    }

    /*-----------------------------Add new category-------------------------------*/
    @Test
    public void addNewCategoryAndDeleteTestSuccess() throws InterruptedException {
        justWait();

        headerPage.ensureIsAdmin();

        categoriesPage.ensureIsDisplayed();

        //broj elemenata u tabeli pre add
        String text = categoriesPage.getCategoryPaginator().getText();
        String[] bits = text.split(" ");
        int beforeAdd = Integer.parseInt(bits[bits.length-1]);

        categoriesPage.getCulturalCategoryName().sendKeys("Nova kategorija");

        justWait();

        categoriesPage.getCulturalCategoryAddBtn().click();

        synchronized (driver)
        {
            driver.wait(500);
        }

        text = categoriesPage.getCategoryPaginator().getText();
        bits = text.split(" ");

        //provera da je broj elemenata u tabeli posle dodavanja za jedan veci
        assertTrue(Integer.parseInt(bits[bits.length-1]) == (beforeAdd + 1));
        assertEquals(categoriesPage.getToast().getText(), "Successfully added new category!");

        justWait();
        //brisanje dodate kategorije
        categoriesPage.getCategoryTableLastPageBtn().click();

        justWait();

        WebElement delete = driver.findElement(By.xpath("(//*/table)[1]/tbody/tr[last()]/td[2]/button[2]"));

        delete.click();

        justWait();

        dialogPage.ensureIsDisplayed();

        dialogPage.getDialogNo().click();

        justWait();

        delete.click();

        justWait();

        dialogPage.ensureIsDisplayed();

        dialogPage.getDialogYes().click();
        
        synchronized (driver)
        {
            driver.wait(500);
        }

        assertEquals(categoriesPage.getToast().getText(), "Successfully deleted cultural site category!");

        justWait();
    }

    @Test
    public void addNewCategoryTestNameExistsError() throws InterruptedException {
        justWait();

        headerPage.ensureIsAdmin();

        categoriesPage.ensureIsDisplayed();

        //broj elemenata u tabeli pre add
        String text = categoriesPage.getCategoryPaginator().getText();
        String[] bits = text.split(" ");
        int beforeAdd = Integer.parseInt(bits[bits.length-1]);

        categoriesPage.getCulturalCategoryName().sendKeys("Institucija");

        justWait();

        categoriesPage.getCulturalCategoryAddBtn().click();

        text = categoriesPage.getCategoryPaginator().getText();
        bits = text.split(" ");

        //provera da je broj elemenata u tabeli isti zbog neuspesnog dodavanja
        assertTrue(Integer.parseInt(bits[bits.length-1]) == (beforeAdd));
        assertEquals(categoriesPage.getToast().getText(), "Cultural site category with given name already exists.");

        justWait();
    }
    
    @Test
    public void addNewCategoryTestRequiredFieldError() throws InterruptedException {
        justWait();

        headerPage.ensureIsAdmin();

        categoriesPage.ensureIsDisplayed();

        //broj elemenata u tabeli pre add
        String text = categoriesPage.getCategoryPaginator().getText();
        String[] bits = text.split(" ");
        int beforeAdd = Integer.parseInt(bits[bits.length-1]);

        categoriesPage.getCulturalCategoryName().sendKeys("");

        justWait();

        headerPage.getCategoriesBtn().click();

        text = categoriesPage.getCategoryPaginator().getText();
        bits = text.split(" ");

        //provera da je broj elemenata u tabeli isti zbog neuspesnog dodavanja
        assertTrue(Integer.parseInt(bits[bits.length-1]) == (beforeAdd));
        assertEquals(categoriesPage.getCategoryNameError().getText(), "Required field");

        justWait();
    }

    @Test
    public void addNewCategoryTestCapitalLetterError() throws InterruptedException {
        justWait();

        headerPage.ensureIsAdmin();

        categoriesPage.ensureIsDisplayed();

        //broj elemenata u tabeli pre add
        String text = categoriesPage.getCategoryPaginator().getText();
        String[] bits = text.split(" ");
        int beforeAdd = Integer.parseInt(bits[bits.length-1]);

        categoriesPage.getCulturalCategoryName().sendKeys("nova kategorija");

        justWait();

        headerPage.getCategoriesBtn().click();

        text = categoriesPage.getCategoryPaginator().getText();
        bits = text.split(" ");

        //provera da je broj elemenata u tabeli isti zbog neuspesnog dodavanja
        assertTrue(Integer.parseInt(bits[bits.length-1]) == (beforeAdd));
        assertEquals(categoriesPage.getCategoryNameError().getText(), "Must start with capital letter");

        justWait();
    }

    @Test
    public void addNewCategoryTestSpecialCharactersError() throws InterruptedException {
        justWait();

        headerPage.ensureIsAdmin();

        categoriesPage.ensureIsDisplayed();

        //broj elemenata u tabeli pre add
        String text = categoriesPage.getCategoryPaginator().getText();
        String[] bits = text.split(" ");
        int beforeAdd = Integer.parseInt(bits[bits.length-1]);

        categoriesPage.getCulturalCategoryName().sendKeys("N3%");

        justWait();

        headerPage.getCategoriesBtn().click();

        text = categoriesPage.getCategoryPaginator().getText();
        bits = text.split(" ");

        //provera da je broj elemenata u tabeli isti zbog neuspesnog dodavanja
        assertTrue(Integer.parseInt(bits[bits.length-1]) == (beforeAdd));
        assertEquals(categoriesPage.getCategoryNameError().getText(), "Cannot contain special characters or numbers");

        justWait();
    }

    /*-----------------------------Delete existing category-------------------------------*/

    @Test
    public void deleteCategoryTestHasTypesError() throws InterruptedException {
        justWait();

        headerPage.ensureIsAdmin();

        categoriesPage.ensureIsDisplayed();

        //broj elemenata u tabeli pre delete
        String text = categoriesPage.getCategoryPaginator().getText();
        String[] bits = text.split(" ");
        int beforeDelete = Integer.parseInt(bits[bits.length-1]);

        WebElement deleteBtn = driver.findElement(By.xpath("(//*/table)[1]/tbody/tr[1]/td[2]/button[2]"));

        deleteBtn.click();

        justWait();

        dialogPage.ensureIsDisplayed();

        dialogPage.getDialogYes().click();

        synchronized (driver)
        {
            driver.wait(500);
        }

        //provera da je broj elemenata u tabeli isti kao pre dodavanja
        assertTrue(Integer.parseInt(bits[bits.length-1]) == (beforeDelete));
        assertEquals(categoriesPage.getToast().getText(), "Cultural site category with associated cultural sites cannot be deleted.");

        justWait();
    }

    /*-----------------------------Edit existing category-------------------------------*/

    @Test
    public void editCategoryTestSuccess() throws InterruptedException {
        justWait();

        headerPage.ensureIsAdmin();

        categoriesPage.ensureIsDisplayed();

        WebElement editBtn = driver.findElement(By.xpath("(//*/table)[1]/tbody/tr[1]/td[2]/button[1]"));

        editBtn.click();

        justWait();

        inlineEditPage.ensureIsDisplayed();

        clearField(inlineEditPage.getInput(), inlineEditPage.getInput().getAttribute("value").length());

        justWait();

        inlineEditPage.getInput().sendKeys("Promenjeno ime");

        justWait();

        inlineEditPage.getSave().click();

        justWait();

        List<WebElement> rows = categoriesPage.getCategoryTable().findElements(By.tagName("td"));

        assertEquals(rows.get(0).getText(), "Promenjeno ime");

        assertEquals(categoriesPage.getToast().getText(), "Successfully updated cultural site category!");

        justWait();

        // vracanje vrednosti na staru

        editBtn = driver.findElement(By.xpath("(//*/table)[1]/tbody/tr[1]/td[2]/button[1]"));
        editBtn.click();

        justWait();

        inlineEditPage.ensureIsDisplayed();

        clearField(inlineEditPage.getInput(), inlineEditPage.getInput().getAttribute("value").length());

        justWait();

        inlineEditPage.getInput().sendKeys("Institucija");

        justWait();

        inlineEditPage.getSave().click();

        justWait();

        rows = categoriesPage.getCategoryTable().findElements(By.tagName("td"));

        assertEquals(rows.get(0).getText(), "Institucija");

        assertEquals(categoriesPage.getToast().getText(), "Successfully updated cultural site category!");

        justWait();
    }

    @Test
    public void editCategoryTestCancel() throws InterruptedException {
        justWait();

        headerPage.ensureIsAdmin();

        categoriesPage.ensureIsDisplayed();

        WebElement editBtn = driver.findElement(By.xpath("(//*/table)[1]/tbody/tr[1]/td[2]/button[1]"));

        editBtn.click();

        justWait();

        inlineEditPage.ensureIsDisplayed();

        clearField(inlineEditPage.getInput(), inlineEditPage.getInput().getAttribute("value").length());

        justWait();

        inlineEditPage.getInput().sendKeys("Sta god zelis");

        justWait();

        inlineEditPage.getCancel().click();

        justWait();
    }
    
    @Test
    public void editCategoryTestUniqueNameError() throws InterruptedException {
        justWait();

        headerPage.ensureIsAdmin();

        categoriesPage.ensureIsDisplayed();

        WebElement editBtn = driver.findElement(By.xpath("(//*/table)[1]/tbody/tr[1]/td[2]/button[1]"));

        editBtn.click();

        justWait();

        inlineEditPage.ensureIsDisplayed();

        clearField(inlineEditPage.getInput(), inlineEditPage.getInput().getAttribute("value").length());

        justWait();

        inlineEditPage.getInput().sendKeys("Manifestacija");

        justWait();

        inlineEditPage.getSave().click();

        justWait();

        assertEquals(categoriesPage.getToast().getText(), "Cultural site category with given name already exists.");

        justWait();
    }
    
    @Test
    public void editCategoryTestRequiredFieldError() throws InterruptedException {
        justWait();

        headerPage.ensureIsAdmin();

        categoriesPage.ensureIsDisplayed();

        WebElement editBtn = driver.findElement(By.xpath("(//*/table)[1]/tbody/tr[1]/td[2]/button[1]"));

        editBtn.click();

        justWait();

        inlineEditPage.ensureIsDisplayed();

        clearField(inlineEditPage.getInput(), inlineEditPage.getInput().getAttribute("value").length());

        justWait();

        inlineEditPage.getInput().sendKeys("");

        justWait();

        headerPage.getCategoriesBtn().click();

        justWait();

        assertEquals(inlineEditPage.getError().getText(), "Required field");

        justWait();
    }
    
    @Test
    public void editCategoryTestCapitalLetterError() throws InterruptedException {
        justWait();

        headerPage.ensureIsAdmin();

        categoriesPage.ensureIsDisplayed();

        WebElement editBtn = driver.findElement(By.xpath("(//*/table)[1]/tbody/tr[1]/td[2]/button[1]"));

        editBtn.click();

        justWait();

        inlineEditPage.ensureIsDisplayed();

        clearField(inlineEditPage.getInput(), inlineEditPage.getInput().getAttribute("value").length());

        justWait();

        inlineEditPage.getInput().sendKeys("promenjeno ime");

        justWait();

        headerPage.getCategoriesBtn().click();

        justWait();

        assertEquals(inlineEditPage.getError().getText(), "Must start with capital letter");

        justWait();
    }

    @Test
    public void editCategoryTestSpecialCharactersError() throws InterruptedException {
        justWait();

        headerPage.ensureIsAdmin();

        categoriesPage.ensureIsDisplayed();

        WebElement editBtn = driver.findElement(By.xpath("(//*/table)[1]/tbody/tr[1]/td[2]/button[1]"));

        editBtn.click();

        justWait();

        inlineEditPage.ensureIsDisplayed();

        clearField(inlineEditPage.getInput(), inlineEditPage.getInput().getAttribute("value").length());

        justWait();

        inlineEditPage.getInput().sendKeys("Pr3m%");

        justWait();

        headerPage.getCategoriesBtn().click();

        justWait();

        assertEquals(inlineEditPage.getError().getText(), "Cannot contain special characters or numbers");

        justWait();
    }

    @After
    public void cleanUp() {
        driver.quit();
    }

    /* Omogucava cekanje da bi nam bile vidljivije promene tokom testa */
    private void justWait() throws InterruptedException {
        synchronized (driver)
        {
            driver.wait(2000);
        }
    }

    private void clearField(WebElement field, int backspaces) {
        for(int i = 0; i <=backspaces; i++ ){
            field.sendKeys(Keys.BACK_SPACE);
        }
    }
}
