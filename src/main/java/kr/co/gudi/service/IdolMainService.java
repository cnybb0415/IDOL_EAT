package kr.co.gudi.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.dao.IdolMainDAO;
import kr.co.gudi.dto.EatDTO;
import kr.co.gudi.dto.IdolDTO;
import kr.co.gudi.dto.ReviewDTO;
import kr.co.gudi.dto.UserDTO;

@Service
public class IdolMainService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired IdolMainDAO dao;
	@Value("${file.location}") private String root;
	
	public HashMap<String, Object> IdolMain(String idol_idx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<EatDTO> mainEatList = dao.mainEatList(idol_idx);

		map.put("mainEatList", mainEatList);	

		
		return map;
	}

	public ArrayList<IdolDTO> IdolMain() {
		
		return dao.idolList();
	}

	public ArrayList<EatDTO> mainList() {
		
		return dao.mainList();
	}
	

}
