package kr.co.gudi.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.co.gudi.dao.AdminDAO;
import kr.co.gudi.dto.EatDTO;
import kr.co.gudi.dto.IdolDTO;
import kr.co.gudi.dto.ReviewDTO;
import kr.co.gudi.dto.UserDTO;

@Service
public class AdminSearchService {

	@Autowired AdminDAO dao;
	Logger logger = LoggerFactory.getLogger(getClass());
	@Value("${file.location}") private String root;
	
	public ArrayList<ReviewDTO> revSearch(String adminFind) {
		logger.info("seach : "+adminFind);
		return dao.revSearch(adminFind);
	}
	public ArrayList<EatDTO> eatSearch(String adminFind) {
		
		return dao.eatSearch(adminFind);
	}
	public ArrayList<UserDTO> memSearch(String adminFind) {
		
		return dao.memSearch(adminFind);
	}
	public ArrayList<IdolDTO> idolSearch(String adminFind) {
		
		return dao.idolSearch(adminFind);
	}


}
