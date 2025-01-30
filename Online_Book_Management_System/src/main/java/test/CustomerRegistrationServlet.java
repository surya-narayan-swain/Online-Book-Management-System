package test;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cr")
public class CustomerRegistrationServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException 
	{
		CustomerBean cbean=new CustomerBean();
		cbean.setUserName(req.getParameter("cuname"));
		cbean.setPassword(req.getParameter("cpassword"));
		cbean.setFirstName(req.getParameter("cfname"));
		cbean.setLastName(req.getParameter("clname"));
		cbean.setAddress(req.getParameter("caddres"));
		cbean.setMailId(req.getParameter("cmailid"));
		cbean.setPhone(req.getParameter("cphone"));
		
		int rowcount=new CustomerRegistrationDAO().customerData(cbean);
		if(rowcount>0)
		{
			req.setAttribute("msg", "Customer Register Sucessfully");
			req.getRequestDispatcher("CustomerRegister.jsp").forward(req, res);;
		}
		else
		{
			req.setAttribute("msg", "Customer Not Register.Try Again!!!");
			req.getRequestDispatcher("home.html").forward(req, res);
		}
	}
}
