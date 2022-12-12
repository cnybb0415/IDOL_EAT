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

@Controller
public class AdminEatController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AdminEatService service;
	
	@ResponseBody
	@RequestMapping(value = "/eatList.do")
	public HashMap<String, Object> eatList() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<EatDTO> adminEatList = service.eatList();
		map.put("adminEatList", adminEatList);	
		logger.info("Eat 보내주기 : "+map);

		return map; 
	}
	
	
	
	
}
