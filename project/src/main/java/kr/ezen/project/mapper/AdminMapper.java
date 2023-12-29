package kr.ezen.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ezen.project.domain.AdminDTO;
import kr.ezen.project.domain.BoardDTO;
import kr.ezen.project.domain.CategoryDTO;
import kr.ezen.project.domain.PageDTO;
import kr.ezen.project.domain.ProductDTO;
import kr.ezen.project.domain.ScategoryDTO;
import kr.ezen.project.domain.UserDTO;
import kr.ezen.project.util.Pspec;

public interface AdminMapper {

	void delete(int c_num);

	AdminDTO loginOk(AdminDTO dto);

	int categoryOk(CategoryDTO dto);

	List<CategoryDTO> getCList();

	int inputSub(ScategoryDTO dto);

	List<ScategoryDTO> getScList();
	
	CategoryDTO cListGet(int c_num);
	
	void c_update(CategoryDTO dto);

	ScategoryDTO getSlist(int c_num);

	void subdelete(int c_num);
	void s_update(ScategoryDTO dto);

	int prodInput(Map map);

	List<ProductDTO> getProdList();

	ProductDTO getProdModify(int pnum);

	void prodModify(Map map);

	void registerOk(AdminDTO dto);

	String idCheck(String id);

	List<ProductDTO> getPdList(String ps);

	void deleteProd(int pnum);

	List<UserDTO> userList();

	void userDel(String id);
}
