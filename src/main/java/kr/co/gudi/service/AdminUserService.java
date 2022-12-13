package kr.co.gudi.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

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

	public HashMap<String, Object> adminMemberDetail(String user_idx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		UserDTO userDetail = dao.userDetail(user_idx);
		
		map.put("userDetail", userDetail);
		return map;
	}
	

}
