package com.kts.nvt.serbioneer.e2e.pages;

import lombok.extern.java.Log;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class LoginPage {

    private WebDriver driver;

    @FindBy(id = "login-form")
    private WebElement loginForm;

    @FindBy(id = "email-input")
    private WebElement email;

    @FindBy(id = "password-input")
    private WebElement password;

    @FindBy(id = "login-btn")
    private WebElement loginBtn;

    public LoginPage(WebDriver driver ) { this.driver = driver; }

    public void ensureIsDisplayedLoginForm() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.and(
                        ExpectedConditions.visibilityOf(loginForm),
                        ExpectedConditions.visibilityOf(email),
                        ExpectedConditions.visibilityOf(password),
                        ExpectedConditions.visibilityOf(loginBtn)
                )
        );
    }

    public WebElement getLoginForm() {
        return loginForm;
    }

    public WebElement getEmail() {
        return email;
    }

    public WebElement getPassword() {
        return password;
    }

    public WebElement getLoginBtn() {
        return loginBtn;
    }
}
