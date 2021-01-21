package com.kts.nvt.serbioneer.e2e.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class HeaderPage {

    private WebDriver driver;

    @FindBy(id = "home-btn")
    private WebElement homeBtn;

    @FindBy(id = "user-btn-group")
    private WebElement userBtnGroup;

    @FindBy(id = "admin-btn-group")
    private WebElement adminBtnGroup;

    @FindBy(id = "user-dropdown")
    private WebElement userDropDown;

    @FindBy(id = "login-header-btn")
    private WebElement loginHeaderBtn;
    
    @FindBy(id = "pending-comments-btn")
    private WebElement pendingCommentsBtn;

    @FindBy(id = "view-admin-btn")
    private WebElement viewAdminBtn;
    
    @FindBy(id = "newsfeed-btn")
	private WebElement newsfeedBtn;

    @FindBy(id = "categories-btn")
    private WebElement categoriesBtn;

    @FindBy(id = "my-profile-btn")
    private WebElement myProfileBtn;

    @FindBy(id = "change-password-btn")
    private WebElement changePasswordBtn;

    @FindBy(id = "logout-btn")
    private WebElement logoutBtn;

    public HeaderPage(WebDriver driver) { this.driver = driver; }

    public void ensureIsUnauthenticatedUser() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.and(
                        ExpectedConditions.visibilityOf(homeBtn),
                        ExpectedConditions.visibilityOf(loginHeaderBtn)
                )
        );
    }

    public void ensureIsAuthenticatedUser() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.and(
                        ExpectedConditions.visibilityOf(homeBtn),
                        ExpectedConditions.visibilityOf(userBtnGroup),
                        ExpectedConditions.visibilityOf(userDropDown)
                )
        );
    }

    public void ensureIsAdmin() {
        (new WebDriverWait(driver, 10)).until(
                ExpectedConditions.and(
                        ExpectedConditions.visibilityOf(homeBtn),
                        ExpectedConditions.visibilityOf(adminBtnGroup),
                        ExpectedConditions.visibilityOf(userDropDown)
                )
        );
    }

    public WebElement getHomeBtn() {
        return homeBtn;
    }

    public WebElement getUserBtnGroup() {
        return userBtnGroup;
    }

    public WebElement getAdminBtnGroup() {
        return adminBtnGroup;
    }

    public WebElement getUserDropDown() {
        return userDropDown;
    }
    
    public WebElement getPendingCommentsBtn() {
		return pendingCommentsBtn;
	}

	public void setPendingCommentsBtn(WebElement pendingComments) {
		this.pendingCommentsBtn = pendingComments;
	}

	public WebElement getNewsfeedBtn() {
		return newsfeedBtn;
	}

	public void setNewsfeedBtn(WebElement newsfeedBtn) {
		this.newsfeedBtn = newsfeedBtn;
	}

    public WebElement getLoginHeaderBtn() {
        return loginHeaderBtn;
    }

    public WebElement getMyProfileBtn() {
        return myProfileBtn;
    }

    public WebElement getChangePasswordBtn() {
        return changePasswordBtn;
    }

    public WebElement getLogoutBtn() {
        return logoutBtn;
    }

    public WebElement getCategoriesBtn() {
        return categoriesBtn;
    }

    public WebElement getViewAdminBtn() {
        return viewAdminBtn;
    }
}
