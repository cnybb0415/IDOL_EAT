package kr.co.gudi.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("IdolDTO")
public class IdolDTO {	
	private int idol_idx;
	private String idol_group;
	private String idol_name;
	private String idol_mark_ori;
	private String idol_mark_new;
	private String idol_img_ori;
	private String idol_img_new;
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
	public void setIdol_img_ori(String ido_img_ori) {
		this.idol_img_ori = ido_img_ori;
	}
	public String getIdol_img_new() {
		return idol_img_new;
	}
	public void setIdol_img_new(String ido_img_new) {
		this.idol_img_new = ido_img_new;
	}
	public int getIdol_state() {
		return idol_state;
	}
	public void setIdol_state(int idol_state) {
		this.idol_state = idol_state;
	}
	private int idol_state;
	
}
