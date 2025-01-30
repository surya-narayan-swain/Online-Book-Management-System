package test;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class OrderProductDAO 
{
	public int updateQty(BookBean pb)
	{
		int rowcount=0;
		try
		{
			Connection con=DBConnection.getCon();
			PreparedStatement pstm=con.prepareStatement("update Book62 set BQTY=? where BCODE=?");
			pstm.setInt(1, pb.getQty());
			pstm.setString(2, pb.getCode());
//			System.out.println("getpdtqty:"+pb.getPdtQty());
			rowcount=pstm.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return rowcount;
	}
}
