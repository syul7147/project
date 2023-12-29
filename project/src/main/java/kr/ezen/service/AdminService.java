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
import kr.ezen.project.util.Pspec;

public interface AdminService {
	
	//로그인 확인
	boolean loginOk(AdminDTO dto);

	int categoryOk(CategoryDTO dto);

	List<CategoryDTO> cList();

	int sList(ScategoryDTO dto);

	List<ScategoryDTO> scList();

	CategoryDTO CList(int c_num);

	void remove(int c_num);
	void update(CategoryDTO dto);

	ScategoryDTO Sclist(int c_num);

	void subremove(int c_num);
	void subupdate(ScategoryDTO dto);

	int prodInput(Map map);

	List<ProductDTO> prodList();

	ProductDTO prodUpdate(int pnum);

	void prodUpdateOk(Map map);

	void registerOk(AdminDTO dto);

	String idCheck(String id);

	List<ProductDTO> pdList(String ps);

	void prodDel(int pnum);

	List<UserDTO> userList();

	void userDel(String id);

}
