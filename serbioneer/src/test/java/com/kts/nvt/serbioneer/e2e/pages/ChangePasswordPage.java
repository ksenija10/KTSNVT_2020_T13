package com.kts.nvt.serbioneer.e2e.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class ChangePasswordPage {

    WebDriver driver;

    @FindBy(id = "change-password-form")
    WebElement changePasswordForm;

    @FindBy(id = "old-password")
    WebElement oldPassword;

    @FindBy(id = "new-password")
    WebElement newPassword;

    @FindBy(id = "repeat-password")
    WebElement repeatPassword;

    @FindBy(id = "change-password-btn")
    WebElement changePassBtn;

    @FindBy(xpath = "//*[@id=\"toast-container\"]//*[1]//*[1]")
    private WebElement toast;

    public ChangePasswordPage(WebDriver driver) {
        this.driver = driver;
    }

    public void ensureIsDisplayedChangePasswordForm() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.and(
                        ExpectedConditions.visibilityOf(changePasswordForm),
                        ExpectedConditions.visibilityOf(oldPassword),
                        ExpectedConditions.visibilityOf(newPassword),
                        ExpectedConditions.visibilityOf(repeatPassword),
                        ExpectedConditions.visibilityOf(changePassBtn)
                )
        );
    }

    public void toastSuccess() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.textToBePresentInElement(toast,"Password updated successfully!"));
    }

    public WebElement getChangePasswordForm() {
        return changePasswordForm;
    }

    public WebElement getOldPassword() {
        return oldPassword;
    }

    public WebElement getNewPassword() {
        return newPassword;
    }

    public WebElement getRepeatPassword() {
        return repeatPassword;
    }

    public WebElement getChangePassBtn() {
        return changePassBtn;
    }
}
