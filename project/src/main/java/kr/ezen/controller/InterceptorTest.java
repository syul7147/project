package kr.ezen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class InterceptorTest {
	@GetMapping("/test1")
	public String  test1() {
		System.out.println("test1컨트롤러");
		return "interceptor/test1";
	}
	@GetMapping("/test2")
	public String  test2() {
		System.out.println("test2컨트롤러");
		return "interceptor/test1";
	}
	@GetMapping("/test3")
	public String  test3() {
		System.out.println("test3컨트롤러");
		return "interceptor/test1";
	}
	@GetMapping("/bbs/test4")
	public String  test4() {
		System.out.println("test4컨트롤러");
		return "interceptor/test1";
	}
	
	
	
	
}
