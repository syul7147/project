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

public interface UserMapper {

	void registerOk(UserDTO dto);

	String idCheck(String id);

	UserDTO userLoginOk(String id);

	String idFind(UserDTO dto);

	int pwFind(UserDTO dto);

	String pwCheck(String id);

	int updatePw(String id, String uPw);
}
