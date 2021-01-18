package com.kts.nvt.serbioneer.e2e.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class NewAdminPage {

    WebDriver driver;

    @FindBy(id = "new-admin-form")
    WebElement newAdminForm;

    @FindBy(id = "email-input")
    WebElement email;

    @FindBy(id = "password-input")
    WebElement password;

    @FindBy(id = "confirm-password-input")
    WebElement confirmPassword;

    @FindBy(id = "name-input")
    WebElement name;

    @FindBy(id = "surname-input")
    WebElement surname;

    @FindBy(id = "date-of-birth-input")
    WebElement dateOfBirth;

    @FindBy(id = "add-admin-button")
    WebElement addButton;

    @FindBy(xpath = "//*[@id=\"toast-container\"]//*[1]//*[1]")
    private WebElement toast;

    @FindBy(id = "email-error")
    WebElement emailError;

    @FindBy(id = "password-error")
    WebElement passwordError;

    @FindBy(id = "confirm-password-error")
    WebElement confirmPasswordError;

    @FindBy(id = "passwords-error")
    WebElement passwordsDontMatchError;

    @FindBy(id = "name-error")
    WebElement nameError;

    @FindBy(id = "surname-error")
    WebElement surnameError;

    @FindBy(id = "show-password")
    WebElement viewPass;

    @FindBy(id = "show-confirm-password")
    WebElement viewRepeatPass;

    @FindBy(id = "date-of-birth-error")
    WebElement dateOfBirthError;

    public NewAdminPage(WebDriver driver) {
        this.driver = driver;
    }

    public void ensureIsVisibleNewAdminForm() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.and(
                        ExpectedConditions.visibilityOf(newAdminForm),
                        ExpectedConditions.visibilityOf(email),
                        ExpectedConditions.visibilityOf(password),
                        ExpectedConditions.visibilityOf(email),
                        ExpectedConditions.visibilityOf(password),
                        ExpectedConditions.visibilityOf(confirmPassword),
                        ExpectedConditions.visibilityOf(name),
                        ExpectedConditions.visibilityOf(surname),
                        ExpectedConditions.visibilityOf(dateOfBirth),
                        ExpectedConditions.visibilityOf(addButton)
                )
        );
    }

    public void toastSuccess() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.textToBePresentInElement(toast, "Successfully added new admin"));
    }

    public void toastError(String message) {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.textToBePresentInElement(toast, message)
        );
    }

    public WebElement getNewAdminForm() {
        return newAdminForm;
    }

    public WebElement getEmail() {
        return email;
    }

    public WebElement getPassword() {
        return password;
    }

    public WebElement getConfirmPassword() {
        return confirmPassword;
    }

    public WebElement getName() {
        return name;
    }

    public WebElement getSurname() {
        return surname;
    }

    public WebElement getDateOfBirth() {
        return dateOfBirth;
    }

    public WebElement getAddButton() {
        return addButton;
    }

    public WebElement getEmailError() {
        return emailError;
    }

    public WebElement getPasswordError() {
        return passwordError;
    }

    public WebElement getConfirmPasswordError() {
        return confirmPasswordError;
    }

    public WebElement getPasswordsDontMatchError() {
        return passwordsDontMatchError;
    }

    public WebElement getNameError() {
        return nameError;
    }

    public WebElement getSurnameError() {
        return surnameError;
    }

    public WebElement getViewPass() {
        return viewPass;
    }

    public WebElement getViewRepeatPass() {
        return viewRepeatPass;
    }

    public WebElement getDateOfBirthError() {
        return dateOfBirthError;
    }
}
