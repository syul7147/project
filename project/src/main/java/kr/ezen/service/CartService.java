package kr.ezen.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ezen.project.domain.AdminDTO;
import kr.ezen.project.domain.BoardDTO;
import kr.ezen.project.domain.CartDTO;
import kr.ezen.project.domain.CategoryDTO;
import kr.ezen.project.domain.MemberDTO;
import kr.ezen.project.domain.PageDTO;
import kr.ezen.project.domain.ProductDTO;
import kr.ezen.project.domain.ScategoryDTO;
import kr.ezen.project.domain.UserDTO;
import kr.ezen.project.util.Pspec;

public interface CartService {
	CartDTO cartChk(CartDTO cDto);

	void cartAdd(CartDTO cDto);

	List<CartDTO> getCart(String id);

	void cartUpdate(CartDTO cDto);

	void cartDelete(CartDTO cDto);

	UserDTO memberInfo(String id);
	
	
}
