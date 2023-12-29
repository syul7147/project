package kr.ezen.project.domain;

import lombok.Data;

@Data
public class CartDTO {
	private int cnum;
	private String id;
	private int pnum;
	private int pqty;
	
	private String pname;
	private String pimage;
	private int price;
	private int point;
	private String pspec;
	
	private int totPrice;
	private int totPoint;	
	
	public void setTotal() {
		this.totPoint = pqty*point;
		this.totPrice = pqty*price;
	}
}

