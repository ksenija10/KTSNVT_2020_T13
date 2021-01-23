package com.kts.nvt.serbioneer.e2e.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class PendingCommentsPage {

	private WebDriver driver;
    
    @FindBy(id = "approve-comment-1")
    private WebElement approveCommentBtn;
    
    @FindBy(id = "reject-comment-3")
    private WebElement rejectCommentBtn;
    
    @FindBy(id = "pending-comments-paginator")
    private WebElement pendingToasterPaginator;
    
    @FindBy(xpath = "//*[@id=\"toast-container\"]//*[1]//*[1]")
    private WebElement toast;
    
    @FindBy(id = "pending-comments-page")
    private WebElement pendingComments;

    @FindBy(xpath = "(//*[@aria-label=\"Last page\"])[1]")
	private WebElement lastPage;

	@FindBy(xpath = "(//*[contains(@class, 'green-icon')])[last()]")
	private WebElement acceptLastComm;

    public PendingCommentsPage(WebDriver driver) {
		this.driver = driver;
	}

    public void toastApproveSuccess() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.textToBePresentInElement(toast,"Comment approved successfully!"));
    }
    
    public void toastRejectSuccess() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.textToBePresentInElement(toast,"Comment rejected successfully!"));
    }
    
    public void ensureIsDisplayedPendingComments() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.visibilityOf(pendingComments)
        );
    }

	public WebDriver getDriver() {
		return driver;
	}

	public void setDriver(WebDriver driver) {
		this.driver = driver;
	}

	public WebElement getToast() {
		return toast;
	}

	public void setToast(WebElement toast) {
		this.toast = toast;
	}

	public WebElement getApproveCommentBtn() {
		return approveCommentBtn;
	}

	public void setApproveCommentBtn(WebElement approveCommentBtn) {
		this.approveCommentBtn = approveCommentBtn;
	}

	public WebElement getPendingComments() {
		return pendingComments;
	}

	public void setPendingComments(WebElement pendingComments) {
		this.pendingComments = pendingComments;
	}

	public WebElement getPendingToasterPaginator() {
		return pendingToasterPaginator;
	}

	public void setPendingToasterPaginator(WebElement pendingToasterPaginator) {
		this.pendingToasterPaginator = pendingToasterPaginator;
	}

	public WebElement getRejectCommentBtn() {
		return rejectCommentBtn;
	}

	public void setRejectCommentBtn(WebElement rejectCommentBtn) {
		this.rejectCommentBtn = rejectCommentBtn;
	}

	public WebElement getLastPage() {
		return lastPage;
	}

	public WebElement getAcceptLastComm() {
		return acceptLastComm;
	}
}
