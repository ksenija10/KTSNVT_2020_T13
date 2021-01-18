package com.kts.nvt.serbioneer.e2e;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.PageFactory;

import com.kts.nvt.serbioneer.e2e.pages.HeaderPage;
import com.kts.nvt.serbioneer.e2e.pages.HomepagePage;
import com.kts.nvt.serbioneer.e2e.pages.LoginPage;
import com.kts.nvt.serbioneer.e2e.pages.NewsfeedPage;

public class NewsfeedE2ETest {

	private WebDriver driver;
	
	private JavascriptExecutor jsExecutor;

    private HeaderPage headerPage;

    private LoginPage loginPage;
  
    private HomepagePage homepagePage;
    
    private NewsfeedPage newsfeedPage;

    @Before
    public void setUp() throws InterruptedException {
        //default-ni browser za selenium je firefox, pa ukoliko zelimo da koristimo chrome moramo da ubacimo
        //chrome ekstenziju i podesimo chrome kao default-ni driver
        System.setProperty("webdriver.chrome.driver", "src/test/resources/chromedriver.exe");
        driver = new ChromeDriver();
        
        jsExecutor = (JavascriptExecutor) driver;

        //prosirenje prozora za bolji pregled
        driver.manage().window().maximize();
        //instanciranje potrebnih page objekata
        headerPage = PageFactory.initElements(driver, HeaderPage.class);
        loginPage = PageFactory.initElements(driver, LoginPage.class);
        homepagePage = PageFactory.initElements(driver, HomepagePage.class);
        newsfeedPage = PageFactory.initElements(driver, NewsfeedPage.class);

        //redirekcija na pocetak interakcije tj na login page
        driver.get("http://localhost:4200/login-register/login");
    }
    
    @Test
    public void newsfeedSubscribedUser() throws InterruptedException {
    	justWait();

        loginPage.getEmail().sendKeys("prvi@user.com");

        loginPage.getPassword().sendKeys("user");

        loginPage.getViewPass().click();

        justWait();

        loginPage.getLoginBtn().click();
        
        justWait();
    	
    	headerPage.getNewsfeedBtn().click();
    	
    	justWait();
    	
    	assertEquals("http://localhost:4200/newsfeed", driver.getCurrentUrl());
    	
    	newsfeedPage.ensureIsDisplayedNewsfeed();
    	
    	int sizeBeforeScroll = driver.findElements(By.xpath("//div[@id='scroll-div']/app-news")).size();
    	
    	assertTrue(sizeBeforeScroll <= 2);
    	
    	justWait();
    	
    	jsExecutor.executeScript("window.scrollBy(0,1000)");
    	
    	justWait();
    	
    	int sizeAfterScroll = driver.findElements(By.xpath("//div[@id='scroll-div']/app-news")).size();
    	
    	assertTrue( (sizeAfterScroll - sizeBeforeScroll) <= 2);
    }
    
    
    @Test
    public void newsfeedUnsubscribedUser() throws InterruptedException {
    	justWait();

        loginPage.getEmail().sendKeys("drugi@user.com");

        loginPage.getPassword().sendKeys("user");

        loginPage.getViewPass().click();

        justWait();

        loginPage.getLoginBtn().click();
        
        justWait();
    	
    	headerPage.getNewsfeedBtn().click();
    	
    	justWait();
    	
    	assertEquals("http://localhost:4200/newsfeed", driver.getCurrentUrl());
    	
    	newsfeedPage.ensureIsDisplayedNewsfeed();
    	
    	int sizeBeforeScroll = driver.findElements(By.xpath("//div[@id='scroll-div']/app-news")).size();
    	
    	assertTrue(sizeBeforeScroll == 0);
    	
    	//toastr za prazan newsfeed
    }
    
    @After
    public void cleanUp() {
        driver.quit();
    }

    /*Omogucava cekanje da bi nam bile vidljivije promene tokom testa*/
    private void justWait() throws InterruptedException {
        synchronized (driver)
        {
            driver.wait(3500);
        }
    }
	
}
