package kr.co.gudi.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.dto.EatDTO;
import kr.co.gudi.dto.IdolDTO;
import kr.co.gudi.dto.ReviewDTO;
import kr.co.gudi.dto.UserDTO;

@Mapper
public interface AdminDAO {


//	void fileUpload(int idol_idx, String oriFileName, String newFileName);

	int write(IdolDTO dto);

	void imgFileUpload(String idol_idx, String imgOriFileName, String imgNewFileName);

	void markFileUpload(String idol_idx, String markOriFileName, String markNewFileName);

	ArrayList<IdolDTO> idolList();
	
	ArrayList<EatDTO> eatList();

	ArrayList<UserDTO> userList();

	ArrayList<ReviewDTO> reviewList();

	ArrayList<ReviewDTO> revSearch(String adminFind);

	ArrayList<EatDTO> eatSearch(String adminFind);

	ArrayList<UserDTO> memSearch(String adminFind);

	ArrayList<IdolDTO> idolSearch(String adminFind);

	EatDTO eatUser(String eat_idx);

	EatDTO eatData(String eat_idx);

	UserDTO userDetail(String user_idx);

	ArrayList<ReviewDTO> reviewDetail(String rev_idx);

	int update(String idol_idx,String idol_group,String idol_name);

	String eatDate(String eat_idx);

	IdolDTO idolUpdate(String idol_idx);

	void eatBlindYes(String eat_idx);

	void eatBlindNo(String eat_idx);

	void reviewBlindYes(String rev_idx);

	void reviewBlindNo(String rev_idx);

	void memberBlindYes(String user_idx);

	void memberBlindNo(String user_idx);

	void idolBlindYes(String idol_idx);

	void idolBlindNo(String idol_idx);


}
