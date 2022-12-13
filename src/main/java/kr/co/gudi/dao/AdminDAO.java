package kr.co.gudi.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.dto.EatDTO;
import kr.co.gudi.dto.IdolDTO;
import kr.co.gudi.dto.ReviewDTO;
import kr.co.gudi.dto.UserDTO;

@Mapper
public interface AdminDAO {


//	void fileUpload(int idol_idx, String oriFileName, String newFileName);

	int write(IdolDTO dto);

	void imgFileUpload(int idol_idx, String imgOriFileName, String imgNewFileName);

	void markFileUpload(int idol_idx, String markOriFileName, String markNewFileName);

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


}
