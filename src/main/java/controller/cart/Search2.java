package controller.cart;

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
 * Servlet implementation class Search2
 */
@WebServlet("/search")
public class Search2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String s = request.getParameter("s");
		String page = request.getParameter("page");
		int curpage = 1;
		int recordsPerPage = 5;
		int noOfRecords = 0;
		int noOfPages = 0;
		
		if ( s == null || s.isBlank())
			response.sendRedirect(request.getContextPath());
		else {
			ListProductDAO listProductDAO = new ListProductDAO();
			
			noOfRecords = listProductDAO.search(s, "name");
		
		  if(noOfRecords > 0) {
			  String type = "name";
			  if (page != null && !page.isBlank()) {
					curpage = Integer.parseInt(page);
				}
			  
			  noOfPages = (int)Math.ceil(noOfRecords * 1.0 / recordsPerPage);
			  
			  List<Product> listProduct = listProductDAO.search(s, type, (curpage - 1)*recordsPerPage, recordsPerPage);
			  request.setAttribute("listProduct", listProduct);
		  }
		  
		  request.setAttribute("noOfPages", noOfPages);
	      request.setAttribute("currentPage", curpage);
		  request.setAttribute("countResult", noOfRecords);
		  request.getRequestDispatcher("/search.jsp").forward(request, response);
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
