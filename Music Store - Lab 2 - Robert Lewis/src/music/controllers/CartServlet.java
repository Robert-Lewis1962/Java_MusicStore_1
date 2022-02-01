package music.controllers;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import music.data.ProductIO;
import music.models.CartEntry;
import music.models.Product;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String getTotalCost(List<CartEntry> items) {
		NumberFormat currency = NumberFormat.getCurrencyInstance();

		double total = 0;

		for (int i = 0; i < items.size(); i++) {
			total += items.get(i).getProduct().getPrice() * items.get(i).getQty();
		}

		String totalCost = currency.format(total);
		return totalCost;
	}

	private List<CartEntry> listCheck(HttpServletRequest request) {
		HttpSession session = request.getSession();

		@SuppressWarnings("unchecked")
		List<CartEntry> cartList = (List<CartEntry>) session.getAttribute("cartList");

		if (cartList == null) {
			cartList = new ArrayList<CartEntry>();
			session.setAttribute("cartList", cartList);
		}
		return cartList;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		ArrayList<CartEntry> cartList = (ArrayList<CartEntry>) listCheck(request);

		String totalCost = getTotalCost(cartList);

		session.setAttribute("totalCost", totalCost);
		session.setAttribute("cartList", cartList);
		request.getRequestDispatcher("/WEB-INF/cart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String Code = request.getParameter("Code");

		Product item = ProductIO.getProduct(Code);

		ArrayList<CartEntry> cartList = (ArrayList<CartEntry>) listCheck(request);

		// if item is already in cartList
		for (int i = 0; i < cartList.size(); i++) {
			if (cartList.get(i).getProduct().getCode().equals(item.getCode())) {
				cartList.get(i).setQty(cartList.get(i).getQty() + 1);

				session.setAttribute("cartList", cartList);
				response.sendRedirect("cart");
				return;
			}
		}

		// if new item to cart
		cartList.add(new CartEntry(item, 1));
		response.sendRedirect("cart");
	}

}
