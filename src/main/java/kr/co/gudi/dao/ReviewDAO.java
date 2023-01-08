package kr.co.gudi.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.dto.EatDTO;
import kr.co.gudi.dto.ReviewDTO;

@Mapper
public interface ReviewDAO {

	ReviewDTO detail(String eat_idx);

	ArrayList<EatDTO> reviewlist(String eat_idx);

	ArrayList<EatDTO> revList(String eat_idx);

	String userIdx(String user_id);

//	int revWrite(String rev_star, String eat_idx, String rev_content, String user_idx);

	void revFileUpload(int rev_idx, String revOriFileName, String revNewFileName);

	int revWrite(ReviewDTO dto);

	void revUpdate(String rev_star, int rev_idx);

	String sessionId(String user_id);

}
