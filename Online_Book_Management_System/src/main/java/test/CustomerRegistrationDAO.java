package test;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class CustomerRegistrationDAO 
{
	public int customerData(CustomerBean cb)
	{
		int rowcount=0;
		try
		{
			Connection con=DBConnection.getCon();
			PreparedStatement pstm=con.prepareStatement("insert into customer values(?,?,?,?,?,?,?)");
			pstm.setString(1, cb.getUserName());
			pstm.setString(2, cb.getPassword());
			pstm.setString(3, cb.getFirstName());
			pstm.setString(4, cb.getLastName());
			pstm.setString(5, cb.getAddress());
			pstm.setString(6, cb.getMailId());
			pstm.setString(7, cb.getPhone());
			
			rowcount=pstm.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return rowcount;
		
	}
}
