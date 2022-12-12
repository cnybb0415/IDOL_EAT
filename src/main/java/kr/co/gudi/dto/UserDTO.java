package kr.co.gudi.dto;

import org.apache.ibatis.type.Alias;

@Alias("UserDTO")
public class UserDTO {   
   
   private int user_idx;
   private String user_id;
   private String user_pw;
   private String user_adress;
   private String user_nick;
   private String user_birth;
   private String user_name;
   private String manage;
   private int user_state;
   
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