package kr.co.gudi.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gudi.dto.IdolDTO;
import kr.co.gudi.service.EatAddService;

@Controller
public class EatAddController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired EatAddService service;
	
	@ResponseBody
	@RequestMapping(value = "/EatAddIdolList")
	public HashMap<String, Object> EatAddIdolList() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<IdolDTO> EatIdolData = service.EatAddIdolList();
		map.put("EatIdolData", EatIdolData);	
		logger.info("보내주기 : "+map);

		return map; 
	}
	
	@RequestMapping(value = "/EatAdd.do")
	public String eatAdd(Model model,@RequestParam HashMap<String, String> params ) {
		logger.info("params : {}",params);
		
		service.eatAdd(params);
		
		return "redirect:/";
	}

	
}
