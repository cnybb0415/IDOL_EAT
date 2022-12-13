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
import kr.co.gudi.dto.ReviewDTO;
import kr.co.gudi.dto.UserDTO;
import kr.co.gudi.service.AdminEatService;
import kr.co.gudi.service.AdminIdolService;
import kr.co.gudi.service.AdminSearchService;
import kr.co.gudi.service.AdminUserService;

@Controller
public class AdminSearchController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AdminSearchService service;
	
	@ResponseBody
	@RequestMapping(value = "/adminSearch")
	public HashMap<String, Object> adminSearch(@RequestParam HashMap<String, String> params ) {
		
		logger.info("search params:{} ",params);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String adminCategory = params.get("adminCategory");
		logger.info("test : "+adminCategory);
		String adminFind = params.get("adminFind");
		logger.info("test : "+adminFind);
		String val = "";
		switch (adminCategory) {
		case "review":
			ArrayList<ReviewDTO> revSearch = service.revSearch(adminFind);
			map.put("adminSearchData", revSearch);
			break;
		case "eat":
			ArrayList<EatDTO> eatSearch = service.eatSearch(adminFind);
			map.put("adminSearchData", eatSearch);
			break;
		case "member":
			ArrayList<UserDTO> memSearch = service.memSearch(adminFind);
			map.put("adminSearchData", memSearch);
			break;
		case "idol":
			ArrayList<IdolDTO> idolSearch = service.idolSearch(adminFind);
			map.put("adminSearchData", idolSearch);
			break;

		default:
			break;
		}
		logger.info("map : "+map);
		return map; 
	}
	
	
	
	
}
