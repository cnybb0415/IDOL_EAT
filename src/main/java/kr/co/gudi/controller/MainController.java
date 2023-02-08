package kr.co.gudi.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class MainController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/")
	public String main() {
		return "login";
	}
	
	@RequestMapping(value = "/detail")
	public String detail() {
		return "detail";
	}
	
	@RequestMapping(value = "/{page}.go")
	public String pageMove(@PathVariable String page) {
		logger.info("page move : "+page);
		
		return page;
	}
	
	@RequestMapping(value = "{root}/{page}.go")
	public String pageMove(@PathVariable String root, @PathVariable String page) {
		logger.info("page move : {}/{}",root,page);
		
		return root+"/"+page;
	}
	
	@RequestMapping(value = "{root}/{sub}/{page}.go")
	public String pageMove(@PathVariable String root, 
			@PathVariable String sub,
			@PathVariable String page) {
		logger.info("page move : {}/{}/{}",root,sub,page);
		
		return root+"/"+sub+"/"+page;
	}
	
	@ResponseBody
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session, HttpServletRequest req){
		logger.info("로그아웃");
		session = req.getSession();
		session.invalidate();

		return "logout";
	}
	
	 @GetMapping(value="/photo.do")
	   public ResponseEntity<Resource> showImage(String path){
	      logger.info("photo name : "+path);
	      String filePath = "/usr/local/tomcat/webapps/upload/"+path;
	      
	      // 파일시스템으로 리소스를 읽어와 담는다.(리소스 바디)
	      Resource resource = new FileSystemResource(filePath);
	      
	      // 헤더(내가 보낼 컨텐트의 타입이 어떤것이)
	      HttpHeaders header = new HttpHeaders();
	      try {
	         String type = Files.probeContentType(Paths.get(filePath));
	         logger.info("file type : "+ type);
	         header.add("Content-Type", type);
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	      
	      return new ResponseEntity<Resource>(resource,header,HttpStatus.OK);
	   }
	
}
