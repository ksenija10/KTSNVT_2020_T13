package com.kts.nvt.serbioneer.e2e.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class InlineEditPage {
    private WebDriver driver;

    @FindBy( id = "inline-edit-form")
    private WebElement inlineEditForm;

    @FindBy( id = "inline-input")
    private WebElement input;

    @FindBy( id = "inline-error")
    private WebElement error;

    @FindBy( id = "inline-cancel")
    private WebElement cancel;

    @FindBy( id = "inline-save")
    private WebElement save;

    public InlineEditPage(WebDriver driver) { this.driver = driver; }

    public void ensureIsDisplayed() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.and(
                        ExpectedConditions.visibilityOf(inlineEditForm),
                        ExpectedConditions.visibilityOf(input),
                        ExpectedConditions.visibilityOf(cancel),
                        ExpectedConditions.visibilityOf(save)
                )
        );
    }

    public WebElement getInlineEditForm() {
        return inlineEditForm;
    }

    public WebElement getInput() {
        return input;
    }

    public WebElement getError() {
        return error;
    }

    public WebElement getCancel() {
        return cancel;
    }

    public WebElement getSave() {
        return save;
    }
}
