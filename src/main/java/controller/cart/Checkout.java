package controller.cart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrdersDAO;
import model.Cart;
import model.Orders;

/**
 * Servlet implementation class Checkout
 */
@WebServlet("/Checkout")
public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Checkout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");		
		
		try {
			HttpSession session = request.getSession(true);
			
			Cart c = (Cart)session.getAttribute("cart");
			
			if( c == null || c.isEmpty()) {
				response.sendRedirect("error.jsp");
				return;
			}
			
			OrdersDAO order = new OrdersDAO();
			
			String name = request.getParameter("customer_name");
			String address = request.getParameter("customer_address");
			String phone = request.getParameter("customer_phone");
			
			Orders o = new Orders(2, address, phone, name);
			
			order.saveOrder(o, c);
			
			response.sendRedirect("success.jsp");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}




