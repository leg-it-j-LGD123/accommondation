package com.sdms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;

import java.awt.*;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

@SpringBootApplication
public class SdmsApplication {

    public static void main(String[] args) throws URISyntaxException, IOException {
        ConfigurableApplicationContext context = SpringApplication.run(SdmsApplication.class, args);
        Environment env = context.getEnvironment();
//
//        System.out.println("==== YML Configuration Properties ====");
//        System.out.println("spring.profiles.active: " + env.getProperty("spring.profiles.active"));
//        System.out.println("server.port: " + env.getProperty("server.port"));
//        System.out.println("spring.datasource.url: " + env.getProperty("spring.datasource.url"));
//        System.out.println("picture.path: " + env.getProperty("picture.path"));
//        System.out.println("=======================================");
//        System.setProperty("java.awt.headless", "false");
//        System.out.println("密码的加密使用了MD5加盐算法,将用户的username作为盐对明文进行加密,见 com.sdms.common.util.MD5Utils.encodeWithSalt \n\r" +
//                "项目使用了queryDSL,运行 mvn compile 命令生成对应的Q类,见 target/generated-sources/java目录 \n\r" +
//                "集成了swagger2,见 http://localhost:8080/swagger-ui/index.html \n\r" +
//                "不支持IE浏览器,请用Chrome、Edge等浏览器打开 http://localhost:8080/ ");
//        Desktop.getDesktop().browse(new URI("http://localhost:8080/login"));// 自动打开浏览器
    }
}