package test;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/pco")
public class PlaceOrderServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException 
	{
		HttpSession session=req.getSession();
		if(session==null)
		{
			req.setAttribute("msg", "Session Expired");
			req.getRequestDispatcher("customerlogin.html").forward(req, res);
		}
		else
		{
			req.getRequestDispatcher("ComformOrder.jsp").forward(req, res);
		}
	}
}
