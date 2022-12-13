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
import kr.co.gudi.dto.UserDTO;
import kr.co.gudi.service.AdminEatService;
import kr.co.gudi.service.AdminIdolService;
import kr.co.gudi.service.AdminUserService;

@Controller
public class AdminUserController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AdminUserService service;
	
	@ResponseBody
	@RequestMapping(value = "/adminMember")
	public HashMap<String, Object> userList() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<UserDTO> adminUserList = service.userList();
		map.put("adminMemberData", adminUserList);	
		logger.info("User 보내주기 : "+map);

		return map; 
	}
	
	@ResponseBody
	@RequestMapping(value = "/memberDetail.go")
	public HashMap<String, Object> adminMemberDetail(@RequestParam String user_idx) {
		
		
		return service.adminMemberDetail(user_idx);
	}
	
	
	
	
}
