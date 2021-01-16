package com.kts.nvt.serbioneer.e2e.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class PendingCommentsPage {

	private WebDriver driver;

	@FindBy(id = "login-form")
    private WebElement loginForm;
	
	@FindBy(id = "email-input")
    private WebElement email;

    @FindBy(id = "password-input")
    private WebElement password;

    @FindBy(id = "login-btn")
    private WebElement loginBtn;
    
    @FindBy(id = "approve-comment-1")
    private WebElement approveCommentBtn;
    
    @FindBy(id = "pending-comments-paginator")
    private WebElement pendingToasterPaginator;
    
    @FindBy(xpath = "//*[@id=\"toast-container\"]//*[1]//*[1]")
    private WebElement toast;
    
    @FindBy(id = "pending-comments-page")
    private WebElement pendingComments;
    
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

	public WebElement getLoginForm() {
		return loginForm;
	}

	public void setLoginForm(WebElement loginForm) {
		this.loginForm = loginForm;
	}

	public WebElement getEmail() {
		return email;
	}

	public void setEmail(WebElement email) {
		this.email = email;
	}

	public WebElement getPassword() {
		return password;
	}

	public void setPassword(WebElement password) {
		this.password = password;
	}

	public WebElement getLoginBtn() {
		return loginBtn;
	}

	public void setLoginBtn(WebElement loginBtn) {
		this.loginBtn = loginBtn;
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
}
