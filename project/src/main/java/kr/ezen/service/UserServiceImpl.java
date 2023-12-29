package kr.ezen.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
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
import kr.ezen.project.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper mapper;
	@Autowired
	HttpSession session;
	@Autowired
	HttpServletRequest request;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	@Autowired
	JavaMailSender mailSender;
	
	
	
	@Override
	public void registerOk(UserDTO dto) {
		String pw = dto.getPw();
		String apw = pwEncoder.encode(pw);
		System.out.println();
		dto.setPw(apw);
		mapper.registerOk(dto);
	}
	@Override
	public String idCheck(String id) {
		String uid = mapper.idCheck(id);
		System.out.println(uid);
		if(uid==null) {
			return "yes";}
		if(uid.equals(id)) {
			return "no";
		}else if(uid.equals("")) {
			return "yes";
		}
		
		return "no"; 
	}
	@Override
	public boolean userLoginOk(String id,String pw) {
		UserDTO n = mapper.userLoginOk(id);
		System.out.println(n);
		System.out.println(pw);
		if(n != null) {
			String userPw = n.getPw();
			if(pwEncoder.matches(pw,userPw)) {
				session.setAttribute("pw", userPw);
				session.setAttribute("id", n.getId());
				return true;
			}else {
				return false;
			}
		}
		
		return false;
	}
	@Override
	public String idFind(UserDTO dto) {
		String id = mapper.idFind(dto);
		
		
		return id;
	}
	@Override
	public int pwFind(UserDTO dto) {
			// 임시비밀번호 생성
			String tempPw = UUID.randomUUID().toString().substring(0,8);
			String apw = pwEncoder.encode(tempPw);
			dto.setPw(apw);
			
			// MimeMessage 객체 생성 : 데이터(Mime타입) 전송 (예: text/html)
			MimeMessage mail = mailSender.createMimeMessage();
			
			// 메일 내용
			String mailContents = "<h3>임시 비밀번호 발급</h3><br/>"				
					+"<h2>"+tempPw+"</h2>"
					+"<p>로그인 후 마이페이지에서 비밀번호를 변경하시면 됩니다.</p>";
			
			try {
				// 메일 제목 셋팅
				mail.setSubject("jh아카데이미 [임시 비밀번호]", "utf-8");
				// 메일 내용 셋팅
				mail.setText(mailContents, "utf-8", "html");
				
				// 수신자 셋팅, 인터넷 주소체계로 변환
				mail.addRecipient(RecipientType.TO, new InternetAddress(dto.getEmail()));
				mailSender.send(mail);
				
			} catch (MessagingException e) {			
				e.printStackTrace();
			}
			int n = mapper.pwFind(dto);
		
		return n;
	}
	@Override
	public int updatePw(String id,String pw) {
		String uPw = pwEncoder.encode(pw);
		int n = mapper.updatePw(id,uPw);
		System.out.println(n);
		return n;
	}
	@Override
	public int pwCheck(String id,String pw) {
		System.out.println(pw);
		System.out.println(id);
		String userPw = mapper.pwCheck(id);
		System.out.println(userPw);
		
		int n;
		if(pwEncoder.matches(pw,userPw)) {
			n=1;
		}else {
			n=0;
		}
		System.out.println(n);
		
		return n;
	}



	


}
