package com.kts.nvt.serbioneer.e2e.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class CategoryTypesPage {

    private WebDriver driver;

    @FindBy( id = "category-type-div")
    private WebElement categoryTypeDiv;

    @FindBy( id = "chosen-category-name")
    private WebElement chosenCategoryName;

    @FindBy( id = "no-category-chosen")
    private WebElement noCategoryChosen;

    @FindBy( id = "category-type-table")
    private WebElement categoyTypeTable;

    @FindBy( id = "types-paginator")
    private WebElement typesPaginator;

    @FindBy( id = "type-name-input")
    private WebElement typeName;

    @FindBy( id = "type-name-error")
    private WebElement typeNameError;

    @FindBy( id = "type-add-btn")
    private WebElement typeAddBtn;

    @FindBy(xpath = "(//*[@aria-label=\"Last page\"])[2]")
    private WebElement typeTableLastPageBtn;

    @FindBy(xpath = "//*[@id=\"toast-container\"]//*[1]//*[1]")
    private WebElement toast;

    public CategoryTypesPage(WebDriver driver) { this.driver = driver; }

    public void ensureIsDisplayed() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.visibilityOf(categoryTypeDiv)
        );
    }

    public void ensureIsDisplayedNoCategoryChosen() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.visibilityOf(noCategoryChosen)
        );
    }

    public void ensureIsDisplayedChosenCategory() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.visibilityOf(chosenCategoryName)
        );
    }

    public WebElement getChosenCategoryName() {
        return chosenCategoryName;
    }

    public WebElement getNoCategoryChosen() {
        return noCategoryChosen;
    }

    public WebElement getCategoyTypeTable() {
        return categoyTypeTable;
    }

    public WebElement getTypesPaginator() {
        return typesPaginator;
    }

    public WebElement getTypeName() {
        return typeName;
    }

    public WebElement getTypeNameError() {
        return typeNameError;
    }

    public WebElement getTypeAddBtn() {
        return typeAddBtn;
    }

    public WebElement getTypeTableLastPageBtn() {
        return typeTableLastPageBtn;
    }

    public WebElement getToast() {
        return toast;
    }
}
