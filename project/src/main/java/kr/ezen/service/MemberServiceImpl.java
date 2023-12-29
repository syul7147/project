package kr.ezen.service;

import java.util.List;
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

import kr.ezen.project.domain.MemberDTO;
import kr.ezen.project.domain.PageDTO;
import kr.ezen.project.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	@Autowired
	JavaMailSender mailSender;
	
	@Override
	public List<MemberDTO> memberList() {		
		return mapper.memberList();
	}

	@Override
	public int memberRegister(MemberDTO dto) {
		String inputPw= dto.getPw(); // 회원가입시 입력된 비번
		String chiperPw = pwEncoder.encode(inputPw); // 암호화된 비번
		// 암호화된 비번으로 dto 셋팅 후 맵퍼에 전달
		dto.setPw(chiperPw);
		return mapper.memberInsert(dto);
	}

	@Override
	public MemberDTO memberInfo(int no) {
		return mapper.memberInfo(no);
	}

	@Override
	public int memberRemove(int no) {		
		return mapper.deleteMember(no);
	}

	@Override
	public int memberModify(MemberDTO dto) {
		return mapper.memberUpdate(dto);
	}

	@Override
	public MemberDTO idCheck(String uid) {		
		return mapper.idCheck(uid);
	}

	@Override
	public boolean memberLogin(MemberDTO dto, HttpServletRequest req) {
		HttpSession session= req.getSession();
		
		// 입력아이디와 일치하는 회원정보를 DTO에 담아서 가져옴 
		MemberDTO loginDTO = mapper.memberLogin(dto);
		
/*		if(loginDTO !=null) { // 일치하는 아이디가 있는 경우
			String inputPw = dto.getPw(); // 입력비번
			String dbPw = loginDTO.getPw(); // DB비번
			
			if(inputPw.equals(dbPw)) { // 비번 일치
				session.setAttribute("loginDto", loginDTO);
				return true;
			}else { // 비번 불일치
				return false;
			} 
		}
		---------------------------------------------------*/ //암호화 전
		if(loginDTO !=null) { // 일치하는 아이디가 있는 경우
		String inputPw = dto.getPw(); // 입력비번
		String dbPw = loginDTO.getPw(); // DB비번
		
		if(pwEncoder.matches(inputPw, dbPw)) { // 비번 일치
			session.setAttribute("loginDto", loginDTO);
			return true;
		}else { // 비번 불일치
			return false;
		} 
	}
		
		return false;		
	}

	@Override
	public String findId(MemberDTO dto) {
		String findId = mapper.findId(dto);
		System.out.println("### findId :"+findId);
		
		return findId;
	}

	@Override
	public int findPw(String uid, String uEmail) {
		// 임시비밀번호 생성
		String tempPw = UUID.randomUUID().toString().substring(0,8);
		
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
			mail.addRecipient(RecipientType.TO, new InternetAddress(uEmail));
			mailSender.send(mail);
			
		} catch (MessagingException e) {			
			e.printStackTrace();
		}
		int n = mapper.findPw(uid, uEmail, tempPw);
		return n;
	}

	@Override
	public int modifyPw(MemberDTO dto) {
		int n = mapper.updatePw(dto);
		return n;
	}
	
}
