package com.kts.nvt.serbioneer.e2e.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class LoginRegisterPage {

    WebDriver driver;

    @FindBy(id = "login-register")
    WebElement loginRegisterDiv;

    @FindBy(id = "login-link")
    WebElement loginLink;

    @FindBy(id = "register-link")
    WebElement registerLink;

    @FindBy(id = "login-form")
    WebElement loginForm;

    @FindBy(id = "register-form")
    WebElement registerForm;

    public LoginRegisterPage(WebDriver driver) {
        this.driver = driver;
    }

    public void ensureIsVisibleLoginRegisterDiv() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.and(
                        ExpectedConditions.visibilityOf(loginRegisterDiv),
                        ExpectedConditions.visibilityOf(loginLink),
                        ExpectedConditions.visibilityOf(registerLink)
                )
        );
    }

    public void ensureIsVisibleLoginForm() {
        (new WebDriverWait(driver, 10)).until(
            ExpectedConditions.visibilityOf(loginForm)
        );
    }

    public void ensureIsVisibleRegisterForm() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.visibilityOf(registerForm)
        );
    }

    public WebElement getLoginRegisterDiv() {
        return loginRegisterDiv;
    }

    public WebElement getLoginLink() {
        return loginLink;
    }

    public WebElement getRegisterLink() {
        return registerLink;
    }
}
