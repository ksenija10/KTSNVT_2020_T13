package com.kts.nvt.serbioneer.e2e.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class AddNewsArticlePage {

    private WebDriver driver;

    @FindBy(id = "text-input-field")
    private WebElement textInput;

    @FindBy(id = "submit-new-news-btn")
    private WebElement submitNewNewsBtn;


    @FindBy(id = "name-error")
    private WebElement nameError;

    public AddNewsArticlePage(WebDriver driver) {
        this.driver = driver;
    }

    public WebElement getTextInput() {
        return textInput;
    }

    public WebElement getSubmitNewNewsBtn() {
        return submitNewNewsBtn;
    }

    public WebElement getNameError() {
        return nameError;
    }
}
