package kr.ezen.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		
		return "redirect:user/home.do";
	}
	@RequestMapping("chiperTest")
	public void chiperTest() {
		String plainPw = "test1234";
		String encPw1 = pwEncoder.encode(plainPw);
		String encPw2 = pwEncoder.encode(plainPw);
		System.out.println("=======================");
		System.out.println("enc = " +encPw1);
		System.out.println("enc = " +encPw2);
		
		String pw1 = "test1234";
		String pw2 = "abcd";
	
		System.out.println(pwEncoder.matches(pw1, encPw1));
		System.out.println(pwEncoder.matches(pw1, encPw2));
		System.out.println("=======================");
		System.out.println(pwEncoder.matches(pw2, encPw1));
	}
	
}
