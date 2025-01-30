package test;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Cview")
public class CViewProductServlet extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession session=req.getSession(false);
		if(session==null)
		{
			req.setAttribute("msg", "Session Experied");
			req.getRequestDispatcher("customerlogin.html").forward(req, res);
		}
		else
		{
			ArrayList<BookBean>al=new ViewBooksDAO().retrieve();
			session.setAttribute("productlist", al);
			req.getRequestDispatcher("CViewProduct.jsp").forward(req, res);
		}
	}
}
