package kr.co.gudi.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {

	int join(HashMap<String, String> params);
	
	String login(String id);

	int joinGetId(String check_id);

}
