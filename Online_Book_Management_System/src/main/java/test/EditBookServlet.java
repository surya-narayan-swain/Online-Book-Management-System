package test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/edit")
public class EditBookServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession hs=req.getSession();
		if(hs==null)
		{
			req.setAttribute("msg", "session expired..<br>");
		req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}
		else
		{
			String bC=req.getParameter("bcode");
			ArrayList<BookBean> al=(ArrayList<BookBean>)hs.getAttribute("alist");
		Iterator<BookBean> it=al.iterator();
		while(it.hasNext())
		{
			BookBean bb=(BookBean)it.next();
			if(bC.equals(bb.getCode()))
			{
				req.setAttribute("bbean", bb);
				req.getRequestDispatcher("EditBook.jsp").forward(req, res);
			break;
			}
		}
		}
	}
}
