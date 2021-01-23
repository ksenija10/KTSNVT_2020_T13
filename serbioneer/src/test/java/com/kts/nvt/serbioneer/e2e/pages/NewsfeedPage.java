package com.kts.nvt.serbioneer.e2e.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class NewsfeedPage {

	private WebDriver driver;
	
	@FindBy(xpath = "//*[@id=\"toast-container\"]//*[1]//*[1]")
    private WebElement toast;
	
	@FindBy(id = "newsfeed-page")
    private WebElement newsfeed;
	
	public NewsfeedPage(WebDriver driver ) { this.driver = driver; }
	
	public void ensureIsDisplayedNewsfeed() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.visibilityOf(newsfeed)
        );
    }
}
