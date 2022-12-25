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

import kr.co.gudi.dto.EatDTO;
import kr.co.gudi.dto.IdolDTO;
import kr.co.gudi.service.AdminEatService;
import kr.co.gudi.service.AdminIdolService;
import kr.co.gudi.service.AdminUserService;

@Controller
public class AdminEatController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AdminEatService service;
	
	@ResponseBody
	@RequestMapping(value = "/adminEat")
	public HashMap<String, Object> eatList() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<EatDTO> adminEatList = service.eatList();
		map.put("adminEatData", adminEatList);	
		logger.info("Eat 보내주기 : "+map);

		return map; 
	}
	
	
	
//	@ResponseBody
//	@RequestMapping(value = "/adminEatDetail")
//	public HashMap<String, Object> adminEatDetail(@RequestParam String eat_idx) {
//		
//		
//		return service.adminEatDetail(eat_idx);
//	}
	
	@RequestMapping(value = "/eatDetail.go")
	public ModelAndView adminEatDetail(String eat_idx) {
		
		logger.info("idx : "+eat_idx);
		
		
		return service.adminEatDetail(eat_idx);
	}
	@ResponseBody
	@RequestMapping(value = "/eatBlindYes")
	public void eatBlindYes(@RequestParam HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("eat blind params : {}",params);
		String eat_idx = params.get("eat_idx");
		logger.info("idx : "+eat_idx);
		service.eatBlindYes(eat_idx);
		
	}
	@ResponseBody
	@RequestMapping(value = "/eatBlindNo")
	public void eatBlindNo(@RequestParam HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("eat blind params : {}",params);
		String eat_idx = params.get("eat_idx");
		logger.info("idx : "+eat_idx);
		
		service.eatBlindNo(eat_idx);
		
	}
	
	
	
	
}
