package kr.co.gudi.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class TestService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Value("${file.location}") private String root;
	

}
