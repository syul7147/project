package kr.ezen.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
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
import kr.ezen.project.mapper.AdminMapper;
import kr.ezen.project.mapper.BoardMapper;
import kr.ezen.project.mapper.CartMapper;
import kr.ezen.project.mapper.ShopMapper;
import kr.ezen.project.util.Pspec;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartMapper mapper;
	@Autowired
	HttpSession session;
	@Autowired
	HttpServletRequest request;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;


	@Override
	public CartDTO cartChk(CartDTO cDto) {
		
		return mapper.cartChk(cDto);
	}

	@Override
	public void cartAdd(CartDTO cDto) {
		mapper.cartInsert(cDto);
		
	}

	@Override
	public List<CartDTO> getCart(String id) {
		
		return mapper.getCart(id);
	}

	@Override
	public void cartUpdate(CartDTO cDto) {
		mapper.cartModify(cDto);
		
	}

	@Override
	public void cartDelete(CartDTO cDto) {
		mapper.cartDelete(cDto);
		
	}

	@Override
	public UserDTO memberInfo(String id) {
		return mapper.memberInfo(id);
	}



	

	


}
