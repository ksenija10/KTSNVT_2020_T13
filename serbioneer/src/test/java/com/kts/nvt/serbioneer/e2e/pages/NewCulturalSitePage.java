package com.kts.nvt.serbioneer.e2e.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class NewCulturalSitePage {

    private WebDriver driver;

    @FindBy(id = "cultural-site-form")
    private WebElement culturalSiteForm;

    @FindBy(id = "name")
    private WebElement name;

    @FindBy(id = "address")
    private WebElement address;

    @FindBy(id = "description")
    private WebElement description;

    @FindBy(id = "latitude")
    private WebElement latituide;

    @FindBy(id = "longitude")
    private WebElement longitude;

    @FindBy(id = "category")
    private WebElement category;

    @FindBy(id = "category-type")
    private WebElement type;

    @FindBy(id = "files")
    private WebElement files;

    @FindBy(xpath = "//*[@id=\"toast-container\"]//*[1]//*[1]")
    private WebElement toast;

    @FindBy(id = "name-error")
    private WebElement nameError;

    @FindBy(id = "address-error")
    private WebElement addressError;

    @FindBy(id = "category-error")
    private WebElement categoryError;

    @FindBy(id = "type-error")
    private WebElement typeError;

    @FindBy(id = "add-button")
    private WebElement addButton;

    public NewCulturalSitePage(WebDriver driver){
        this.driver = driver;
    }

    public void ensureIsVisibleNewCulturalSiteForm() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.and(
                        ExpectedConditions.visibilityOf(culturalSiteForm),
                        ExpectedConditions.visibilityOf(name),
                        ExpectedConditions.visibilityOf(address),
                        ExpectedConditions.visibilityOf(description),
                        ExpectedConditions.visibilityOf(latituide),
                        ExpectedConditions.visibilityOf(longitude),
                        ExpectedConditions.visibilityOf(category),
                        ExpectedConditions.visibilityOf(type),
                        ExpectedConditions.visibilityOf(addButton)
                )
        );
    }

    public void toastSuccess() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.textToBePresentInElement(toast, "Successfully added new cultural site!"));
    }

    public void toastSuccessEdit() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.textToBePresentInElement(toast, "Successfully edited cultural site!"));
    }

    public void toastError(String message) {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.textToBePresentInElement(toast, message)
        );
    }

    public WebElement getCulturalSiteForm() {
        return culturalSiteForm;
    }

    public WebElement getName() {
        return name;
    }

    public WebElement getAddress() {
        return address;
    }

    public WebElement getDescription() {
        return description;
    }

    public WebElement getLatituide() {
        return latituide;
    }

    public WebElement getLongitude() {
        return longitude;
    }

    public WebElement getCategory() {
        return category;
    }

    public WebElement getType() {
        return type;
    }

    public WebElement getFiles() {
        return files;
    }

    public WebElement getToast() {
        return toast;
    }

    public WebElement getNameError() {
        return nameError;
    }

    public WebElement getAddressError() {
        return addressError;
    }

    public WebElement getCategoryError() {
        return categoryError;
    }

    public WebElement getTypeError() {
        return typeError;
    }

    public WebElement getAddButton() {
        return addButton;
    }
}
