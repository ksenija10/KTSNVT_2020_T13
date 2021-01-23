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

public class CategoryTypesE2ETests {

    private WebDriver driver;

    private LoginPage loginPage;

    private HeaderPage headerPage;

    private CategoryTypesPage categoryTypesPage;

    private CategoriesPage categoriesPage;

    private DialogPage dialogPage;

    private InlineEditPage inlineEditPage;

    @Before
    public void setUp() throws InterruptedException {
        // default-ni browser za selenium je firefox, pa ukoliko zelimo da koristimo chrome moramo da ubacimo
        // chrome ekstenziju i podesimo chrome kao default-ni driver
        System.setProperty("webdriver.chrome.driver", "src/test/resources/chromedriver.exe");
        driver = new ChromeDriver();

        // prosirenje prozora za bolji pregled
        driver.manage().window().maximize();
        // instanciranje potrebnih page objekata
        loginPage = PageFactory.initElements(driver, LoginPage.class);
        headerPage = PageFactory.initElements(driver, HeaderPage.class);
        categoryTypesPage = PageFactory.initElements(driver, CategoryTypesPage.class);
        categoriesPage = PageFactory.initElements(driver, CategoriesPage.class);
        dialogPage = PageFactory.initElements(driver, DialogPage.class);
        inlineEditPage = PageFactory.initElements(driver, InlineEditPage.class);

        // redirekcija na pocetak interakcije tj na login page
        driver.get("http://localhost:4200/login-register/login");

        // logovanje kao admin
        loginPage.getEmail().sendKeys("admin@admin.com");
        loginPage.getPassword().sendKeys("admin");

        justWait();

        loginPage.getLoginBtn().click();

        justWait();

        // prelazak na kategorije
        headerPage.getCategoriesBtn().click();
    }

    /*-----------------------------Add existing category type-------------------------------*/

    @Test
    public void addNewTypeAndDeleteTestSuccess() throws InterruptedException {
        justWait();

        headerPage.ensureIsAdmin();

        categoriesPage.ensureIsDisplayed();

        categoryTypesPage.ensureIsDisplayedNoCategoryChosen();

        // klik na Institucija
        List<WebElement> rows = categoriesPage.getCategoryTable().findElements(By.tagName("tr"));

        rows.get(1).click();

        categoryTypesPage.ensureIsDisplayedChosenCategory();

        assertEquals(categoryTypesPage.getChosenCategoryName().getText(), "Institucija types");

        justWait();

        // broj elemenata u tabeli pre add
        String text = categoryTypesPage.getTypesPaginator().getText();
        String[] bits = text.split(" ");
        int beforeAdd = Integer.parseInt(bits[bits.length-1]);

        categoryTypesPage.getTypeName().sendKeys("Novi tip");

        justWait();

        categoryTypesPage.getTypeAddBtn().click();

        synchronized (driver)
        {
            driver.wait(500);
        }

        text = categoryTypesPage.getTypesPaginator().getText();
        bits = text.split(" ");

        // provera da je broj elemenata u tabeli posle dodavanja za jedan veci
        assertTrue(Integer.parseInt(bits[bits.length-1]) == (beforeAdd + 1));
        assertEquals(categoriesPage.getToast().getText(), "Successfully added new category type!");

        // brisanje dodatog tipa
        categoryTypesPage.getTypeTableLastPageBtn().click();

        justWait();

        WebElement delete = driver.findElement(By.xpath("(//*/table)[2]/tbody/tr[last()]/td[2]/button[2]"));

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

        // provera da je broj elemenata u tabeli isti kao pre dodavanja
        assertEquals(categoriesPage.getToast().getText(), "Successfully deleted cultural category type!");

        justWait();
    }

