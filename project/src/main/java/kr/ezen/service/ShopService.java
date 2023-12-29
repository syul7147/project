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
import kr.ezen.project.util.Pspec;

public interface ShopService {

	List<ProductDTO> specList(String pspecVal);

	List<ProductDTO> catList(String c_code);

	List<ScategoryDTO> sList(String c_code);

	List<ProductDTO> subList(String c_subname);

	ProductDTO prodList(int pnum);
	
	
}
