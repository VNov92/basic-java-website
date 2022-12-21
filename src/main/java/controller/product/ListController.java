package controller.product;

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
 * Servlet implementation class ListController
 */
@WebServlet("/ListController")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String brand = request.getParameter("brand");
		String title = "Điện thoại " + brand.substring(0,1).toUpperCase() + brand.substring(1,brand.length()).toLowerCase();
		String page = request.getParameter("page");
		int curpage = 1;
		int recordsPerPage = 5;
		
		ListProductDAO listProductDAO = new ListProductDAO();
		int noOfRecords = listProductDAO.search(brand, "brand");
		int noOfPages = (int)Math.ceil(noOfRecords * 1.0 / recordsPerPage);
		
		if (page != null && !page.isBlank()) {
			curpage = Integer.parseInt(page);
		}
		
		List<Product> listProduct = listProductDAO.listProduct(brand, (curpage - 1)*recordsPerPage, recordsPerPage);
		
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", curpage);
		request.setAttribute("title", title);
		request.setAttribute("list", listProduct);
		request.getRequestDispatcher("/products.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