    @Test
    public void addNewTypeTestNameExistsError() throws InterruptedException {
        justWait();

        headerPage.ensureIsAdmin();

        categoriesPage.ensureIsDisplayed();

        // klik na Institucija
        List<WebElement> rows = categoriesPage.getCategoryTable().findElements(By.tagName("tr"));

        rows.get(1).click();

        categoryTypesPage.ensureIsDisplayedChosenCategory();

        assertEquals(categoryTypesPage.getChosenCategoryName().getText(), "Institucija types");

        justWait();

        // broj elemenata u tabeli pre add
        String text = categoryTypesPage.getTypesPaginator().getText();
        String[] bits = text.split(" ");
        int beforeAdd = Integer.parseInt(bits[bits.length-1]);

        categoryTypesPage.getTypeName().sendKeys("Biblioteka");

        justWait();

        categoryTypesPage.getTypeAddBtn().click();

        text = categoryTypesPage.getTypesPaginator().getText();
        bits = text.split(" ");

        // provera da je broj elemenata u tabeli isti zbog neuspesnog dodavanja
        assertTrue(Integer.parseInt(bits[bits.length-1]) == (beforeAdd));
        assertEquals(categoriesPage.getToast().getText(), "Cultural category type with given name already exists.");

        justWait();
    }

    @Test
    public void addNewTypeTestRequiredFieldError() throws InterruptedException {
        justWait();

        headerPage.ensureIsAdmin();

        categoriesPage.ensureIsDisplayed();

        // klik na Institucija
        List<WebElement> rows = categoriesPage.getCategoryTable().findElements(By.tagName("tr"));

        rows.get(1).click();

        categoryTypesPage.ensureIsDisplayedChosenCategory();

        assertEquals(categoryTypesPage.getChosenCategoryName().getText(), "Institucija types");

        justWait();

        // broj elemenata u tabeli pre add
        String text = categoryTypesPage.getTypesPaginator().getText();
        String[] bits = text.split(" ");
        int beforeAdd = Integer.parseInt(bits[bits.length-1]);

        categoryTypesPage.getTypeName().sendKeys("");

        justWait();

        categoryTypesPage.getTypeAddBtn().click();

        justWait();

        text = categoryTypesPage.getTypesPaginator().getText();
        bits = text.split(" ");

        // provera da je broj elemenata u tabeli isti zbog neuspesnog dodavanja
        assertTrue(Integer.parseInt(bits[bits.length-1]) == (beforeAdd));
        assertEquals(categoryTypesPage.getTypeNameError().getText(), "Required field");

        justWait();
    }
    
    @Test
    public void addNewTypeTestCapitalLetterError() throws InterruptedException {
        justWait();

        headerPage.ensureIsAdmin();

        categoriesPage.ensureIsDisplayed();

        // klik na Institucija
        List<WebElement> rows = categoriesPage.getCategoryTable().findElements(By.tagName("tr"));

        rows.get(1).click();

        categoryTypesPage.ensureIsDisplayedChosenCategory();

        assertEquals(categoryTypesPage.getChosenCategoryName().getText(), "Institucija types");

        justWait();

        // broj elemenata u tabeli pre add
        String text = categoryTypesPage.getTypesPaginator().getText();
        String[] bits = text.split(" ");
        int beforeAdd = Integer.parseInt(bits[bits.length-1]);

        categoryTypesPage.getTypeName().sendKeys("novi tip");

        justWait();

        categoryTypesPage.getTypeAddBtn().click();

        justWait();

        text = categoryTypesPage.getTypesPaginator().getText();
        bits = text.split(" ");

        // provera da je broj elemenata u tabeli isti zbog neuspesnog dodavanja
        assertTrue(Integer.parseInt(bits[bits.length-1]) == (beforeAdd));
        assertEquals(categoryTypesPage.getTypeNameError().getText(), "Must start with capital letter");

        justWait();
    }

    @Test
    public void addNewTypeTestSpecialCharactersError() throws InterruptedException {
        justWait();

        headerPage.ensureIsAdmin();

        categoriesPage.ensureIsDisplayed();

        // klik na Institucija
        List<WebElement> rows = categoriesPage.getCategoryTable().findElements(By.tagName("tr"));

        rows.get(1).click();

        categoryTypesPage.ensureIsDisplayedChosenCategory();

        assertEquals(categoryTypesPage.getChosenCategoryName().getText(), "Institucija types");

        justWait();

        // broj elemenata u tabeli pre add
        String text = categoryTypesPage.getTypesPaginator().getText();
        String[] bits = text.split(" ");
        int beforeAdd = Integer.parseInt(bits[bits.length-1]);

        categoryTypesPage.getTypeName().sendKeys("N3v%");

        justWait();

        categoryTypesPage.getTypeAddBtn().click();

        justWait();

        text = categoryTypesPage.getTypesPaginator().getText();
        bits = text.split(" ");

        // provera da je broj elemenata u tabeli isti zbog neuspesnog dodavanja
        assertTrue(Integer.parseInt(bits[bits.length-1]) == (beforeAdd));
        assertEquals(categoryTypesPage.getTypeNameError().getText(), "Cannot contain special characters or numbers");

        justWait();
    }

