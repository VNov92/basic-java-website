package controller.cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ListProductDAO;
import model.Cart;
import model.Product;

/**
 * Servlet implementation class AddToCart
 */
@WebServlet("/cart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try {
			// Tạo session mới cho request nếu chưa có
			HttpSession session = request.getSession(true);
			
			String action = request.getParameter("action");
			int id = Integer.parseInt(request.getParameter("id"));			
			
			if (action != null && action.equalsIgnoreCase("add")) {// Nếu "add" thì thêm sản phẩm vào lớp Cart, thêm vào session cart
				// Tạo session cart nếu chưa có
				if (session.getAttribute("cart") == null)
					session.setAttribute("cart", new Cart());
				
				// Truy vấn product từ id trả về
				ListProductDAO dao = new ListProductDAO();
				Product product = dao.getProduct(id);
				// Thêm product vào Cart
				Cart c = (Cart)session.getAttribute("cart");
				c.add(new Product(product.getId(), product.getName(), product.getDes(), product.getPrice(), product.getSrc(), product.getType(), product.getBrand(), 1 ));
				
			} else if (action != null && action.equalsIgnoreCase("delete")) { // Nếu "delete" thì xoá sản phẩm trong lớp Cart
				
				Cart c = (Cart)session.getAttribute("cart");
				c.remove(id);
			}			
			
			request.getRequestDispatcher("/cart.jsp").forward(request, response);
		
		}catch (Exception e) {
			 e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
