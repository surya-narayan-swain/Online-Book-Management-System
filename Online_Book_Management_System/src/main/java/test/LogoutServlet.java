package test;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession hs=req.getSession(false);
		if(hs==null)
		{
			req.setAttribute("msg","SessionExpired..<br>");
		}
		else
		{
			hs.removeAttribute("abean");
			hs.removeAttribute("alist");
			hs.invalidate();//session destroyed
			req.setAttribute("msg","Logged out successfully..<br>");
		}
		req.getRequestDispatcher("Msg.jsp").forward(req, res);
		
		
		
	}
}
