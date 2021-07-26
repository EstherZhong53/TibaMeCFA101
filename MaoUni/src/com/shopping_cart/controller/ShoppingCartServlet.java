package com.shopping_cart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.shopping_cart.model.ShoppingCartItemVO;
import com.shopping_cart.model.ShoppingCartService;

public class ShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/plain; charset = UTF-8");

		String action = req.getParameter("action");

		// ========== 頁面先設一個假button作為進入網站得住發事件，須改為filter註冊到網站每個頁面 =============
		if ("init".equals(action)) {

			Cookie[] cookies = req.getCookies();
			HttpSession session = req.getSession();

			// 檢視user是否已經有存放cookie，cookie 的值以List型態存放於Redis：(cookieValue, {"itemId": "xxx",
			// "count": "x"})
			for (int i = 0; i < cookies.length; i++) {
				Cookie userCookie = cookies[i];

				if ("shoppingCart".equals(userCookie.getName())) {
					// 讓每的頁面可以透過sessionId呼叫ShoppingCartService的方法
					session.setAttribute("sessionId", userCookie.getValue());
					return;
				}

				// 若未找到shoppingCart，新增cookie，並將session作為key存入Redis
				Cookie shoppingCart = new Cookie("shoppingCart", session.getId());
				shoppingCart.setMaxAge(3 * 24 * 60 * 60); // 存活3天，以秒為單位
				res.addCookie(shoppingCart);
			}
		}
		// ===============================================================================

		if ("getCart".equals(action)) {
			Gson gson = new Gson();
			String sessionId = (String) req.getSession().getAttribute("sessionId");
			ShoppingCartService shoppingCartSvc = new ShoppingCartService();
			List<ShoppingCartItemVO> cartItems = null;
			cartItems = shoppingCartSvc.getCart(sessionId);

			PrintWriter out = res.getWriter();
			String cartItemsJson = gson.toJson(cartItems);
			out.write(cartItemsJson);
		}

		if ("addCart".equals(action)) {
			Integer itemId = new Integer(req.getParameter("itemId"));
			Integer count = new Integer(req.getParameter("count"));
			String sessionId = (String) req.getSession().getAttribute("sessionId");
			ShoppingCartService shoppingCartSvc = new ShoppingCartService();
			shoppingCartSvc.addItem(sessionId, itemId, count);
		}

		if ("deleteItem".equals(action)) {
			Integer itemId = new Integer(req.getParameter("itemId"));
			String sessionId = (String) req.getSession().getAttribute("sessionId");
			ShoppingCartService shoppingCartSvc = new ShoppingCartService();
			shoppingCartSvc.deleteItem(sessionId, itemId);
		}
	}

}
