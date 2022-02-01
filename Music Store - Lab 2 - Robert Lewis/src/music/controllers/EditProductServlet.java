package music.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import music.data.ProductIO;
import music.models.Product;

/**
 * Servlet implementation class EditProduct
 */
@WebServlet("/editProduct")
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String Code = request.getParameter("Code");

		if (Code == null) {
			session.setAttribute("check", "ADD");
		} else {
			session.setAttribute("check", "EDIT");
			request.setAttribute("item", ProductIO.getProduct(Code));
		}

		request.getRequestDispatcher("/WEB-INF/editProduct.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String check = (String) session.getAttribute("check");

		log("check = " + check);

		String code = request.getParameter("id");
		String description = request.getParameter("desc");
		String message = "";
		boolean valid = true;
		double cost;

		try {
			cost = Double.parseDouble(request.getParameter("cost"));
		} catch (Exception ex) {
			cost = 0;
		}

		Product product = new Product();
		product.setCode(code);
		product.setDescription(description);
		product.setPrice(cost);

		Product temp = ProductIO.getProduct(code);
		if (code == null || description == null || code.isEmpty() || description.isEmpty() || cost <= 0
				|| (check == "ADD" && temp != null)) {
			message = "Invaild Code, Description or Price";
			valid = false;
		}

		if (cost > 0 && valid) {
			if (check == "ADD") {
				ProductIO.insertProduct(product);
			} else {
				ProductIO.updateProduct(product);
			}

			response.sendRedirect("productMaintenance");
			return;
		}

		request.setAttribute("item", product);
		request.setAttribute("message", message);
		request.getRequestDispatcher("/WEB-INF/editProduct.jsp").forward(request, response);
		;

	}

}
