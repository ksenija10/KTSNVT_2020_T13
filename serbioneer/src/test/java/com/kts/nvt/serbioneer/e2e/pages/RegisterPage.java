package com.kts.nvt.serbioneer.e2e.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class RegisterPage {

    WebDriver driver;

    @FindBy(id = "register-form")
    WebElement registerForm;

    @FindBy(id = "email-input")
    WebElement email;

    @FindBy(id = "password-input")
    WebElement password;

    @FindBy(id = "repeat-password-input")
    WebElement repeatPassword;

    @FindBy(id = "name-input")
    WebElement name;

    @FindBy(id = "surname-input")
    WebElement surname;

    @FindBy(id = "register-btn")
    WebElement registerBtn;

    @FindBy(xpath = "//*[@id=\"toast-container\"]//*[1]//*[1]")
    private WebElement toast;

    @FindBy(id = "email-error")
    WebElement emailError;

    @FindBy(id = "password-error")
    WebElement passwordError;

    @FindBy(id = "repeat-password-error")
    WebElement repeatPasswordError;

    @FindBy(id = "passwords-error")
    WebElement passwordsDontMatchError;

    @FindBy(id = "name-error")
    WebElement nameError;

    @FindBy(id = "surname-error")
    WebElement surnameError;

    @FindBy(id = "show-pass")
    WebElement viewPass;

    @FindBy(id = "show-repeat-pass")
    WebElement viewRepeatPass;

    public RegisterPage(WebDriver driver) {
        this.driver = driver;
    }

    public void ensureIsVisibleRegisterForm() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.and(
                        ExpectedConditions.visibilityOf(registerForm),
                        ExpectedConditions.visibilityOf(email),
                        ExpectedConditions.visibilityOf(password),
                        ExpectedConditions.visibilityOf(repeatPassword),
                        ExpectedConditions.visibilityOf(name),
                        ExpectedConditions.visibilityOf(surname),
                        ExpectedConditions.visibilityOf(registerBtn)
                )
        );
    }

    public void toastSuccess() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.textToBePresentInElement(toast,"Confirmation mail sent!"));
    }

    public void toastError(String message) {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.textToBePresentInElement(toast,message));
    }

    public WebElement getRegisterForm() {
        return registerForm;
    }

    public WebElement getEmail() {
        return email;
    }

    public WebElement getPassword() {
        return password;
    }

    public WebElement getRepeatPassword() {
        return repeatPassword;
    }

    public WebElement getName() {
        return name;
    }

    public WebElement getSurname() {
        return surname;
    }

    public WebElement getRegisterBtn() {
        return registerBtn;
    }

    public WebElement getEmailError() {
        return emailError;
    }

    public WebElement getPasswordError() {
        return passwordError;
    }

    public WebElement getRepeatPasswordError() {
        return repeatPasswordError;
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
}
