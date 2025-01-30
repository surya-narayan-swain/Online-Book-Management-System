package test;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class DeleteBookDAO {

    public int delete(BookBean bb) {
        int k = 0; // Local variable instead of instance variable
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBConnection.getCon();
            ps = con.prepareStatement("DELETE FROM Book62 WHERE bcode=?");
            ps.setString(1, bb.getCode()); // Corrected index to 1

            k = ps.executeUpdate(); // Executes the delete query
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return k;
    }
}
