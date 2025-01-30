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

@WebServlet("/buy")
public class BuyProductServlet extends HttpServlet
{
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException 
	{
		HttpSession session=req.getSession();
		if(session==null)
		{
			req.setAttribute("msg", "session Expired");
			req.getRequestDispatcher("customerlogin.html").forward(req, res);
		}
		else
		{
			String pcode=req.getParameter("Pcode");
			ArrayList<BookBean> al=(ArrayList<BookBean>)session.getAttribute("productlist");
			BookBean pb=null;
			Iterator<BookBean>i=al.iterator();
			while(i.hasNext())
			{
				pb=i.next();
				if(pcode.equals(pb.getCode()))
				{
					break;
				}
			}
			req.setAttribute("bbean", pb);
			req.getRequestDispatcher("BuyProduct.jsp").forward(req, res);
		}
	}
}
