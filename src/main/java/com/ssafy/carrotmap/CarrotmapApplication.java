package com.ssafy.carrotmap;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.ssafy.carrotmap.repository.mapper")
public class CarrotmapApplication {

	public static void main(String[] args) {
		SpringApplication.run(CarrotmapApplication.class, args);
	}

}
