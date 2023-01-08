package kr.co.gudi.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration// 설정 클래스라는 뜻
@EnableWebSecurity //시큐리티 설정
public class SecurityConfig {
	
	@Bean//비밀번호를 암호화하기 위한 빈
	public PasswordEncoder getPasswordEncoder() { // 오토와이어드로 부르면 BCryptPasswordEncoder 생성해서 줘라
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.httpBasic().disable().csrf().disable();
		return http.build();
	}
	
}
