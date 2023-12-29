package kr.ezen.project.domain;

import lombok.Data;

@Data
public class UserDTO {
	private String id;
	private String pw;
	private String name;
	private String tel;
	private String email;
	private String zipcode;
	private String roadAddr;
	private String detailAddr;
}
