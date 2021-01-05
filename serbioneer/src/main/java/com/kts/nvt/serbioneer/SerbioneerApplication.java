package com.kts.nvt.serbioneer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

@EnableAsync
@SpringBootApplication
public class SerbioneerApplication {

	public static void main(String[] args) {
		SpringApplication.run(SerbioneerApplication.class, args);
	}
}
