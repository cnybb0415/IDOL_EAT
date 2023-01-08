package kr.co.gudi.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.dto.EatDTO;
import kr.co.gudi.dto.IdolDTO;
import kr.co.gudi.dto.ReviewDTO;
import kr.co.gudi.service.IdolMainService;

@Controller
public class IdolMainController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired IdolMainService service;
	
	
	@ResponseBody
	@RequestMapping(value = "/mainList")
	public HashMap<String, Object> mainList(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String user_id = (String) session.getAttribute("loginId");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<EatDTO> mainList = service.mainList();
		map.put("mainList", mainList);	
		logger.info("보내주기 : "+map);
		
		return map; 
	}
	
	@ResponseBody
	@RequestMapping(value = "/mainIdolList")
	public HashMap<String, Object> mainIdolList() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<IdolDTO> IdolMain = service.IdolMain();
		map.put("IdolMain", IdolMain);	
		logger.info("보내주기 : "+map);

		return map; 
	}
	
	@ResponseBody
	@RequestMapping(value = "/idolMain")
	public HashMap<String, Object> IdolMain(@RequestParam HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		logger.info("params : "+params);
		String idol_idx = params.get("idol_idx");

		return service.IdolMain(idol_idx); 
	}
	
}
