package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	
	private Connection getConnection() throws Exception {
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con = ds.getConnection();
		return con;
		
	}	// 디비연결
	
	public void insertMember(MemberBean mb) {
		
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = getConnection();
			
			String sql = "insert into member(id,pass,name,email,address,phone,mobile,reg_date) values(?,?,?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, mb.getId());
			ps.setString(2, mb.getPass());
			ps.setString(3, mb.getName());
			ps.setString(4, mb.getEmail());
			ps.setString(5, mb.getAddress());
			ps.setString(6, mb.getPhone());
			ps.setString(7, mb.getMobile());
			ps.setTimestamp(8, mb.getReg_date());
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(ps!=null) try{ps.close();}catch(SQLException e){}
			if(con!=null) try{con.close();}catch(SQLException e){}
		}
		
	}	// insertMember
	
	public int userCheck(String id, String pass) {
		
		int check = 0;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			con = getConnection();
			
			String sql = "select * from member where id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("pass").equals(pass)) {
					check = 1;
				} else {
					check = 0;
				}
			} else {
				check = -1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) try{rs.close();}catch(SQLException e){}
			if(ps!=null) try{ps.close();}catch(SQLException e){}
			if(con!=null) try{con.close();}catch(SQLException e){}
		}
		
		return check;
	} // userCheck
	
	public int idcheck(String id) {
		
		int check = 0;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			
			String sql = "select * from member where id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("id").equals(id)) {
					check = 1;
				}else {
					check = 0;
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(rs!=null) try{rs.close();}catch(SQLException e){}
			if(ps!=null) try{ps.close();}catch(SQLException e){}
			if(con!=null) try{con.close();}catch(SQLException e){}
		}
		
		return check;
	}	// idcheck

}


















