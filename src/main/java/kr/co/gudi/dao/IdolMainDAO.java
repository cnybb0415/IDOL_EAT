package kr.co.gudi.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.dto.EatDTO;
import kr.co.gudi.dto.IdolDTO;

@Mapper
public interface IdolMainDAO {

	ArrayList<EatDTO> mainEatList(String idol_idx);

	ArrayList<IdolDTO> idolList();

	ArrayList<EatDTO> mainList();


}
