package kr.co.gudi.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("EatDTO")
public class EatDTO {   
   
   private int eat_idx;
   private String eat_adress;
   private String eat_name;
   private Date eat_date;
   private String eat_source;
   private int eat_state;
   private int idol_idx;
   private String idol_group;
   private String idol_name;
   private String idol_mark_ori;
   private String idol_mark_new;
   private String idol_img_ori;
   private String idol_img_new;
   private int user_idx;
   private String user_id;
   private String user_pw;
   private String user_adress;
   private String user_nick;
   private String user_birth;
   private String user_name;
   private String manage;
   private int user_state;
   
   public int getEat_idx() {
      return eat_idx;
   }
   public void setEat_idx(int eat_idx) {
      this.eat_idx = eat_idx;
   }
   public String getEat_adress() {
      return eat_adress;
   }
   public void setEat_adress(String eat_adress) {
      this.eat_adress = eat_adress;
   }
   public String getEat_name() {
      return eat_name;
   }
   public void setEat_name(String eat_name) {
      this.eat_name = eat_name;
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
public String getIdol_group() {
	return idol_group;
}
public void setIdol_group(String idol_group) {
	this.idol_group = idol_group;
}
public String getIdol_name() {
	return idol_name;
}
public void setIdol_name(String idol_name) {
	this.idol_name = idol_name;
}
public String getIdol_mark_ori() {
	return idol_mark_ori;
}
public void setIdol_mark_ori(String idol_mark_ori) {
	this.idol_mark_ori = idol_mark_ori;
}
public String getIdol_mark_new() {
	return idol_mark_new;
}
public void setIdol_mark_new(String idol_mark_new) {
	this.idol_mark_new = idol_mark_new;
}
public String getIdol_img_ori() {
	return idol_img_ori;
}
public void setIdol_img_ori(String idol_img_ori) {
	this.idol_img_ori = idol_img_ori;
}
public String getIdol_img_new() {
	return idol_img_new;
}
public void setIdol_img_new(String idol_img_new) {
	this.idol_img_new = idol_img_new;
}
public int getUser_idx() {
	return user_idx;
}
public void setUser_idx(int user_idx) {
	this.user_idx = user_idx;
}
public String getUser_id() {
	return user_id;
}
public void setUser_id(String user_id) {
	this.user_id = user_id;
}
public String getUser_pw() {
	return user_pw;
}
public void setUser_pw(String user_pw) {
	this.user_pw = user_pw;
}
public String getUser_adress() {
	return user_adress;
}
public void setUser_adress(String user_adress) {
	this.user_adress = user_adress;
}
public String getUser_nick() {
	return user_nick;
}
public void setUser_nick(String user_nick) {
	this.user_nick = user_nick;
}
public String getUser_birth() {
	return user_birth;
}
public void setUser_birth(String user_birth) {
	this.user_birth = user_birth;
}
public String getUser_name() {
	return user_name;
}
public void setUser_name(String user_name) {
	this.user_name = user_name;
}
public String getManage() {
	return manage;
}
public void setManage(String manage) {
	this.manage = manage;
}
public int getUser_state() {
	return user_state;
}
public void setUser_state(int user_state) {
	this.user_state = user_state;
}
   
}