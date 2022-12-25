package kr.co.gudi.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("ReviewDTO")
public class ReviewDTO {	
	private int rev_idx;
	private Date rev_date;
	private String rev_content;
	private double rev_star;
	private int rev_state;
	private int user_idx;
	private int eat_idx;
	private String eat_name;
	private String eat_address;
	private Date eat_date;
	private String eat_source;
	private int eat_state;
	private int idol_idx;
	private String user_nick;
	
	
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String getEat_address() {
		return eat_address;
	}
	public void setEat_address(String eat_address) {
		this.eat_address = eat_address;
	}
	public Date getEat_date() {
		return eat_date;
	}
	public void setEat_date(Date eat_date) {
		this.eat_date = eat_date;
	}
	public String getEat_source() {
		return eat_source;
	}
	public void setEat_source(String eat_source) {
		this.eat_source = eat_source;
	}
	public int getEat_state() {
		return eat_state;
	}
	public void setEat_state(int eat_state) {
		this.eat_state = eat_state;
	}
	public int getIdol_idx() {
		return idol_idx;
	}
	public void setIdol_idx(int idol_idx) {
		this.idol_idx = idol_idx;
	}
	public String getEat_name() {
		return eat_name;
	}
	public void setEat_name(String eat_name) {
		this.eat_name = eat_name;
	}
	public int getRev_idx() {
		return rev_idx;
	}
	public void setRev_idx(int rev_idx) {
		this.rev_idx = rev_idx;
	}
	public Date getRev_date() {
		return rev_date;
	}
	public void setRev_date(Date rev_date) {
		this.rev_date = rev_date;
	}
	public String getRev_content() {
		return rev_content;
	}
	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}
	public double getRev_star() {
		return rev_star;
	}
	public void setRev_star(double rev_star) {
		this.rev_star = rev_star;
	}
	public int getRev_state() {
		return rev_state;
	}
	public void setRev_state(int rev_state) {
		this.rev_state = rev_state;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getEat_idx() {
		return eat_idx;
	}
	public void setEat_idx(int eat_idx) {
		this.eat_idx = eat_idx;
	}
	
	
}
