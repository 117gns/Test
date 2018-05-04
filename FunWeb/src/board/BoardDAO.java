package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
	private Connection getConnection() throws Exception {
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con = ds.getConnection();
		return con;
	}	//디비연결 메서드
	
	public int getBoardCount() {
		
		int count = 0;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			
			String sql = "select count(*) from board";
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(rs!=null) try{rs.close();}catch(SQLException e){}
			if(ps!=null) try{ps.close();}catch(SQLException e){}
			if(con!=null) try{con.close();}catch(SQLException e){}
		}
		return count;
	}	// getBoardCount()
	
	public List<BoardBean> getBoardList(int startRow,int pageSize) {
		
		List<BoardBean> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			String sql = "select * from board order by re_ref desc, re_seq asc limit ?,?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, startRow-1);
			ps.setInt(2, pageSize);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				BoardBean bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setSubject(rs.getString("subject"));
				bb.setName(rs.getString("name"));
				bb.setDate(rs.getDate("date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setContent(rs.getString("content"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				
				list.add(bb);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(rs!=null) try{rs.close();}catch(SQLException e){}
			if(ps!=null) try{ps.close();}catch(SQLException e){}
			if(con!=null) try{con.close();}catch(SQLException e){}
		}
		
		return list;
	}	// getBoardList(int startRow,int pageSize)
	
	public int getBoardCount(String search) {
		
		int count = 0;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			
//			String sql = "select count(*) from board where subject like '%검색어%'";
			String sql = "select count(*) from board where subject like ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+search+"%");
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(rs!=null) try{rs.close();}catch(SQLException e){}
			if(ps!=null) try{ps.close();}catch(SQLException e){}
			if(con!=null) try{con.close();}catch(SQLException e){}
		}
		return count;
	}	// getBoardCount(String search)
	
	public List<BoardBean> getBoardList(int startRow,int pageSize,String search) {
		
		List<BoardBean> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			
			String sql = "select * from board where subject like ? order by num desc limit ?,?";
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+search+"%");
			ps.setInt(2, startRow-1);
			ps.setInt(3, pageSize);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				BoardBean bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setSubject(rs.getString("subject"));
				bb.setName(rs.getString("name"));
				bb.setDate(rs.getDate("date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setContent(rs.getString("content"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				
				list.add(bb);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(rs!=null) try{rs.close();}catch(SQLException e){}
			if(ps!=null) try{ps.close();}catch(SQLException e){}
			if(con!=null) try{con.close();}catch(SQLException e){}
		}
		
		return list;
	}	// getBoardList(int startRow,int pageSize,String search)
	
	public BoardBean getBoard(int num) {
		
		BoardBean bb = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			
			String sql = "select * from board where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				bb = new BoardBean();
				
				bb.setNum(num);
				bb.setReadcount(rs.getInt("readcount"));
				bb.setName(rs.getString("name"));
				bb.setDate(rs.getDate("date"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setFile(rs.getString("file"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(rs!=null) try{rs.close();}catch(SQLException e){}
			if(ps!=null) try{ps.close();}catch(SQLException e){}
			if(con!=null) try{con.close();}catch(SQLException e){}
		}
		
		return bb;
	}	// getBoard(int num)
	
	public void updateReadcount(int num) {
		
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = getConnection();
			
			String sql = "update board set readcount = readcount+1 where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(ps!=null) try{ps.close();}catch(SQLException e){}
			if(con!=null) try{con.close();}catch(SQLException e){}
		}
	}	// updateReadcount(int num)
	
	public void insertBoard(BoardBean bb) {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int num = 0;
		String sql="";
		
		try {
			con = getConnection();
			
			sql = "select max(num) as 'num' from board";
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt("num")+1;	//1
			}
			
			sql = "insert into board(num,name,pass,subject,content,readcount,file,date,re_ref,re_lev,re_seq) "
					+ "values(?,?,?,?,?,?,?,now(),?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setString(2, bb.getName());
			ps.setString(3, bb.getPass());
			ps.setString(4, bb.getSubject());
			ps.setString(5, bb.getContent());
			ps.setInt(6, 0);	//readcount
			ps.setString(7, bb.getFile());	// file
			ps.setInt(8, num);		// re_ref <- num
			ps.setInt(9, 0);		// re_lev 0
			ps.setInt(10, 0);		// re_seq 0
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException e){}
			if(ps!=null) try{ps.close();}catch(SQLException e){}
			if(con!=null) try{con.close();}catch(SQLException e){}
		}
		
	}	// insertBoard(BoardBean bb)
	
	public void reInsertBoard(BoardBean bb) {
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int num = 0;
		String sql="";
		
		try {
			con = getConnection();
			
			sql = "select max(num) as 'num' from board";
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt("num")+1;	//1
			}
			
			// 답글순서 재배치
			// 변경 re_seq +1 조건 같은 그룹이고 순서값 자기자신보다 큰 값
			sql = "update board set re_seq = re_seq+1 where re_ref = ? and re_seq > ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, bb.getRe_ref());
			ps.setInt(2, bb.getRe_seq());
			
			ps.executeUpdate();
			
			sql = "insert into board(num,name,pass,subject,content,readcount,file,date,re_ref,re_lev,re_seq) "
					+ "values(?,?,?,?,?,?,?,now(),?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setString(2, bb.getName());
			ps.setString(3, bb.getPass());
			ps.setString(4, bb.getSubject());
			ps.setString(5, bb.getContent());
			ps.setInt(6, 0);	//readcount
			ps.setString(7, bb.getFile());	// file
			ps.setInt(8, bb.getRe_ref());		// re_ref
			ps.setInt(9, bb.getRe_lev()+1);		// re_lev 0
			ps.setInt(10, bb.getRe_seq()+1);		// re_seq 0
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException e){}
			if(ps!=null) try{ps.close();}catch(SQLException e){}
			if(con!=null) try{con.close();}catch(SQLException e){}
		}
	}
	
}












