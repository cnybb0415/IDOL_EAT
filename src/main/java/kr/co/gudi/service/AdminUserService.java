package kr.co.gudi.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.dao.AdminDAO;
import kr.co.gudi.dto.EatDTO;
import kr.co.gudi.dto.IdolDTO;
import kr.co.gudi.dto.UserDTO;

@Service
public class AdminUserService {

	@Autowired AdminDAO dao;
	Logger logger = LoggerFactory.getLogger(getClass());
	@Value("${file.location}") private String root;

	public ArrayList<UserDTO> userList() {
		
		return dao.userList();
	}

	public ModelAndView adminMemberDetail(String user_idx) {
		
		UserDTO userDetail = dao.userDetail(user_idx);
		ModelAndView mav = new ModelAndView();	
		mav.addObject("userDetail", userDetail);
		mav.setViewName("memberDetail");
		
		return mav;
	}

	public void memberBlindYes(String user_idx) {
		
		dao.memberBlindYes(user_idx);
		
	}

	public void memberBlindNo(String user_idx) {
		dao.memberBlindNo(user_idx);
		
	}
	

}
