package kr.co.gudi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class MainController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/")
	public String main() {
		return "home";
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
	
}
