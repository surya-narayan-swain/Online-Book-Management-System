package test;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/add")
public class AddBookServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		
		HttpSession hs=req.getSession(false);  //Accessing existring session
		if(hs==null)
		{
		req.setAttribute("msg","Session Expired...<br>");
	req.getRequestDispatcher("Msg.jsp").forward(req, res);
	
		}
		else
		{
			BookBean bb= new BookBean();
			bb.setCode(req.getParameter("bcode"));
			bb.setName(req.getParameter("bname"));
			bb.setAuthor(req.getParameter("bauthor"));
			bb.setPrice(Float.parseFloat(req.getParameter("bprice")));
			bb.setQty(Integer.parseInt(req.getParameter("bqty")));

			int k=new AddBookDao().insert(bb);
			
			if(k>0)
			{
				req.setAttribute("msg","Book Details Added Successfully...<br>");
				req.getRequestDispatcher("AddBook.jsp").forward(req, res);
				
			}
			
		}
}
}
