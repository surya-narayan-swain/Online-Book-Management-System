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

@WebServlet("/delete")
public class DeleteBookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession hs = req.getSession(false); // Accessing existing session
        if (hs == null) {
            req.setAttribute("msg", "Session expired. Please log in again.");
            req.getRequestDispatcher("Msg.jsp").forward(req, res);
            return;
        }

        String bC = req.getParameter("bcode"); // Retrieve the book code from the request
        ArrayList<BookBean> al = (ArrayList<BookBean>) hs.getAttribute("alist"); // Get the list of books from session

        if (al != null) {
            Iterator<BookBean> it = al.iterator();
            boolean bookFound = false;

            while (it.hasNext()) {
                BookBean bb = it.next();
                if (bC.equals(bb.getCode())) {  // Check if the book code matches
                    int k = new DeleteBookDAO().delete(bb);  // Call the DAO to delete the book
                    if (k > 0) {  // If deletion is successful
                        al.remove(bb);  // Remove the book from the list
                        hs.setAttribute("alist", al);  // Update the session with the modified list
                        req.setAttribute("msg", "Book deleted successfully.");
                    } else {
                        req.setAttribute("msg", "Failed to delete the book. Please try again.");
                    }
                    bookFound = true;
                    break;  // Exit loop after book is found and deleted
                }
            }

            if (!bookFound) {
                req.setAttribute("msg", "Book with the specified code not found.");
            }
        } else {
            req.setAttribute("msg", "No books available in the session.");
        }

        // Forward to the appropriate JSP page to display the result
        req.getRequestDispatcher("DeleteBook.jsp").forward(req, res);
    }
}
