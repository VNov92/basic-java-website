package controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Mobile
 */
@WebServlet("/mobile")
public class Mobile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mobile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		
		String brand = request.getParameter("brand");
		String id = request.getParameter("id");
		String page = request.getParameter("page");
		
		String[] brands = {"apple","samsung","xiaomi","oppo","nokia"};
		
		boolean checkBrand = Arrays.asList(brands).contains(brand);
		
		if(id!=null && !id.isBlank() && checkBrand==true) {			
			request.setAttribute("id", id);
			request.setAttribute("brand", brand);
			request.getRequestDispatcher("/InformationProduct").forward(request, response);
		}
		else if(checkBrand) {		
			request.setAttribute("page", page);
			request.setAttribute("brand", brand);
			request.getRequestDispatcher("/ListController").forward(request, response);
		}
		else {
			response.sendRedirect(request.getContextPath());
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
