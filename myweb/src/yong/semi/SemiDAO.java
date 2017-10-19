
package yong.semi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SemiDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public SemiDAO(){

	}
	
	/**회원로그인*/
	public int loginCheck(String id, String pw){
		try {
			conn = yong.db.yongDb.getConn();
			String sql = "select * from semi_member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			if(rs.next()){
				if(rs.getString(2).equals(pw)){
					return 3;
				} else{
					return 2;
				}
			} else{
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return 2;
	}
	
	public String getUserInfo(String lid) {
	      try {
	    	  conn = yong.db.yongDb.getConn();
	         String name=null;
	         String sql="select name from semi_member where id=? ";
	         ps=conn.prepareStatement(sql);
	         ps.setString(1,lid);
	         rs=ps.executeQuery();
	         while(rs.next()) {
	         name =rs.getString("name");
	         System.out.println(name);
	         }
	         return name;
	      } catch (Exception e) {
	         // TODO: handle exception
	         return null;
	      }finally {
	    	  try {
	      
	         if(rs!=null)rs.close();
	         if(ps!=null)ps.close();
	         if(conn!=null)conn.close();
	      } catch (Exception e) {
	         // TODO: handle exception
	      }
	      
	      }
	}
	
	/**중복검사 관련 메서드*/
    public boolean idCheck(String userid) {
         
         try {
            

        	 conn = yong.db.yongDb.getConn();
            String sql="select id from semi_member where id=?";
            ps=conn.prepareStatement(sql);
            ps.setString(1, userid);
            rs=ps.executeQuery();
            return rs.next();
         } catch (Exception e) {
            // TODO: handle exception
            return false;
         }finally {try {
            if(rs!=null)rs.close();
            if(ps!=null)ps.close();
            if(conn!=null)conn.close();
         } catch (Exception e) {
            // TODO: handle exception
         }
         
            
         }
         
      }
    
    /**회원가입*/
    
    public int memberadd(SemiDTO dto){
         
         try{
        	 conn = yong.db.yongDb.getConn();
            String sql="insert into semi_member values(?, ?, ?, ?,?,?,0,0,sysdate)";
            
            ps=conn.prepareStatement(sql);
            
            ps.setString(1, dto.getId());
            ps.setString(2, dto.getPw());
            ps.setString(3, dto.getName());
            ps.setString(4, dto.getPhone());
            ps.setString(5, dto.getAddress());
            ps.setString(6, dto.getEmail());

            int count=ps.executeUpdate();
            return count;
            
         
         }catch(Exception e){
            e.printStackTrace();
            return -1;
            
         }finally{
            
            try{
               if(ps!=null)ps.close();
               if(conn!=null)conn.close();
         }catch(Exception e2){}
         
         
         }      
         
      }
}
