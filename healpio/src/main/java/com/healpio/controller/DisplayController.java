package com.healpio.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class DisplayController {

	public static final String ATTACHES_DIRECTORY = "C:\\upload\\";
	
	@GetMapping("display")
	// 이미지를 화면에 보여줍니다
	public ResponseEntity<byte[]> display(String fileName) {
		log.info("=====fileName : " + fileName);
		
		try {
			// 파일 객체를 생성
			File file = new File(ATTACHES_DIRECTORY + fileName);
			HttpHeaders headers = new HttpHeaders();
			
			// 이미지 파일이 존재하면 파일을 이미지를 다운로드
			if(file.exists()) {
				// Mime타입을 설정
				headers.add("Content-Type",Files.probeContentType(file.toPath()));
				return new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
			}else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			
		} catch (IOException e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}		
	}
 
}
