package kr.co.gudi.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.dto.IdolDTO;
import kr.co.gudi.service.AdminIdolService;

@Controller
public class AdminIdolController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AdminIdolService service;

	//000.move 로 요청이 오면 000.jsp 로 보내는 컨트롤러
	// 매개변수가 달라서 메소드명이 같아도 동작함(오버라이드)
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
	
	@RequestMapping(value="/")
	public String home() {
		return "home";
	}
	
	
	@RequestMapping(value="/adminIdol.do", method=RequestMethod.POST)
	public String write(Model model, @RequestParam HashMap<String, String> params, MultipartFile inputIdolImg,MultipartFile inputIdolMark) throws Exception {
		logger.info("params : {}",params);
		logger.info("files : {}",inputIdolImg);
		logger.info("files : {}",inputIdolMark);
		
		service.write(params,inputIdolImg,inputIdolMark);
		
		return "redirect:/";
	}
	@ResponseBody
	@RequestMapping(value = "/idolList")
	public HashMap<String, Object> idolList() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<IdolDTO> adminIdolList = service.idolList();
		map.put("adminIdolList", adminIdolList);	
		logger.info("보내주기 : "+map);

		return map; 
	}
	
	
	
}
