package controller.account;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.User;
import dao.UsersDAO;

/**
 * Servlet implementation class Register
 */
@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String action = request.getParameter("action");
		
		if(!action.equals("register")) {
			response.sendRedirect(request.getContextPath());
			return;
		}
		
		String name = request.getParameter("name").trim();
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password").trim();
		String err = "";
		
		try {
			HttpSession session = request.getSession(true);
			UsersDAO usersDAO = new UsersDAO();
			
			int role = 5;
			
			if (!usersDAO.isExistsEmail(email)) {
				usersDAO.insertUser(email, password, role, name, "", "");	
				
				User user = new User(email, role, name, "", "");
				
				session.setAttribute("curUser", user);
				response.sendRedirect(request.getContextPath());
				return;
			}else {
				err = "Email đã tồn tại trên hệ thống.";
			}
			
			request.setAttribute("email", email);
			request.setAttribute("message", err);
			request.getRequestDispatcher("/register.jsp").forward(request, response);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}








