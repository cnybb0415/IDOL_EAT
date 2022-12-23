package kr.co.gudi.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.dto.IdolDTO;

@Mapper
public interface EatAddDAO {

	void eatAdd(HashMap<String, String> params);

	ArrayList<IdolDTO> EatAddIdolList();


}
