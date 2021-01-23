package com.kts.nvt.serbioneer.e2e.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class ViewAdminPage {
    private WebDriver driver;

    @FindBy(xpath = "//*[@id=\"toast-container\"]//*[1]//*[1]")
    private WebElement toast;

    @FindBy(id = "view-admin-page")
    private WebElement admins;

    @FindBy(id = "admin-table")
    private WebElement adminTable;

    @FindBy(id = "add-admin-button")
    private WebElement addAdminBtn;

    public ViewAdminPage(WebDriver driver) {
        this.driver = driver;
    }

    public void ensureIsDisplayedAdmins(){
        (new WebDriverWait(driver, 10)).until(ExpectedConditions.visibilityOf(admins));

    }

    public WebDriver getDriver() {
        return driver;
    }

    public WebElement getToast() {
        return toast;
    }

    public WebElement getAdmins() {
        return admins;
    }

    public WebElement getAdminTable() {
        return adminTable;
    }

    public WebElement getAddAdminBtn() {
        return addAdminBtn;
    }
}
