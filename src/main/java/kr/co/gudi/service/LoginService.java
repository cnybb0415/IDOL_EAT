package kr.co.gudi.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.gudi.dao.LoginDAO;

@Service
public class LoginService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired PasswordEncoder encoder;
	@Autowired LoginDAO dao;

	public HashMap<String, Object> join(HashMap<String, String> params) {
		
		String check_id= params.get("user_id");
		logger.info("아이디 확인 : "+check_id);
		int check_row = dao.joinGetId(check_id);
		logger.info("같은 아이디가 있는데요 : "+check_row);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String msg = "joinFalse";
		map.put("data", msg);
		
		
		if(check_row<1) {
		String plain_pw = params.get("user_pw");
		String enc_pw = encoder.encode(plain_pw); // 평문 비밀번호를 암호화
		logger.info("plain : "+plain_pw);
		logger.info("encoding : "+enc_pw);
		params.put("user_pw", enc_pw); //암호화된걸로 교체
		logger.info("params : "+params);
		int success = dao.join(params);
		
		logger.info(" success ? : "+success);
		msg = "success";
		
		map.put("msg", msg);
		}
		logger.info("뭐들어있음?"+map);
		
		return map;
	}

	
	public HashMap<String, Object> login(String loginId, String loginPw, 
			HttpSession session, RedirectAttributes rAttr) {
		
		boolean match = false;
		String getEnc_pw = dao.login(loginId);
		
		match = encoder.matches(loginPw, getEnc_pw);
		logger.info("인코딩 일치여부 : "+match);
		
		String msg = "loginFalse";
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("msg", msg);
		
		if(match) {
			msg = "success";
			map.put("msg", msg);
			
			session.setAttribute("loginId", loginId);
		}
		
		rAttr.addFlashAttribute("msg", msg);
		
		return map;
	}

}
