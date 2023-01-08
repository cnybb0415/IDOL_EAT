package kr.co.gudi.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.co.gudi.dao.EatAddDAO;
import kr.co.gudi.dto.IdolDTO;

@Service
public class EatAddService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Value("${file.location}") private String root;
	@Autowired EatAddDAO dao;
//	public void eatAdd(HashMap<String, String> params, String user_idx) {
//		
//		dao.eatAdd(params,user_idx);
//		
//	}
	public ArrayList<IdolDTO> EatAddIdolList() {
		
		return dao.EatAddIdolList();
	}
	public void eatAdd(String idol_idx, String eat_address, String eat_name, String user_idx, String eat_source) {
		dao.eatAdd(idol_idx,eat_address,eat_name,user_idx,eat_source);
		
	}
	

}
