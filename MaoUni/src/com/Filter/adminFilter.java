package com.Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.member.model.MemberVO;

//@WebFilter("/loginFilter")
public class adminFilter implements Filter {
	public adminFilter() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String uri = req.getRequestURI(); 

//		if (uri.contains("/obuy/obuyAll.jsp")) {
		
			HttpSession session = req.getSession();
			Object staffVO = session.getAttribute("staffVO");
//		這邊要抓取上次登入的servlet存入的東西，不然沒有東西可驗

			if (staffVO != null) {
				chain.doFilter(req, res);
			
			}else{//註冊頁面
				
				res.sendRedirect(req.getContextPath() + "/front-end/home/adminlogin.jsp"); // 空的話就去登入頁面
				
				}

		}
//	}

	public void init(FilterConfig fConfig) throws ServletException {
	}
}