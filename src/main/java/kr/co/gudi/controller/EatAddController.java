package kr.co.gudi.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import kr.co.gudi.dao.ReviewDAO;
import kr.co.gudi.dto.IdolDTO;
import kr.co.gudi.service.EatAddService;

@Controller
public class EatAddController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired EatAddService service;
	@Autowired ReviewDAO dao;
	@ResponseBody
	@RequestMapping(value = "/eatAddIdolList")
	public HashMap<String, Object> EatAddIdolList() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<IdolDTO> EatIdolData = service.EatAddIdolList();
		map.put("EatIdolData", EatIdolData);	
		logger.info("보내주기 : "+map);

		return map; 
	}
	
	@ResponseBody
	@RequestMapping(value = "/eatAdd.do")
	public String eatAdd(Model model,@RequestParam HashMap<String, String> params,HttpServletRequest req ) {
		logger.info("params : {}",params);
		HttpSession session = req.getSession();
		String user_id = (String) session.getAttribute("loginId");
		String user_idx = dao.userIdx(user_id);
		// idol_idx, eat_address, eat_name, user_idx, eat_source
		String idol_idx = params.get("idol_idx");
		String eat_address = params.get("eat_address");
		String eat_name = params.get("eat_name");
		String eat_source = params.get("eat_source");
		service.eatAdd(idol_idx,eat_address,eat_name,user_idx,eat_source);
		
		
		return "success";
	}

	
}
