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
public class AdminReviewService {

	@Autowired AdminDAO dao;
	Logger logger = LoggerFactory.getLogger(getClass());
	@Value("${file.location}") private String root;



	public ArrayList<ReviewDTO> reviewList() {
		
		return dao.reviewList();
	}



	public ArrayList<ReviewDTO> reviewDetail(String rev_idx) {
		logger.info("service rev_idx : "+rev_idx);
		return dao.reviewDetail(rev_idx);
	}



	public void reviewBlindYes(String rev_idx) {
		dao.reviewBlindYes(rev_idx);
		
	}



	public void reviewBlindNo(String rev_idx) {
		dao.reviewBlindNo(rev_idx);
		
	}
	

}
