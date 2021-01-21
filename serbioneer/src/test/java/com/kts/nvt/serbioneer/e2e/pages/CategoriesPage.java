package com.kts.nvt.serbioneer.e2e.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class CategoriesPage {

    private WebDriver driver;

    @FindBy( id = "categories")
    private WebElement categories;

    @FindBy( id = "cultural-category-name-input")
    private WebElement culturalCategoryName;

    @FindBy( id = "category-paginator")
    private WebElement categoryPaginator;

    @FindBy( id = "cultural-category-add-btn")
    private WebElement culturalCategoryAddBtn;

    @FindBy( id = "category-table")
    private WebElement categoryTable;

    @FindBy(xpath = "(//*[@aria-label=\"Last page\"])[1]")
    private WebElement categoryTableLastPageBtn;


    @FindBy(xpath = "//*[@id=\"toast-container\"]//*[1]//*[1]")
    private WebElement toast;

    @FindBy( id = "category-name-error")
    private WebElement categoryNameError;


    public CategoriesPage(WebDriver driver) { this.driver = driver; }

    public void ensureIsDisplayed() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.visibilityOf(categories)
        );
    }

    public WebElement getCulturalCategoryName() {
        return culturalCategoryName;
    }

    public WebElement getCategoryPaginator() {
        return categoryPaginator;
    }

    public WebElement getCulturalCategoryAddBtn() {
        return culturalCategoryAddBtn;
    }

    public WebElement getToast() {
        return toast;
    }

    public WebElement getCategoryTableLastPageBtn() {
        return categoryTableLastPageBtn;
    }

    public WebElement getCategoryTable() {
        return categoryTable;
    }

    public WebElement getCategoryNameError() {
        return categoryNameError;
    }
}
