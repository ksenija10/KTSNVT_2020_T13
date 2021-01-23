package com.kts.nvt.serbioneer.e2e.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class HomepagePage {

    private WebDriver driver;

    @FindBy(id = "homepage")
    private WebElement homepage;

    @FindBy(id = "category-chips")
    private WebElement categoryChips;

    @FindBy(id = "cultural-site-name-input")
    private WebElement culturalSiteNameInput;

    @FindBy(id = "cultural-site-location-select")
    private WebElement culturalSiteLocationSelect;

    @FindBy(id = "filter-btn")
    private WebElement filterBtn;

    @FindBy(id = "table-view")
    private WebElement tableView;

    @FindBy(id = "map-view")
    private WebElement mapView;

    public HomepagePage(WebDriver driver) {
        this.driver = driver;
    }

    public void ensureIsDisplayedHomepage() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.and(
                        ExpectedConditions.visibilityOf(homepage),
                        ExpectedConditions.visibilityOf(categoryChips),
                        ExpectedConditions.visibilityOf(culturalSiteNameInput),
                        ExpectedConditions.visibilityOf(culturalSiteLocationSelect),
                        ExpectedConditions.visibilityOf(filterBtn),
                        ExpectedConditions.visibilityOf(tableView),
                        ExpectedConditions.visibilityOf(mapView)
                )
        );
    }

    public WebElement getHomepage() {
        return homepage;
    }

    public WebElement getCategoryChips() {
        return categoryChips;
    }

    public WebElement getCulturalSiteNameInput() {
        return culturalSiteNameInput;
    }

    public WebElement getCulturalSiteLocationSelect() {
        return culturalSiteLocationSelect;
    }

    public WebElement getFilterBtn() {
        return filterBtn;
    }

    public WebElement getTableView() {
        return tableView;
    }

    public WebElement getMapView() {
        return mapView;
    }
}
