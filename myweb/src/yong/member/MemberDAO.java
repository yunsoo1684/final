package yong.member;

import java.sql.*;
import java.util.*;

import yong.emp.EmpDTO;

public class MemberDAO {

   private Connection conn;
   private PreparedStatement ps;
   private ResultSet rs;
   
   public static final int NOT_ID = 1; 
   public static final int NOT_PWD = 2; 
   public static final int LOGIN_OK = 3;
   public static final int ERROR = -1;
   
   public MemberDAO() {
	   
   }
   
   /**회원등록 관련 메서드*/
   public int memberJoin(MemberDTO dto){
      try {
    	 conn = yong.db.yongDb.getConn();
    	  
         String sql="insert into jsp_member values(jsp_member_idx.nextval,?,?,?,?,?,sysdate)";
         ps=conn.prepareStatement(sql);
         ps.setString(1, dto.getId());
         ps.setString(2, dto.getName());
         ps.setString(3, dto.getPwd());
         ps.setString(4, dto.getTel());
         ps.setString(5, dto.getAddr());
         int count =ps.executeUpdate();
         return count;
      } catch (Exception e) {
         e.printStackTrace();
         return -1;
      }finally {
         try {
            if(ps!=null)ps.close();   //썻던자원 되돌려줘야됨
            if(conn!=null)conn.close();
         } catch (Exception e2) {
            
         }
      }
   }
   /**중복관련메서드*/
   public boolean idCheck(String userid){
      try {
    	  conn = yong.db.yongDb.getConn();
    	  
         String sql="select id from jsp_member where id=?";
         ps=conn.prepareStatement(sql);
         ps.setString(1, userid);
         rs=ps.executeQuery();
         return rs.next();
      } catch (Exception e) {
         e.printStackTrace();
         return false;
      }finally {
         try {
            if(rs!=null)rs.close();
            if(ps!=null)ps.close();
            if(conn!=null)conn.close();
         } catch (Exception e2) {
            
         }
      }
   }
   
   /**회원 검색*/
   public ArrayList<MemberDTO> memberFind(String fkey, String fvalue){
	   try{
		   conn = yong.db.yongDb.getConn();
		   String sql = "select * from jsp_member where "+fkey+" = ?";
		   ps = conn.prepareStatement(sql);
		   ps.setString(1, fvalue);
		   rs = ps.executeQuery();
		   
		   ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();
		   
		   while(rs.next()){
			   int idx = rs.getInt("idx");
			   String id = rs.getString("id");
			   String name = rs.getString("name");
			   String pwd = rs.getString("pwd");
			   String tel = rs.getString("tel");
			   String addr = rs.getString("addr");
			   java.sql.Date joindate = rs.getDate("joindate");
			   
			   MemberDTO dto = new MemberDTO(idx, id, name, pwd, tel, addr, joindate);
			   arr.add(dto);
		   }
		   
		   return arr;
	   }catch(Exception e){
		   e.printStackTrace();
		   return null;
	   }finally{
		   try{
			   if(rs!=null)rs.close();
	            if(ps!=null)ps.close();
	            if(conn!=null)conn.close();
		   }catch(Exception e2){
			   e2.printStackTrace();
		   }
	   }
   }
   
   /**로그인 검증 관련 메서드*/
   public int loginCheck(String userid, String userpwd){
	   try{
		   conn = yong.db.yongDb.getConn();
		   String sql = "select pwd from jsp_member where id = ?";
		   ps = conn.prepareStatement(sql);
		   ps.setString(1, userid);
		   rs = ps.executeQuery();
		   
		   if(rs.next()){
		      String dbpwd = rs.getString(1);
		      if(dbpwd.equals(userpwd)){
		    	  return LOGIN_OK;
		      }else{
		    	  return NOT_PWD;
		      }
		   }else{
		      return NOT_ID;
		   }
	   }catch(Exception e){
		   e.printStackTrace();
		   return ERROR;
	   }finally{
		   try{
			   if(rs!=null)rs.close();
	           if(ps!=null)ps.close();
	           if(conn!=null)conn.close();
		   }catch(Exception e2){
			   e2.printStackTrace();
		   }
	   }
   }
   
   /**사용자 정보 추출 관련 메서드*/
   public String getUserInfo(String userid){
	   try{
		   conn = yong.db.yongDb.getConn();
		   String sql = "select name from jsp_member where id = ?";
		   ps = conn.prepareStatement(sql);
		   ps.setString(1, userid);
		   rs = ps.executeQuery();
		   rs.next();
		   return rs.getString(1);
	   }catch(Exception e){
		   e.printStackTrace();
		   return null;
	   }finally{
		   try{
			   if(rs != null) rs.close();
			   if(ps != null) ps.close();
			   if(conn != null) conn.close();
		   }catch(Exception e2){
			   e2.printStackTrace();
		   }
	   }
   }
}