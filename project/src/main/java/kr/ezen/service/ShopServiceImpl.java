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
import kr.ezen.project.mapper.AdminMapper;
import kr.ezen.project.mapper.BoardMapper;
import kr.ezen.project.mapper.ShopMapper;
import kr.ezen.project.util.Pspec;

@Service
public class ShopServiceImpl implements ShopService {
	@Autowired
	private ShopMapper mapper;
	@Autowired
	HttpSession session;
	@Autowired
	HttpServletRequest request;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	@Override
	public List<ProductDTO> specList(String pspecVal) {
		return mapper.getSpec(pspecVal);
	}

	@Override
	public List<ProductDTO> catList(String c_code) {
		System.out.println(c_code);
		return mapper.getCat(c_code);
	}

	@Override
	public List<ScategoryDTO> sList(String c_code) {
		return mapper.getS(c_code);
	}

	@Override
	public List<ProductDTO> subList(String c_subname) {
		return mapper.getSub(c_subname);
	}

	@Override
	public ProductDTO prodList(int pnum) {
		return mapper.getView(pnum);
	}
	

	


}
