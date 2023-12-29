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
import kr.ezen.project.domain.CategoryDTO;
import kr.ezen.project.domain.PageDTO;
import kr.ezen.project.domain.ProductDTO;
import kr.ezen.project.domain.ScategoryDTO;
import kr.ezen.project.domain.UserDTO;
import kr.ezen.project.mapper.AdminMapper;
import kr.ezen.project.mapper.BoardMapper;
import kr.ezen.project.util.Pspec;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper mapper;
	@Autowired
	HttpSession session;
	@Autowired
	HttpServletRequest request;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	@Override
	public boolean loginOk(AdminDTO dto) {
		
		AdminDTO aDto = mapper.loginOk(dto);
		String inputPw = dto.getPw();
		String dbPw = aDto.getPw();
		System.out.println(inputPw);
		System.out.println(dbPw);

		if (pwEncoder.matches(inputPw, dbPw)) {
			session.setAttribute("adminDTO", aDto);
			return true;
		} else {
			return false;
		}
	}
	@Override
	public int categoryOk(CategoryDTO dto) {
		
		return mapper.categoryOk(dto);
	}
	@Override
	public List<CategoryDTO> cList() {
		return mapper.getCList();
	}
	@Override
	public int sList(ScategoryDTO dto) {
		
		return mapper.inputSub(dto);
	}
	@Override
	public List<ScategoryDTO> scList() {
		return mapper.getScList();
	}
	@Override
	public CategoryDTO CList(int c_num) {
		return mapper.cListGet(c_num);
	}
	@Override
	public void remove(int c_num) {
		mapper.delete(c_num);
	}
	@Override
	public void update(CategoryDTO dto) {
		mapper.c_update(dto);
		
	}
	@Override
	public ScategoryDTO Sclist(int c_num) {
		return mapper.getSlist(c_num);
	}
	@Override
	public void subremove(int c_num) {
		mapper.subdelete(c_num);
	}
	@Override
	public void subupdate(ScategoryDTO dto) {
		mapper.s_update(dto);
		
	}
	@Override
	public int prodInput(Map map) {
		System.out.println(map);
		int n = mapper.prodInput(map);
		return n;
	}
	@Override
	public List<ProductDTO> prodList() {
		return mapper.getProdList();
	}
	@Override
	public ProductDTO prodUpdate(int pnum) {
		// TODO Auto-generated method stub
		return mapper.getProdModify(pnum);
	}
	@Override
	public void prodUpdateOk(Map map) {
		 mapper.prodModify(map);
	}
	@Override
	public void registerOk(AdminDTO dto) {
		String pw = dto.getPw();
		String apw = pwEncoder.encode(pw);
		dto.setPw(apw);
		mapper.registerOk(dto);
	}
	@Override
	public String idCheck(String id) {
		// TODO Auto-generated method stub
		return mapper.idCheck(id);
	}
	@Override
	public List<ProductDTO> pdList(String ps) {
			System.out.println(ps);
		return mapper.getPdList(ps);
	}
	@Override
	public void prodDel(int pnum) {
		mapper.deleteProd(pnum);
	}
	@Override
	public List<UserDTO> userList() {
		return mapper.userList();
	}
	@Override
	public void userDel(String id) {
		mapper.userDel(id);
		
	}


	


}
