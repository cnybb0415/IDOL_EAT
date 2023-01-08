package kr.co.gudi.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import kr.co.gudi.dto.EatDTO;
import kr.co.gudi.dto.IdolDTO;
import kr.co.gudi.dto.ReviewDTO;
import kr.co.gudi.service.ReviewService;

@Controller
public class ReviewController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ReviewService service;
	
//	//가게정보
//	@ResponseBody
//	@RequestMapping(value="/revDetail.go")
//	public HashMap<String, Object> shopdetail(@RequestParam HashMap<String, String> params) {
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		String eat_idx = params.get("eat_idx");
//		logger.info("eat_idx : "+eat_idx);
//		ReviewDTO dto = service.detail(eat_idx);
//		map.put("shopDetail", dto);	
//		
//		return map;
//	}
	
	
	//후기 리스트

	@RequestMapping(value="/revDetail.go")
	public HashMap<String, Object> reviewlist(@RequestParam HashMap<String, String> params, HttpSession session) {
//		HashMap<String, Object> map = new HashMap<String, Object>();
		String eat_idx = params.get("eat_idx");
//		ArrayList<EatDTO> reviewlist = service.reviewlist(eat_idx);
//		map.put("reviewList", reviewlist);
		return service.reviewlist(eat_idx);
	}
	
	@ResponseBody
	@RequestMapping(value="/sessionId")
	public String sessionId(@RequestParam HashMap<String, String> params) {
//		HashMap<String, Object> map = new HashMap<String, Object>();
		String user_id = params.get("user_id");
//		ArrayList<EatDTO> reviewlist = service.reviewlist(eat_idx);
//		map.put("reviewList", reviewlist);
		return service.sessionId(user_id);
	}
	
	@RequestMapping(value="/revWrite")
	public String revWrite(@RequestParam HashMap<String, String> params, MultipartFile detailLoadImg, HttpServletRequest req) throws Exception {
		logger.info("rev params : {}",params);
		// detailLoadImg=aespa_winter.png, rev_star=3, eat_idx=1000, detailReview=test
		HttpSession session = req.getSession();
		String user_id = (String) session.getAttribute("loginId");
		String rev_star = params.get("rev_star");
		String eat_idx = params.get("eat_idx");
		String rev_content = params.get("detailReview");
		logger.info("rev_star : "+rev_star);
		logger.info("eat_idx : "+eat_idx);
		logger.info("rev_content : "+rev_content);
		logger.info("files : {}",detailLoadImg);
		logger.info("user id : "+user_id);
		
		service.revWrite(rev_star,eat_idx,rev_content,detailLoadImg,user_id);
		
		return "redirect:/revDetail.go?eat_idx="+eat_idx;
	}
	
}
