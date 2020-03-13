package com.boraji.tutorial.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

@SpringBootApplication
public class MainApp extends SpringBootServletInitializer  {
   
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(MainApp.class);
    }
	
	
   public static void main(String[] args) {
      SpringApplication.run(MainApp.class, args);
   }
}


