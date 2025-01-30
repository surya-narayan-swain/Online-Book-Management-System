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

@WebServlet("/order")
public class OrderProductServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	    HttpSession session = req.getSession();
	    if (session == null) {
	        req.setAttribute("msg", "Session Expired");
	        req.getRequestDispatcher("customerlogin.html").forward(req, res);
	    } else {
	        String pCode = req.getParameter("pcode");
	        ArrayList<BookBean> al = (ArrayList<BookBean>) session.getAttribute("productlist");
	        BookBean pb = null;
	        Iterator<BookBean> i = al.iterator();
	        while (i.hasNext()) {
	            pb = i.next();
	            if (pCode.equals(pb.getCode()))
	                break;
	        }
	        
	        String qty = req.getParameter("pqty");
	        String reqqty = req.getParameter("rqty");
	        String price = req.getParameter("pprice");
	        
	        // Parse quantities and price as floats to handle decimal values
	        float PdtQty = (Float.parseFloat(qty) - Float.parseFloat(reqqty));
	        float TotalPrice = (Float.parseFloat(price) * Float.parseFloat(reqqty));
	        
	        // Update the BookBean
	        pb.setName(req.getParameter("pname"));
	        pb.setAuthor(req.getParameter("pcompany"));
	        pb.setPrice(Float.parseFloat(req.getParameter("pprice")));
	        pb.setQty(Math.round(PdtQty));  // If you want to store as integer after rounding
	        pb.setReqQty(req.getParameter("rqty"));
	        pb.setTotalPrice(String.valueOf(TotalPrice));
	        
	        int rowcount = new OrderProductDAO().updateQty(pb);
	        if (rowcount > 0) {
	            req.setAttribute("pbean", pb);
	            req.setAttribute("msg", "Confirm Your Payment and Place Order!");
	            req.getRequestDispatcher("Payment.jsp").forward(req, res);
	        } else {
	            req.setAttribute("msg", "Invalid Credentials");
	            req.getRequestDispatcher("customerlogin.html").forward(req, res);
	        }
	    }
	}

}
