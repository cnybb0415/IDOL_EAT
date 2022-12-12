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

@Service
public class AdminEatService {

	@Autowired AdminDAO dao;
	Logger logger = LoggerFactory.getLogger(getClass());
	@Value("${file.location}") private String root;
	public ArrayList<EatDTO> eatList() {
		
		return dao.eatList();
	}
	

}