    /*-----------------------------Delete existing category type-------------------------------*/

    @Test
    public void deleteCategoryTestHasTypesError() throws InterruptedException {
        justWait();

        headerPage.ensureIsAdmin();

        categoriesPage.ensureIsDisplayed();

        //klik na Institucija
        List<WebElement> rows = categoriesPage.getCategoryTable().findElements(By.tagName("tr"));

        rows.get(1).click();

        categoryTypesPage.ensureIsDisplayedChosenCategory();

        assertEquals(categoryTypesPage.getChosenCategoryName().getText(), "Institucija types");

        justWait();

        //broj elemenata u tabeli pre delete
        String text = categoryTypesPage.getTypesPaginator().getText();
        String[] bits = text.split(" ");
        int beforeDelete = Integer.parseInt(bits[bits.length-1]);

        WebElement deleteBtn = driver.findElement(By.xpath("(//*/table)[2]/tbody/tr[1]/td[2]/button[2]"));

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
        assertEquals(categoriesPage.getToast().getText(), "Cultural category type with associated cultural sites cannot be deleted.");

        justWait();
    }

    /*-----------------------------Edit existing category type-------------------------------*/

    @Test
    public void editCategoryTypeTestSuccess() throws InterruptedException {
        justWait();

        //klik na Institucija
        List<WebElement> rows = categoriesPage.getCategoryTable().findElements(By.tagName("tr"));

        rows.get(1).click();

        categoryTypesPage.ensureIsDisplayedChosenCategory();

        assertEquals(categoryTypesPage.getChosenCategoryName().getText(), "Institucija types");

        WebElement editBtn = driver.findElement(By.xpath("(//*/table)[2]/tbody/tr[1]/td[2]/button[1]"));

        editBtn.click();

        justWait();

        inlineEditPage.ensureIsDisplayed();

        clearField(inlineEditPage.getInput(), inlineEditPage.getInput().getAttribute("value").length());

        justWait();

        inlineEditPage.getInput().sendKeys("Promenjeno ime");

        justWait();

        inlineEditPage.getSave().click();

        justWait();

        rows = categoryTypesPage.getCategoyTypeTable().findElements(By.tagName("td"));

        assertEquals(rows.get(0).getText(), "Promenjeno ime");

        assertEquals(categoriesPage.getToast().getText(), "Successfully updated cultural category type!");

        justWait();

        //vracanje vrednosti na staru

        editBtn = driver.findElement(By.xpath("(//*/table)[2]/tbody/tr[1]/td[2]/button[1]"));
        editBtn.click();

        justWait();

        inlineEditPage.ensureIsDisplayed();

        clearField(inlineEditPage.getInput(), inlineEditPage.getInput().getAttribute("value").length());

        justWait();

        inlineEditPage.getInput().sendKeys("Biblioteka");

        justWait();

        inlineEditPage.getSave().click();

        justWait();

        rows = categoryTypesPage.getCategoyTypeTable().findElements(By.tagName("td"));

        assertEquals(rows.get(0).getText(), "Biblioteka");

        assertEquals(categoriesPage.getToast().getText(), "Successfully updated cultural category type!");

        justWait();
    }
    
