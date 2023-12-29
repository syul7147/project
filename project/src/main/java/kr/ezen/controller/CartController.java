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
import kr.ezen.project.domain.CartDTO;
import kr.ezen.project.domain.CategoryDTO;
import kr.ezen.project.domain.MemberDTO;
import kr.ezen.project.domain.ProductDTO;
import kr.ezen.project.domain.ScategoryDTO;
import kr.ezen.project.domain.UserDTO;
import kr.ezen.project.util.Pspec;
import kr.ezen.service.AdminService;
import kr.ezen.service.CartService;
import kr.ezen.service.ShopService;

@Controller
@RequestMapping("/user")
public class CartController {
	
	@Autowired
	private CartService service; 
	@Autowired
	private AdminService AService;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/cartAdd.do")
	
	public String cartAdd(CartDTO cDto,Model model) {
		List<CategoryDTO> cDtos = AService.cList();
		Pspec[] pspecs = Pspec.values();
		model.addAttribute("pspec",pspecs);
		model.addAttribute("cDtos",cDtos);
		
		
		String id = (String)session.getAttribute("id");
		cDto.setId(id);
		CartDTO dto = service.cartChk(cDto);
		System.out.println(dto);
		
		if(dto == null) {
			service.cartAdd(cDto);
		}else {
			cDto.setPqty(dto.getPqty()+1);
			
			service.cartUpdate(cDto);
		}
		
		return "redirect:cartList.do";
	}
	@RequestMapping("/cartList.do")
	public String cartList(Model model) {
		List<CategoryDTO> cDtos = AService.cList();
		Pspec[] pspecs = Pspec.values();
		model.addAttribute("pspec",pspecs);
		model.addAttribute("cDtos",cDtos);
		String id = (String)session.getAttribute("id");
		
		List<CartDTO> list = service.getCart(id);	
		for(CartDTO cdto : list) {
			cdto.setTotal();
		}
		model.addAttribute("list",list);
		return "user/cart_list";
	}
	@RequestMapping("/cartModify.do")
	public String cartUpdate(CartDTO cDto) {
		String id = (String)session.getAttribute("id");
		cDto.setId(id);
		service.cartUpdate(cDto);
		return "redirect:cartList.do";
	}
	@RequestMapping("/cartDelete.do")
	public String cartDelete(CartDTO cDto,String delPnums) {
		String id = (String)session.getAttribute("id");
		cDto.setId(id);
		System.out.println(cDto);
		System.out.println(delPnums);
		if(delPnums != null) {
		String[] numArr = delPnums.split("/");
		System.out.println(numArr.toString());
			for(String pnum : numArr) {
				id = (String)session.getAttribute("id");
				cDto.setPnum(Integer.parseInt(pnum));
				cDto.setId(id);
				System.out.println(cDto);
				service.cartDelete(cDto);
			}
		}else {
			service.cartDelete(cDto);
		}
		return "redirect:cartList.do";
	}
	@RequestMapping("/checkout.do")
	public String checkout(Model model) {
		String id = (String)session.getAttribute("id");
		UserDTO mDto = service.memberInfo(id);
		
		List<CartDTO> list = service.getCart(id);	
		for(CartDTO cdto : list) {
			cdto.setTotal();
		}
		model.addAttribute("list",list);
		model.addAttribute("mDto",mDto);
		
		return "user/checkout";
		
		
	}
	
	


	

	

	
}
