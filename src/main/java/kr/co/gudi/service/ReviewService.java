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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.dao.ReviewDAO;
import kr.co.gudi.dto.EatDTO;
import kr.co.gudi.dto.ReviewDTO;

@Service
public class ReviewService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ReviewDAO dao;

	@Value("${file.location}") private String root;
	public ReviewDTO detail(String eat_idx) {
		return dao.detail(eat_idx);
	}

	public HashMap<String, Object> reviewlist(String eat_idx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<EatDTO> reviewlist = dao.reviewlist(eat_idx);
		logger.info("1번");
		ArrayList<EatDTO> revList = dao.revList(eat_idx);
		logger.info("2번");
//		ModelAndView mav = new ModelAndView();	
		map.put("reviewList", reviewlist);
		map.put("revList", revList);
//		mav.addObject("reviewList",reviewlist);
//		mav.addObject("revList",revList);
//		
//		mav.setViewName("revDetail");
		return map;
	}

	public void revWrite(String rev_star, String eat_idx, 
			String rev_content, MultipartFile detailLoadImg, String user_id, HashMap<String, String> params) throws Exception {
		String user_idx = dao.userIdx(user_id);
		ReviewDTO dto = new ReviewDTO();
		dto.setRev_content(rev_content);
		dto.setEat_idx(eat_idx);
		dto.setUser_idx(user_idx);
		logger.info("user_idx : "+user_idx);
		int row = dao.revWrite(dto);
		int rev_idx = dto.getRev_idx();
		logger.info("rev_idx : "+rev_idx);
		logger.info("row : "+row);
		String flag = params.get("detailImgFlag");
		logger.info("flag : "+flag);
		if(row > 0 && flag.equals("1")) {
			
				dao.revUpdate(rev_star,rev_idx);
				upload(rev_idx,detailLoadImg);
				try {
					Thread.sleep(1);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				
				
			}
		}
		
		
	}

	private void upload(int rev_idx, MultipartFile detailLoadImg) throws Exception {
		logger.info("리뷰 사진 업로드");
		String revOriFileName =  detailLoadImg.getOriginalFilename();
		logger.info(revOriFileName);
		String imgext= revOriFileName.substring(revOriFileName.lastIndexOf("."));
		
		String revNewFileName = System.currentTimeMillis()+imgext; 
		Thread.sleep(1);
		logger.info("imgnew: "+revNewFileName);
		
		try {

			//<3>파일 저장 순서
			//1. uploadFile에서 bite 추출
			byte[] arrImg = detailLoadImg.getBytes();
			
			//2. 저장할 파일 위치 지정
			Path imgpath = Paths.get(root+revNewFileName);
			
			//3. 파일 write
			Files.write(imgpath, arrImg);
	
			dao.revFileUpload(rev_idx,revOriFileName,revNewFileName);
;

		}catch (Exception e) {
			e.printStackTrace();
		}

	}

	public String sessionId(String user_id) {
		return dao.sessionId(user_id);
		
	}

}
