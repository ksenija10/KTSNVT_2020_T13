package com.kts.nvt.serbioneer.e2e.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class HeaderPage {

    private WebDriver driver;

    @FindBy(id = "home-btn")
    private WebElement homeBtn;

    @FindBy(id = "user-btn-group")
    private WebElement userBtnGroup;

    @FindBy(id = "admin-btn-group")
    private WebElement adminBtnGroup;

    @FindBy(id = "logout-btn")
    private WebElement logoutBtn;

    public HeaderPage(WebDriver driver) { this.driver = driver; }

    public void ensureIsUnauthenticatedUser() {
        /*(new WebDriverWait(driver, 10)).until(
                ExpectedConditions.and(
                        ExpectedConditions.visibilityOf(homeBtn),
                        ExpectedConditions.invisibilityOf(userBtnGroup),
                        ExpectedConditions.invisibilityOf(adminBtnGroup),
                        ExpectedConditions.invisibilityOf(logoutBtn)
                    )
                );*/
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.visibilityOf(homeBtn));
    }

    public void ensureIsAuthenticatedUser() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.and(
                        ExpectedConditions.visibilityOf(homeBtn),
                        ExpectedConditions.visibilityOf(userBtnGroup),
                        ExpectedConditions.invisibilityOf(adminBtnGroup),
                        ExpectedConditions.visibilityOf(logoutBtn)
                )
        );
    }

    public void ensureIsAdmin() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.and(
                        ExpectedConditions.visibilityOf(homeBtn),
                        ExpectedConditions.invisibilityOf(userBtnGroup),
                        ExpectedConditions.visibilityOf(adminBtnGroup),
                        ExpectedConditions.visibilityOf(logoutBtn)
                )
        );
    }

    public WebElement getHomeBtn() {
        return homeBtn;
    }

    public WebElement getUserBtnGroup() {
        return userBtnGroup;
    }

    public WebElement getAdminBtnGroup() {
        return adminBtnGroup;
    }

    public WebElement getLogoutBtn() {
        return logoutBtn;
    }
}
