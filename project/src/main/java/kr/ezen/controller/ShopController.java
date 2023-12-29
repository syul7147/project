package kr.ezen.controller;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ezen.project.domain.AdminDTO;
import kr.ezen.project.domain.CategoryDTO;
import kr.ezen.project.domain.ProductDTO;
import kr.ezen.project.domain.ScategoryDTO;
import kr.ezen.project.util.Pspec;
import kr.ezen.service.AdminService;
import kr.ezen.service.ShopService;

@Controller
@RequestMapping("/user")
public class ShopController {
	
	@Autowired
	private ShopService service; 
	@Autowired
	private AdminService AService;
	@RequestMapping("/specList.do")
	public String specList(Model model,String pspec) {
		List<CategoryDTO> cDtos = AService.cList();
		Pspec[] pspecs = Pspec.values();
		List<ProductDTO> list = service.specList(pspec);
		System.out.println(pspec);
		
		
		model.addAttribute("list",list);
		model.addAttribute("pspecVal",pspec);
		model.addAttribute("pspec",pspecs);
		model.addAttribute("cDtos",cDtos);
		
		return "user/specList";
	}
	@RequestMapping("/catList.do")
	public String catList(String c_code,String c_name,Model model) {
		List<ProductDTO> list = service.catList(c_code);
		List<ScategoryDTO> slist = service.sList(c_code);
		List<CategoryDTO> cDtos = AService.cList();
		Pspec[] pspecs = Pspec.values();
		model.addAttribute("slist",slist);
		model.addAttribute("catName",c_name);
		model.addAttribute("list",list);
		model.addAttribute("pspec",pspecs);
		model.addAttribute("cDtos",cDtos);
		return "user/categoryList";
	}
	@RequestMapping("/subList.do")
	public String subList(String c_code,String c_subname,String c_name,Model model) {
		List<ProductDTO> list = service.catList(c_code);
		List<ProductDTO> lists = service.subList(c_subname);
		List<ScategoryDTO> slist = service.sList(c_code);
		List<CategoryDTO> cDtos = AService.cList();
		Pspec[] pspecs = Pspec.values();
		model.addAttribute("slist",slist);
		model.addAttribute("lists",lists);
		model.addAttribute("c_subname",c_subname);
		model.addAttribute("catName",c_name);
		model.addAttribute("slist",slist);
		model.addAttribute("pspec",pspecs);
		model.addAttribute("cDtos",cDtos);
		
		return "user/subSpecList";
	}
	@RequestMapping("/prodView.do")
	public String prodView(int pnum,String pspec,Model model) {
		//left
		List<CategoryDTO> cDtos = AService.cList();
		Pspec[] pspecs = Pspec.values();
		model.addAttribute("pspec",pspecs);
		model.addAttribute("cDtos",cDtos);
		
		ProductDTO pDto = service.prodList(pnum);

		model.addAttribute("pspecs",pspec);
		model.addAttribute("pDto",pDto);
		
		return "user/prodView";
	}
	
	


	

	

	
}
