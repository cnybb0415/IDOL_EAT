package kr.co.gudi.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.dto.IdolDTO;

@Mapper
public interface AdminIdolDAO {


//	void fileUpload(int idol_idx, String oriFileName, String newFileName);

	int write(IdolDTO dto);

	void imgFileUpload(int idol_idx, String imgOriFileName, String imgNewFileName);

	void markFileUpload(int idol_idx, String markOriFileName, String markNewFileName);

	ArrayList<IdolDTO> idolList();


}
