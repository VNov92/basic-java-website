package controller.account;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.User;
import dao.UsersDAO;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String action = request.getParameter("action");
		
		if (!action.equals("login")) {
			response.sendRedirect(request.getContextPath());
			return;
		}
		
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password").trim();
		String err = "";
		String path = "";
		
		try {
			HttpSession session = request.getSession(true);
			UsersDAO usersDAO = new UsersDAO();
			
			if (usersDAO.isExistsEmail(email)) {
				User user = usersDAO.getUser(email, password);
				if (user != null) {
					
					// Nếu yêu cầu lưu thông tin đăng nhập, thêm bước lưu cookie
					// Nếu yêu cầu lưu thông tin được gỡ bỏ thì xoá cookie
					if (request.getParameter("remember") != null) {
						String remember = request.getParameter("remember");
						
						Cookie cEmail = new Cookie("cookEmail", email);
						Cookie cPassword = new Cookie("cookPassword", password);
						Cookie cRemember = new Cookie("cookRemember", remember);
						
						cEmail.setMaxAge(60*60*24*15);
						cPassword.setMaxAge(60*60*24*15);
						cRemember.setMaxAge(60*60*24*15);
						
						response.addCookie(cEmail);
						response.addCookie(cPassword);
						response.addCookie(cRemember);
					} else {
						Cookie[] cookies = request.getCookies();
						if(cookies != null) {
							for(Cookie cookie: cookies){
								if (cookie.getName().equals("cookEmail")){
									cookie.setMaxAge(0);
									response.addCookie(cookie);
								}
								if (cookie.getName().equals("cookPassword")){
									cookie.setMaxAge(0);
									response.addCookie(cookie);
								}
								if (cookie.getName().equals("cookRemember")){
									cookie.setMaxAge(0);
									response.addCookie(cookie);
								}
							}
						}
					}
					
					if (user.getRole() == 2) {
						path = "/admin/dashboard.jsp";
						
						List<User> listUser = usersDAO.getUsers("role", "1");
						session.setAttribute("listUser", listUser);
					}
					
					session.setAttribute("curUser", user);
					response.sendRedirect(request.getContextPath()+path);
					return;
				}else {
					err = "Sai thông tin email hoặc mật khẩu.";
				}
			}else {
				err = "Email không tồn tại.";
			}
			
			request.setAttribute("email", email);
			request.setAttribute("message", err);
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}




