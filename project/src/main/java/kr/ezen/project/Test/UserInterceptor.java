package kr.ezen.project.Test;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public class UserInterceptor implements HandlerInterceptor{
	@SuppressWarnings("null")
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			HttpSession session = request.getSession();
			
				System.out.println(request.getRequestURL());
				System.out.println(request.getQueryString());
				String queryString = request.getQueryString();
				session.setAttribute("queryString", queryString);
				
				// URL 인코딩(URLencoder.encode)? <==> URL 디코딩(URLDecoder.decode)
				// url을 서버가 이해할 수 있는 표준 형식으로 변환하는 것
				String urlParam = URLEncoder.encode(request.getRequestURL()+"?"+queryString,"utf-8");
				
//				StringBuilder builder =new StringBuilder();
//				builder.append(request.getQueryString());
//				builder.append("?");
//				builder.append(queryString);
//				String url = builder.toString();
//				String urlParam= URLEncoder.encode(url,"utf-8");
//				
		
				
				if(session.getAttribute("id")==null) {
//				response.sendRedirect(request.getContextPath()+"/member/login.do?moveUrl="+request.getRequestURL()+"?"+queryString);
				response.sendRedirect(request.getContextPath()+"/user/userLogin.do?moveUrl="+urlParam);
				return false; // false는 인터셉터가 더이상 진행 x
			}
			
			
		return true;
	}
}
