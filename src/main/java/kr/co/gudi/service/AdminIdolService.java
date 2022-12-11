package kr.co.gudi.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.dao.AdminIdolDAO;
import kr.co.gudi.dto.IdolDTO;


@Service
public class AdminIdolService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Value("${file.location}") private String root;
	@Autowired AdminIdolDAO dao;
	
	public void write(HashMap<String, String> params, MultipartFile inputIdolImg, MultipartFile inputIdolMark) throws Exception {
		IdolDTO dto = new IdolDTO(); 
		dto.setIdol_group(params.get("idolAddGroup"));
		dto.setIdol_name(params.get("idolAddName"));
		logger.info("서비스 글쓰기");
		logger.info("get : "+dto.getIdol_group());
		int row = dao.write(dto);
		logger.info("row : "+row);
		int idol_idx = dto.getIdol_idx();
		logger.info("file idx : "+idol_idx);
		
		
		if(row > 0) {
		upload(inputIdolImg, inputIdolMark, idol_idx);
			try {
				Thread.sleep(1); //이름이 1ms를 기준으로 생성되어야만 겹치지 않으므로 일부러 sleep을 줬다.
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		
	}

	public void upload(MultipartFile inputIdolImg, MultipartFile inputIdolMark, int idol_idx) throws Exception {
		//<1> 파일명 추출
				String imgOriFileName = inputIdolImg.getOriginalFilename();
				String markOriFileName = inputIdolMark.getOriginalFilename();
				logger.info(imgOriFileName);
				logger.info(markOriFileName);
				String imgext= imgOriFileName.substring(imgOriFileName.lastIndexOf("."));
				String markext= markOriFileName.substring(markOriFileName.lastIndexOf("."));
				
				//<2> 새 파일명 생성 - 저장할 때 다른 파일과 겹치지 않게 하기 위해
				String imgNewFileName = System.currentTimeMillis()+imgext; 
				Thread.sleep(1);
				String MarkNewFileName = System.currentTimeMillis()+markext; 
				//currentTimeMillis : 반환타입 long이라서 뒤에 문자열을 붙여 String타입으로 만들어줌
				logger.info("imgnew: "+imgNewFileName);
				logger.info("marknew: "+MarkNewFileName);
				try {
					
					//<3>파일 저장 순서
					//1. uploadFile에서 bite 추출
					byte[] arrImg = inputIdolImg.getBytes();
					byte[] arrMark = inputIdolMark.getBytes();
					//2. 저장할 파일 위치 지정
					Path imgpath = Paths.get(root+imgNewFileName);
					Path markpath = Paths.get(root+MarkNewFileName);
					//3. 파일 write
					Files.write(imgpath, arrImg);
					Files.write(markpath, arrMark);
					dao.imgFileUpload(idol_idx,imgOriFileName,imgNewFileName);
					dao.markFileUpload(idol_idx,markOriFileName,MarkNewFileName);
					
				}catch (Exception e) {
					e.printStackTrace();
				}
		
	}

	public ArrayList<IdolDTO> idolList() {
//		ModelAndView mav = new ModelAndView();
//		ArrayList<IdolDTO> adminIdolData = dao.idolList();
//		logger.info("idolData : "+adminIdolData);

		return dao.idolList();
	}


	

}
