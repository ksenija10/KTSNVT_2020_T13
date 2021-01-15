package com.kts.nvt.serbioneer.e2e.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class MyProfilePage {

    WebDriver driver;

    @FindBy(id = "my-profile-form")
    WebElement myProfileForm;

    @FindBy(id = "email-input")
    WebElement email;

    @FindBy(id = "name-input")
    WebElement name;

    @FindBy(id = "surname-input")
    WebElement surname;

    @FindBy(id = "date-input")
    WebElement date;

    @FindBy(id = "save-btn")
    WebElement saveBtn;

    @FindBy(xpath = "//*[@id=\"toast-container\"]//*[1]//*[1]")
    private WebElement toast;

    public MyProfilePage(WebDriver driver) {
        this.driver = driver;
    }

    public void ensureIsDisplayedMyProfileForm() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.and(
                        ExpectedConditions.visibilityOf(myProfileForm),
                        ExpectedConditions.visibilityOf(email),
                        ExpectedConditions.visibilityOf(name),
                        ExpectedConditions.visibilityOf(surname),
                        ExpectedConditions.visibilityOf(date),
                        ExpectedConditions.visibilityOf(saveBtn)
                )
        );
    }

    public void toastSuccess() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.textToBePresentInElement(toast,"Personal information updated successfully!"));
    }

    public WebElement getMyProfileForm() {
        return myProfileForm;
    }

    public WebElement getEmail() {
        return email;
    }

    public WebElement getName() {
        return name;
    }

    public WebElement getSurname() {
        return surname;
    }

    public WebElement getDate() {
        return date;
    }

    public WebElement getSaveBtn() {
        return saveBtn;
    }
}
