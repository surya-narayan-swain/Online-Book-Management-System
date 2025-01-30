package test;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/clogin")
public class CustomerLoginServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		CustomerBean cBean=new CustomerLoginDAO().CheckCustomerLogin(req.getParameter("cuname"), req.getParameter("cpassword"));
		
		if(cBean==null)
		{
			req.setAttribute("msg", "Invalid Login Credentials!!!");
			req.getRequestDispatcher("customerlogin.html").forward(req, res);
		}
		else
		{
			HttpSession session=req.getSession();
			session.setAttribute("cBean", cBean);
			req.getRequestDispatcher("CustomerHome.jsp").forward(req, res);
		}
	}

}
