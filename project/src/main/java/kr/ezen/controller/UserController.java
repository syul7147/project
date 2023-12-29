package kr.ezen.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ezen.project.domain.AdminDTO;
import kr.ezen.project.domain.CategoryDTO;
import kr.ezen.project.domain.ProductDTO;
import kr.ezen.project.domain.ScategoryDTO;
import kr.ezen.project.domain.UserDTO;
import kr.ezen.project.util.Pspec;
import kr.ezen.service.AdminService;
import kr.ezen.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService Service;
	@Autowired
	private AdminService AService;
	@Autowired
	HttpSession session;
	@Autowired
	JavaMailSender mailSender;
	
	@RequestMapping("/home.do")
	public String shopHome(Model model) {
		List<CategoryDTO> cDtos = AService.cList();
		
		Pspec[] pspec = Pspec.values();
		Map map = new HashMap();
		int i;
		for(i=0; i<pspec.length; i++) {
			String ps = pspec[i].getValue();
			List<ProductDTO> pDtos = AService.pdList(ps);
			map.put(ps,pDtos);  
		}
		Set key = map.keySet();
		model.addAttribute("key",key);
		model.addAttribute("map",map);
		model.addAttribute("pspec",pspec);
		model.addAttribute("cDtos",cDtos);
		
		return "user/u_main";
	}
	@RequestMapping("/join.do")
	public String register() {
		return "user/join";
	}
	@PostMapping("/userJoinOk.do")
	public String registerOk(UserDTO dto) {
		Service.registerOk(dto);
		session.setAttribute("loginId",dto.getId());
		return "redirect:login.do";
	}
	@RequestMapping("/userLogin.do")
	public String UserLogin(String moveUrl,Model model) {
		if(!moveUrl.equals("")) {
			model.addAttribute("msg","1111");
		}
		
		model.addAttribute("moveUrl",moveUrl);
		
		return "user/login";
	}
	@RequestMapping("/userLogout.do")
	public String UserLogout() {
		session.invalidate();
		return "redirect:home.do";
	}
	@PostMapping("/userLoginOk.do")
	public String UserLoginOk(String id, String pw,Model model,String moveUrl) {
		boolean result = Service.userLoginOk(id,pw);
		System.out.println(pw);
		if(result == true) {
			if(!moveUrl.equals("")){
				session.setAttribute("mode", "user");
				return "redirect:"+moveUrl;
			}
			else {
				session.setAttribute("mode", "user");
				return "redirect:home.do";
			}
		}else {
			return "redirect:userLogin.do?moveUrl="+moveUrl;
		}
	}
	@GetMapping("/idCheck.do")
	@ResponseBody
	public String idCheck(@RequestParam("id") String id) {
		System.out.println("id : " + id);
		String chk = Service.idCheck(id);
		System.out.println("chk : "+ chk);
		return chk;
	}
	@GetMapping("/login.do")
	public String userLogin(String moveUrl,Model model) {
		model.addAttribute("moveUrl",moveUrl);
		return "user/login";
	}
	@RequestMapping("/EmailCheck.do")
	@ResponseBody
	public String emailCheck(@RequestParam("uEmail") String uEmail) {
		System.out.println("uEmail = " + uEmail);
		
		// 인증코드 생성, java.util 안에 UUID를 이용
//		String uuid = UUID.randomUUID().toString();
//		System.out.println(uuid);
		
		String uuid = UUID.randomUUID().toString().substring(0,6);
//		if(uuid != null) return uuid;
		
		// MimeMessage 객체 생성 : 데이터(Mime타입) 전송 (예: text/html)
		MimeMessage mail = mailSender.createMimeMessage();
		
		// 메일 내용
		String mailContents = "<h3>이메일 주소 확인</h3><br/>"
				+"<span>사용자가 본인임을 확인하려고 합니다. 다음 확인 코드를 입력하세요!!</span>"
				+"<h2>"+uuid+"</h2>";
		
		try {
			// 메일 제목 셋팅
			mail.setSubject("jh아카데이미 [이메일 인증]", "utf-8");
			// 메일 내용 셋팅
			mail.setText(mailContents, "utf-8", "html");
			
			// 수신자 셋팅, 인터넷 주소체계로 변환
			mail.addRecipient(RecipientType.TO, new InternetAddress(uEmail));
			mailSender.send(mail);
			
			return uuid;
			
		} catch (MessagingException e) {			
			e.printStackTrace();
		}
		
		return "fail";
	}
	@RequestMapping("/idPwFind.do")
	public String idPwFind(String find,Model model) {
		model.addAttribute("find",find);
		List<CategoryDTO> cDtos = AService.cList();
		Pspec[] pspecs = Pspec.values();
		model.addAttribute("pspec",pspecs);
		model.addAttribute("cDtos",cDtos);
		
		return "user/idPwFind";		
	}
	
	@RequestMapping("/findId.do")
	@ResponseBody
	public String idFind(UserDTO dto,Model model) {
		String findId = Service.idFind(dto);
		System.out.println(findId);
		return findId;
	}
	@RequestMapping("/findPw.do")
	@ResponseBody
	public int pwFind(UserDTO dto,Model model) {
		System.out.println(dto);
		int n = Service.pwFind(dto);
		return n;
	}
	@RequestMapping("/myPage.do")
	public String mypage(Model model) {
		List<CategoryDTO> cDtos = AService.cList();
		Pspec[] pspecs = Pspec.values();
		model.addAttribute("pspec",pspecs);
		model.addAttribute("cDtos",cDtos);
		return "user/myPage";
	}
	@RequestMapping("pwCheck.do")
	@ResponseBody
	public String pwCheck(String id, String pw) {


		int n = Service.pwCheck(id,pw);
		if(n>0) {
			return "ok";
		}
		
		return "no";
	}
	
	@RequestMapping("/pwChange.do")
	@ResponseBody
	public int pwUpdate(String id,String pw,Model model) {
		System.out.println(id + pw);
		int n = Service.updatePw(id,pw);
		System.out.println();
		return n;
	}
	

	
	

	 

	

	
}
