package com.kts.nvt.serbioneer.e2e.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class TableViewPage {

    private WebDriver driver;

    @FindBy(id = "cultural-site-table")
    private WebElement culturalSiteTable;

    @FindBy(id = "cultural-site-table-paginator")
    private WebElement paginator;

    public TableViewPage(WebDriver driver) {
        this.driver = driver;
    }

    public void ensureIsDisplayedTableView() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.and(
                        ExpectedConditions.visibilityOf(culturalSiteTable),
                        ExpectedConditions.visibilityOf(paginator)
                )
        );
    }

    public WebElement getCulturalSiteTable() {
        return culturalSiteTable;
    }

    public WebElement getPaginator() {
        return paginator;
    }
}
