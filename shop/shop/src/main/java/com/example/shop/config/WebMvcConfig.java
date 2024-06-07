package com.example.shop.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{

   @Value("${spring.servlet.multipart.location}") //application.properties 경로를 uploadPath에 집어넣은 것 
   String uploadPath;
   
   @Override    //addResourceHandlers 
   public void addResourceHandlers(ResourceHandlerRegistry registry) {
      registry.addResourceHandler("/images/**") // static - images 임의 폴더 생성 , 실제 저장되는 폴더는 C:/shop/img/ 
            .addResourceLocations("file:///" + uploadPath);
   }
}