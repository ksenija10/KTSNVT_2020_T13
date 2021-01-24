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

    @FindBy(id = "subscribe-btn")
    private WebElement subscribeBtn;

    @FindBy(xpath = "//*[@id=\"toast-container\"]//*[1]//*[1]")
    private WebElement toast;

    @FindBy(id = "cultural-site-rating")
    private WebElement rating;

    @FindBy(id = "leave-review-btn")
    private WebElement leaveReviewBtn;

    @FindBy(id = "new-comment-input")
    private WebElement addCommentInput;

    @FindBy(id = "add-comment-btn")
    private WebElement addCommentBtn;

    @FindBy(id = "new-comment-error")
    private WebElement newCommentError;

    @FindBy(xpath = "(//*[@aria-label=\"Last page\"])[2]")
    private WebElement lastPageComment;

    @FindBy(xpath = "(//*[@color=\"warn\"])[last()]")
    private WebElement deleteLastComment;

    @FindBy(id = "add-image-btn")
    private WebElement addImageBtn;

    @FindBy(id = "file")
    private WebElement newImageInput;

    @FindBy(id = "submit-new-image-btn")
    private WebElement submitNewImageBtn;

    @FindBy(id = "add-news-btn")
    private WebElement addNewsBtn;

    @FindBy(id = "edit-cultural-site")
    private WebElement editBtn;

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

    public WebElement getSubscribeBtn() {
        return subscribeBtn;
    }

    public WebElement getToast() {
        return toast;
    }

    public WebElement getRating() {
        return rating;
    }

    public WebElement getLeaveReviewBtn() {
        return leaveReviewBtn;
    }

    public WebElement getAddCommentInput() {
        return addCommentInput;
    }

    public WebElement getAddCommentBtn() {
        return addCommentBtn;
    }

    public WebElement getNewCommentError() {
        return newCommentError;
    }

    public WebElement getLastPageComment() {
        return lastPageComment;
    }

    public WebElement getDeleteLastComment() {
        return deleteLastComment;
    }

    public WebElement getAddImageBtn() {
        return addImageBtn;
    }

    public WebElement getNewImageInput() {
        return newImageInput;
    }

    public WebElement getSubmitNewImageBtn() {
        return submitNewImageBtn;
    }

    public WebElement getAddNewsBtn() {
        return addNewsBtn;
    }

    public WebElement getEditBtn() {
        return editBtn;
    }
}
