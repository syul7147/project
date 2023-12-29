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
import kr.ezen.project.util.Pspec;

public interface ShopMapper {
	List<ProductDTO> getSpec(String pspecVal);

	List<ProductDTO> getCat(String c_code);

	List<ScategoryDTO> getS(String c_code);

	List<ProductDTO> getSub(String c_subname);

	ProductDTO getView(int pnum);

	
}
