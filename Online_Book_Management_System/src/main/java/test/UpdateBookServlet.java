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

@WebServlet("/update")
public class UpdateBookServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession hs=req.getSession(false);//accesing exstting session
	if(hs==null) {
		req.setAttribute("msg","session expired..<br>");
		req.getRequestDispatcher("Msg.jsp").forward(req, res);
	
	}
	else
	{
		String bC=req.getParameter("bcode");
	float bP=Float.parseFloat(req.getParameter("bprice"));
	int bQ=Integer.parseInt(req.getParameter("bqty"));
	ArrayList<BookBean> al=(ArrayList<BookBean>) hs.getAttribute("alist");
	Iterator<BookBean> it=al.iterator();
	while(it.hasNext())
	{
		BookBean bb=(BookBean)it.next();
		if(bC.equals(bb.getCode()))
		{
			bb.setPrice(bP);
			bb.setQty(bQ);
			int k=new UpdateBookDAO().update(bb);
			if(k>0)
			{
				req.setAttribute("msg","Book Updated Successfully..<br>");
				req.getRequestDispatcher("UpdateBook.jsp").forward(req, res);
			}
			break;
		}
	}
	}
	
	
	}
}
