package kr.ezen.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDTO {
	private int pnum;
	private String pname;
	private String pcategory_fk;
	private String psubcategory_fk;
	private String pcompany;
	private String pimage;
	private int pqty;
	private int price;
	private String pspec;
	private String pcontent;
	private String psize;
	private int point;
	private Date pinput_date; 
}
