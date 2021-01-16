package com.kts.nvt.serbioneer.e2e;

import org.junit.Before;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.PageFactory;

import com.kts.nvt.serbioneer.e2e.pages.HeaderPage;
import com.kts.nvt.serbioneer.e2e.pages.HomepagePage;
import com.kts.nvt.serbioneer.e2e.pages.LoginPage;

public class LogoutE2ETest {

	private WebDriver driver;

    private HeaderPage headerPage;

    private LoginPage loginPage;
  
    private HomepagePage homepagePage;
    
    @Before
    public void setUp() {
        //default-ni browser za selenium je firefox, pa ukoliko zelimo da koristimo chrome moramo da ubacimo
        //chrome ekstenziju i podesimo chrome kao default-ni driver
        System.setProperty("webdriver.chrome.driver", "src/test/resources/chromedriver.exe");
        driver = new ChromeDriver();

        //prosirenje prozora za bolji pregled
        driver.manage().window().maximize();
        //instanciranje potrebnih page objekata
        headerPage = PageFactory.initElements(driver, HeaderPage.class);
        loginPage = PageFactory.initElements(driver, LoginPage.class);
        homepagePage = PageFactory.initElements(driver, HomepagePage.class);

        //redirekcija na pocetak interakcije tj na login page
        driver.get("http://localhost:4200/login-register/login");
    }

}
