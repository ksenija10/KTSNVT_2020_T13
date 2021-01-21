package com.kts.nvt.serbioneer.e2e.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class CulturalSiteViewPage {

    private WebDriver driver;

    @FindBy(id = "cultural-site-view")
    private WebElement culturalSiteView;

    @FindBy(id = "cultural-site-name")
    private WebElement culturalSiteName;

    @FindBy(id = "cultural-site-address")
    private WebElement culturalSiteAddress;

    @FindBy(id = "news-panel")
    private WebElement newsPanel;

    @FindBy(id = "comments-panel")
    private WebElement commentsPanel;

    @FindBy(id = "map-view")
    private WebElement mapView;

    public CulturalSiteViewPage(WebDriver driver) {
        this.driver = driver;
    }

    public void ensureIsDisplayedUnauthenticatedUser() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.and(
                        ExpectedConditions.visibilityOf(culturalSiteView),
                        ExpectedConditions.visibilityOf(culturalSiteName),
                        ExpectedConditions.visibilityOf(newsPanel),
                        ExpectedConditions.visibilityOf(commentsPanel),
                        ExpectedConditions.visibilityOf(mapView)
                )
        );
    }

    public WebElement getCulturalSiteView() {
        return culturalSiteView;
    }

    public WebElement getCulturalSiteName() {
        return culturalSiteName;
    }

    public WebElement getCulturalSiteAddress() {
        return culturalSiteAddress;
    }

    public WebElement getNewsPanel() {
        return newsPanel;
    }

    public WebElement getCommentsPanel() {
        return commentsPanel;
    }

    public WebElement getMapView() {
        return mapView;
    }
}
