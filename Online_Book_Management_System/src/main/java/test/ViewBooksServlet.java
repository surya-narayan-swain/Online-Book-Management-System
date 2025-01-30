package test;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/view")
public class ViewBooksServlet extends HttpServlet{

	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
	HttpSession hs=req.getSession(false);// accessing exsting session	
	if(hs==null)
	{
		req.setAttribute("msg","session expired..<br>");
	req.getRequestDispatcher("Msg.jsp").forward(req, res);
	
	}
	else
	{
		ArrayList<BookBean> al= new ViewBooksDAO().retrieve();
		hs.setAttribute("alist", al);
		req.getRequestDispatcher("ViewBooks.jsp").forward(req, res);
	}
	
	}

}
