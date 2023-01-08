package kr.co.gudi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
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
	
}
