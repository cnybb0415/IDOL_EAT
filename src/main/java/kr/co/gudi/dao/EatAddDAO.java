package kr.co.gudi.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.dto.IdolDTO;

@Mapper
public interface EatAddDAO {

//	void eatAdd(HashMap<String, String> params, String user_idx);

	ArrayList<IdolDTO> EatAddIdolList();

	void eatAdd(String idol_idx, String eat_address, String eat_name, String user_idx, String eat_source);


}
