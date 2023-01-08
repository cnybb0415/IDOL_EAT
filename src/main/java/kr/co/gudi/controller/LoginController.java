package kr.co.gudi.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.gudi.service.LoginService;

@Controller
public class LoginController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired LoginService service;
	
	@ResponseBody
	@PostMapping(value = "/login.do")
	public HashMap<String, Object> login(String loginId, String loginPw
			,HttpSession session, RedirectAttributes rAttr) {
		logger.info("id: {} , pw : {}",loginId,loginPw);
		return service.login(loginId,loginPw, session, rAttr);
	}
	
	@ResponseBody
	@PostMapping(value = "/join.do")
	public HashMap<String, Object> join(@RequestParam HashMap<String, String> params) {
		logger.info("params : "+params);
		
		return service.join(params);
	}

}
