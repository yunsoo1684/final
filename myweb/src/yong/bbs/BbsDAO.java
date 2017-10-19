package yong.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	   private Connection conn;
	   private PreparedStatement ps;
	   private ResultSet rs;
	   
	   public BbsDAO(){
		   
	   }
	   
	   /**ref 최대값 구하기*/
	   public int getRefMax(){
		   try{
			   String sql = "select max(ref) from jsp_bbs";
			   ps = conn.prepareStatement(sql);
			   rs = ps.executeQuery();
			   
			   int count = 0;
			   
			   if(rs.next()){
				   count = rs.getInt(1);
			   }
			   
			   return count;
		   }catch(Exception e){
			   e.printStackTrace();
			   return 0;
		   }finally{
			   try{
				   if(rs != null) rs.close();
				   if(ps != null) ps.close();
			   }catch(Exception e2){
				   e2.printStackTrace();
			   }
		   }
	   }
	   
	   /**글쓰기 관련 메서드*/
	   public int bbsWrite(BbsDTO dto){
		   try{
			   conn = yong.db.yongDb.getConn(); 
			   int ref = getRefMax();
			   String sql = "insert into jsp_bbs values(jsp_bbs_idx.nextval, ?, ?, ?, ?, sysdate, 0, ?, 0, 0)";
			   ps = conn.prepareStatement(sql);
			   
			   ps.setString(1, dto.getWriter());
			   ps.setString(2, dto.getPwd());
			   ps.setString(3, dto.getSubject());
			   ps.setString(4, dto.getContent());
			   ps.setInt(5, ref + 1);
			   
			   int count = ps.executeUpdate();
			   return count;
		   }catch(Exception e){
			   e.printStackTrace();
			   return -1;
		   }finally{
			   try{
				   if(ps != null) ps.close();
					if(conn != null) conn.close(); 
			   }catch(Exception e2){
				   e2.printStackTrace();
			   }
		   }
	   }
	   
	   /**순번 업데이트 관련 메서드*/
	   public void sunbunUpdate(int ref, int sun){
		   try{
			   String sql = "update jsp_bbs set sunbun = sunbun + 1 where ref = ? and sunbun >= ?";
			   ps = conn.prepareStatement(sql);
			   
			   ps.setInt(1, ref);
			   ps.setInt(2, sun);
			   
			   ps.executeUpdate();
			   
		   }catch(Exception e){
			   
		   }finally{
			   try{
				   if(ps != null) ps.close();
			   }catch(Exception e2){
				   
			   }
		   }
	   }
	   
	   /**답변 글쓰기 관련 메서드*/
	   public int bbsReWrite(BbsDTO dto){
		   try{
			   conn = yong.db.yongDb.getConn(); 
			   sunbunUpdate(dto.getRef(), dto.getSunbun()+1);
			   
			   String sql = "insert into jsp_bbs values(jsp_bbs_idx.nextval, ?, ?, ?, ?, sysdate, 0, ?, ?, ?)";
			   
			   ps = conn.prepareStatement(sql);
			   
			   ps.setString(1, dto.getWriter());
			   ps.setString(2, dto.getPwd());
			   ps.setString(3, dto.getSubject());
			   ps.setString(4, dto.getContent());
			   ps.setInt(5, dto.getRef());
			   ps.setInt(6, dto.getLev() + 1);
			   ps.setInt(7, dto.getSunbun() + 1);
			   
			   int count = ps.executeUpdate();
			   
			   return count;
		   }catch(Exception e){
			   e.printStackTrace();
			   return -1;
		   }finally{
			   try{
				   if(ps != null) ps.close();
				   if(conn != null) conn.close();
			   }catch(Exception e2){
				   e2.printStackTrace();
			   }
		   }
	   }
	   
	   /**총 게시물 관련 메서드*/
	   public int getTotalCnt(){
		   try{
			   conn = yong.db.yongDb.getConn();
			   String sql = "select count(*) from jsp_bbs";
			   ps = conn.prepareStatement(sql);
			   rs = ps.executeQuery();
			   rs.next();
			   int count = rs.getInt(1);
			   count = count == 0 ? 1 : count;
			   return count;
		   }catch(Exception e){
			   e.printStackTrace();
			   return 1;
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
	   
	   /**목록 관련 메서드*/
	  public ArrayList<BbsDTO> bbsList(int cp, int ls){
		  try{
			   conn = yong.db.yongDb.getConn();
			   
			   String sql = "select * from "+
					   		"(select rownum rnum,a.* from "+
					   		"(select * from jsp_bbs order by ref desc, sunbun asc) a)b "+
					   		"where rnum>=("+cp+"-1)*"+ls+"+1 "
					   				+ "and rnum<="+cp+"*"+ls;
			   
			   ps = conn.prepareStatement(sql);
			 
			   rs = ps.executeQuery();
			   
			   ArrayList<BbsDTO> arr = new ArrayList<BbsDTO>();
			   
			   while(rs.next()){
				   int idx = rs.getInt("idx");
				   String writer = rs.getString("writer");
				   String pwd = rs.getString("pwd");
				   String subject = rs.getString("subject");
				   String content = rs.getString("content");
				   java.sql.Date writedate = rs.getDate("writedate");
				   int readnum = rs.getInt("readnum");
				   int ref = rs.getInt("ref");
				   int lev = rs.getInt("lev");
				   int sunbun = rs.getInt("sunbun");
				   
				   BbsDTO dto = new BbsDTO(idx, writer, pwd, subject, content, writedate, readnum, ref, lev, sunbun);
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
	   
	   public BbsDTO bbsContent(int idx){
		   try{
			   conn = yong.db.yongDb.getConn(); 
			   
			   String sql = "select * from jsp_bbs where idx = ?";
			   ps = conn.prepareStatement(sql);
			   ps.setInt(1, idx);
			   
			   rs = ps.executeQuery();
			   
			   BbsDTO dto = null;
			   
			   if(rs.next()){
				   String writer = rs.getString("writer");
				   String pwd = rs.getString("pwd");
				   String subject = rs.getString("subject");
				   String content = rs.getString("content");
				   java.sql.Date writedate = rs.getDate("writedate");
				   int readnum = rs.getInt("readnum") + 1;
				   int ref = rs.getInt("ref");
				   int lev = rs.getInt("lev");
				   int sunbun = rs.getInt("sunbun");
				   
				   dto = new BbsDTO(idx, writer, pwd, subject, content, writedate, readnum, ref, lev, sunbun);
			   }
			   
			   return dto;
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
	   
	   public int readNumber(int readnum, int idx){
		   try{
			   conn = yong.db.yongDb.getConn(); 
			   
			   String sql = "update jsp_bbs set readnum = ? where idx = ?";
			   
			   ps = conn.prepareStatement(sql);
			   
			   ps.setInt(1, ++readnum);
			   ps.setInt(2, idx);
			   
			   rs = ps.executeQuery();
			   
			   return readnum;
		   }catch(Exception e){
			   e.printStackTrace();
			   return -1000;
		   }finally{
			   try{
				   if(ps != null) ps.close();
					if(conn != null) conn.close(); 
			   }catch(Exception e2){
				   e2.printStackTrace();
			   }
		   }
	   }
	   
	   public int bbsDelete(String subject, int ref, int lev, int sunbun){
		   try{
			   conn = yong.db.yongDb.getConn(); 
			   
			   bbsUpdate(subject, ref, lev);
			   
			   String sql = "delete from jsp_bbs where ref = ? and lev = ? and sunbun = ?";
			   
			   ps = conn.prepareStatement(sql);
			   
			   ps.setInt(1, ref);
			   ps.setInt(2, lev);
			   ps.setInt(3, sunbun);
			   
			   int count = ps.executeUpdate();
			   
			   return count;
		   }catch(Exception e){
			   e.printStackTrace();
			   return -1;
		   }finally{
			   try{
				   if(ps != null) ps.close();
				   if(conn != null) conn.close();
			   }catch(Exception e2){
				   e2.printStackTrace();
			   }
		   }
	   }
	   
	   public void bbsUpdate(String subject, int ref, int lev){
		   try{
			   String str = "[삭제된 게시글]" + subject;
			   String sql = "update jsp_bbs set subject = ? where ref = ? and lev = ?";
			   
			   ps = conn.prepareStatement(sql);
			   
			   ps.setString(1, str);
			   ps.setInt(2, ref);
			   ps.setInt(3, lev + 1);
			   
			   ps.executeQuery();
			   
		   }catch(Exception e){
			   e.printStackTrace();
		   }finally{
			   try{
				   if(ps != null) ps.close();
			   }catch(Exception e2){
				   e2.printStackTrace();
			   }
		   }
	   }
}
