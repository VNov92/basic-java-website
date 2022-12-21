package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ListProductDAO;
import model.Product;

/**
 * Servlet implementation class ProductsController
 */
@WebServlet("/ProductsController")
public class ProductsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String page = request.getParameter("page");
		int curpage = 1;
		int recordsPerPage = 5;
		
		ListProductDAO listProductDAO = new ListProductDAO();
		int noOfRecords = listProductDAO.search();
		int noOfPages = (int)Math.ceil(noOfRecords * 1.0 / recordsPerPage);
		
		if (page != null && !page.isBlank()) {
			curpage = Integer.parseInt(page);
		}
		
		List<Product> listProduct = listProductDAO.listProduct((curpage - 1)*recordsPerPage, recordsPerPage);
		
		request.setAttribute("perpage", recordsPerPage);
		request.setAttribute("count", noOfRecords);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", curpage);
		request.setAttribute("list", listProduct);		
		request.getRequestDispatcher("/admin/list-product.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
