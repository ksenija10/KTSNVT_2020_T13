package com.kts.nvt.serbioneer.e2e.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class DialogPage {

    private WebDriver driver;

    @FindBy( id = "dialog-yes")
    private WebElement dialogYes;

    @FindBy( id = "dialog-no")
    private WebElement dialogNo;

    public DialogPage(WebDriver driver) { this.driver = driver; }

    public void ensureIsDisplayed() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.and(
                    ExpectedConditions.visibilityOf(dialogYes),
                    ExpectedConditions.visibilityOf(dialogNo)
                )
        );
    }

    public WebElement getDialogYes() {
        return dialogYes;
    }

    public WebElement getDialogNo() {
        return dialogNo;
    }
}
