package com.kts.nvt.serbioneer.e2e.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class SubscribedSitesPage {

	private WebDriver driver;
	
	@FindBy(id = "homepage")
	private WebElement subscribedSitesPage;
	
    public SubscribedSitesPage(WebDriver driver) {
        this.driver = driver;
    }
    
    public void ensureIsDisplayed() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.visibilityOf(subscribedSitesPage)
        );
    }
}
