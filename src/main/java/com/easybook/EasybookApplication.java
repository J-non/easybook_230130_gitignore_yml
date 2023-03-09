package com.easybook;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class EasybookApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(EasybookApplication.class, args);
	}

}
