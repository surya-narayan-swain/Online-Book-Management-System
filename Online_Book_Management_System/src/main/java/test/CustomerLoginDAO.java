package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CustomerLoginDAO 
{
	public CustomerBean CheckCustomerLogin(String UserName,String Password)
	{
		CustomerBean cBean=null;
		try
		{
			Connection con=DBConnection.getCon();
			PreparedStatement pstm=con.prepareStatement("select * from customer where CUNAME=? and CPASSWORD=?");
			pstm.setString(1, UserName);
			pstm.setString(2, Password);
			
			ResultSet rs=pstm.executeQuery();
			
			if(rs.next())
			{
				cBean=new CustomerBean();
				cBean.setUserName(rs.getString(1));
				cBean.setPassword(rs.getString(2));
				cBean.setFirstName(rs.getString(3));
				cBean.setLastName(rs.getString(4));
				cBean.setAddress(rs.getString(5));
				cBean.setMailId(rs.getString(6));
				cBean.setPhone(rs.getString(7));
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return cBean;
	}
}
