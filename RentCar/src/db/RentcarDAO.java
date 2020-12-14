package db;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RentcarDAO {

		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		
		//Ŀ�ؼ� Ǯ�� �̿��� ������ ���̽� ����
		public void getCon() {
			
			try {
				Context initctx = new InitialContext();
				Context envctx = (Context) initctx.lookup("java:comp/env");
				DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
				con = ds.getConnection();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
}