    @Test
    public void editCategoryTypeTestCancel() throws InterruptedException {
        justWait();

        //klik na Institucija
        List<WebElement> rows = categoriesPage.getCategoryTable().findElements(By.tagName("tr"));

        rows.get(1).click();

        categoryTypesPage.ensureIsDisplayedChosenCategory();

        assertEquals(categoryTypesPage.getChosenCategoryName().getText(), "Institucija types");

        WebElement editBtn = driver.findElement(By.xpath("(//*/table)[2]/tbody/tr[1]/td[2]/button[1]"));

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
    public void editCategoryTypeTestUniqueNameError() throws InterruptedException {
        justWait();

        //klik na Institucija
        List<WebElement> rows = categoriesPage.getCategoryTable().findElements(By.tagName("tr"));

        rows.get(1).click();

        categoryTypesPage.ensureIsDisplayedChosenCategory();

        assertEquals(categoryTypesPage.getChosenCategoryName().getText(), "Institucija types");

        WebElement editBtn = driver.findElement(By.xpath("(//*/table)[2]/tbody/tr[1]/td[2]/button[1]"));

        editBtn.click();

        justWait();

        inlineEditPage.ensureIsDisplayed();

        clearField(inlineEditPage.getInput(), inlineEditPage.getInput().getAttribute("value").length());

        justWait();

        inlineEditPage.getInput().sendKeys("Festival");

        justWait();

        inlineEditPage.getSave().click();

        synchronized (driver)
        {
            driver.wait(500);
        }
        
        assertEquals(categoryTypesPage.getToast().getText(), "Cultural category type with given name already exists.");

        justWait();
    }

    @Test
    public void editCategoryTypeTestRequiredFieldError() throws InterruptedException {
        justWait();

        //klik na Institucija
        List<WebElement> rows = categoriesPage.getCategoryTable().findElements(By.tagName("tr"));

        rows.get(1).click();

        categoryTypesPage.ensureIsDisplayedChosenCategory();

        assertEquals(categoryTypesPage.getChosenCategoryName().getText(), "Institucija types");

        WebElement editBtn = driver.findElement(By.xpath("(//*/table)[2]/tbody/tr[1]/td[2]/button[1]"));

        editBtn.click();

        justWait();

        inlineEditPage.ensureIsDisplayed();

        clearField(inlineEditPage.getInput(), inlineEditPage.getInput().getAttribute("value").length());

        justWait();

        inlineEditPage.getInput().sendKeys("");

        justWait();

        inlineEditPage.getSave().click();

        assertEquals(inlineEditPage.getError().getText(), "Required field");

        justWait();
    }
    
    @Test
    public void editCategoryTypeTestCapitalLetterError() throws InterruptedException {
        justWait();

        //klik na Institucija
        List<WebElement> rows = categoriesPage.getCategoryTable().findElements(By.tagName("tr"));

        rows.get(1).click();

        categoryTypesPage.ensureIsDisplayedChosenCategory();

        assertEquals(categoryTypesPage.getChosenCategoryName().getText(), "Institucija types");

        WebElement editBtn = driver.findElement(By.xpath("(//*/table)[2]/tbody/tr[1]/td[2]/button[1]"));

        editBtn.click();

        justWait();

        inlineEditPage.ensureIsDisplayed();

        clearField(inlineEditPage.getInput(), inlineEditPage.getInput().getAttribute("value").length());

        justWait();

        inlineEditPage.getInput().sendKeys("promenjeno ime");

        justWait();

        inlineEditPage.getSave().click();

        assertEquals(inlineEditPage.getError().getText(), "Must start with capital letter");

        justWait();
    }

    @Test
    public void editCategoryTypeTestSpecialCharactersError() throws InterruptedException {
        justWait();

        //klik na Institucija
        List<WebElement> rows = categoriesPage.getCategoryTable().findElements(By.tagName("tr"));

        rows.get(1).click();

        categoryTypesPage.ensureIsDisplayedChosenCategory();

        assertEquals(categoryTypesPage.getChosenCategoryName().getText(), "Institucija types");

        WebElement editBtn = driver.findElement(By.xpath("(//*/table)[2]/tbody/tr[1]/td[2]/button[1]"));

        editBtn.click();

        justWait();

        inlineEditPage.ensureIsDisplayed();

        clearField(inlineEditPage.getInput(), inlineEditPage.getInput().getAttribute("value").length());

        justWait();

        inlineEditPage.getInput().sendKeys("P3o%");

        justWait();

        inlineEditPage.getSave().click();

        assertEquals(inlineEditPage.getError().getText(), "Cannot contain special characters or numbers");

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
            driver.wait(2000);
        }
    }

    private void clearField(WebElement field, int backspaces) {
        for(int i = 0; i <=backspaces; i++ ){
            field.sendKeys(Keys.BACK_SPACE);
        }
    }
}
