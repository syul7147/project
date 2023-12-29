package kr.ezen.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ezen.project.domain.AdminDTO;
import kr.ezen.project.domain.BoardDTO;
import kr.ezen.project.domain.CategoryDTO;
import kr.ezen.project.domain.PageDTO;
import kr.ezen.project.domain.ProductDTO;
import kr.ezen.project.domain.ScategoryDTO;
import kr.ezen.project.domain.UserDTO;

public interface UserService {
	

	
	
	void registerOk(UserDTO dto);

	String idCheck(String id);



	boolean userLoginOk(String id, String pw);

	String idFind(UserDTO dto);

	int pwFind(UserDTO dto);




	int pwCheck(String id, String pw);

	int updatePw(String id, String pw);

}
