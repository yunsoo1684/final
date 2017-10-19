package admin.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import yong.emp.EmpDTO;

public class BbsDAO {
	private Connection conn;
	   private PreparedStatement ps;
	   private ResultSet rs;
	   
 public BbsDAO(){
		   
	   }
 
	   public int bbsWrite(BbsDTO dto) {
		      try {
		    	  conn = yong.db.yongDb.getConn();
		      
		         String sql="insert into productAdd_semi values(productAdd_semi_idx.nextval,?,?,?,?,?,?,?,?,?,?,?)";
		         ps=conn.prepareStatement(sql);
		         ps.setString(1, dto.getCode());
		         ps.setString(2, dto.getName());
		         ps.setString(3, dto.getPrice());
		         ps.setInt(4, dto.getS());
		         ps.setInt(5, dto.getM());
		         ps.setInt(6, dto.getL());
		         ps.setInt(7, dto.getXl());
		         ps.setInt(8, dto.getFree());
		         ps.setString(9, dto.getBrand());
		         ps.setString(10, dto.getType());
		         ps.setString(11, dto.getPicture());
		      
		         int count=ps.executeUpdate(); 
		         
		         return count;
		      } catch (Exception e) {
		         // TODO: handle exception
		         e.printStackTrace();
		         return -1;
		      }finally {
		         try {
		            if(ps!=null)ps.close();
		            if(conn!=null)conn.close();
		         } catch (Exception e2) {
		            // TODO: handle exception
		         }
		      }
		   }
	   
	   public ArrayList<BbsDTO> bbsList(int cp,int ls){
		      try {
		    	  conn = yong.db.yongDb.getConn();
		         String sql="select * from productAdd_semi order by idx desc";
		     
		         ps = conn.prepareStatement(sql);
		         
		         rs = ps.executeQuery();
		         
		         ArrayList<BbsDTO> arr = new ArrayList<BbsDTO>();
		         while(rs.next()) {
		            int idx = rs.getInt("idx");
		            String code = rs.getString("code");
		            String name = rs.getString("name");
		            String price = rs.getString("price");
		            int s = rs.getInt("s");
		            int m = rs.getInt("m");
		            int l = rs.getInt("l");
		            int xl = rs.getInt("xl");
		            int free=rs.getInt("free");
		            String brand=rs.getString("brand");
		            String type = rs.getString("type");
		            String picture = rs.getString("picture");
		            BbsDTO dto = new BbsDTO(idx,code, name, price, s, m, l, xl, free, brand, type, picture);
		            arr.add(dto);
		         }
		         return arr;
		      } catch (Exception e) {
		         // TODO: handle exception
		         e.printStackTrace();
		         return null;
		      }finally {
		         try {
		            if(rs!=null)rs.close();
		            if(ps!=null)ps.close();
		            if(conn!=null)conn.close();
		         } catch (Exception e2) {
		            // TODO: handle exception
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
	   
	   /**상품 삭제 관련 메서드*/
	   public int bbsDelete(String cbs){
		   try{
			   conn = yong.db.yongDb.getConn(); 
			   
			   String sql = "delete from productAdd_semi where code = ?";
			   
			   ps = conn.prepareStatement(sql);
			   ps.setString(1, cbs);
			   
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
	   
	   public ArrayList<BbsDTO> itemUpdate2(int idxname){
		   try{
			   conn = yong.db.yongDb.getConn(); 
			   
			   String sql = "select * from productAdd_semi where idx = ?";
			   
			   ps = conn.prepareStatement(sql);
				ps.setInt(1, idxname);
				rs = ps.executeQuery();
			   
				 ArrayList<BbsDTO> arr = new ArrayList<BbsDTO>();
		         while(rs.next()) {
		            int idx = rs.getInt("idx");
		            String code = rs.getString("code");
		            String name = rs.getString("name");
		            String price = rs.getString("price");
		            int s = rs.getInt("s");
		            int m = rs.getInt("m");
		            int l = rs.getInt("l");
		            int xl = rs.getInt("xl");
		            int free=rs.getInt("free");
		            String brand=rs.getString("brand");
		            String type = rs.getString("type");
		            String picture = rs.getString("picture");
		            BbsDTO dto = new BbsDTO(idx,code, name, price, s, m, l, xl, free, brand, type, picture);
		            
		            arr.add(dto);
		         }
			   
			   return arr;
		   }catch(Exception e){
			   e.printStackTrace();
			   return null;
		   }finally{
			   try{
				   if(ps != null) ps.close();
				   if(conn != null) conn.close();
			   }catch(Exception e2){
				   e2.printStackTrace();
			   }
		   }
	   }
	   
	   public int itemUpdate(BbsDTO dto, int idx){
			try{
				conn = yong.db.yongDb.getConn();
				
				String sql = "Update productAdd_semi set name = ?, code = ?, brand = ?, s= ?, m=?, l=?, xl=?, free=? where idx = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, dto.getName());
				ps.setString(2, dto.getCode());
				ps.setString(3, dto.getBrand());
				ps.setInt(4, dto.getS());
				ps.setInt(5, dto.getM());
				ps.setInt(6, dto.getL());
				ps.setInt(7, dto.getXl());
				ps.setInt(8, dto.getFree());
				ps.setInt(9, idx);
				int count = ps.executeUpdate();
				
				System.out.println(dto);
				System.out.println(count);
				return count;
			}catch(Exception e){
				e.printStackTrace();
				return -1;
			}finally{
				try{
					if(ps != null) ps.close();
					if(conn != null) conn.close();
				}catch(Exception e2){
					
				}
			}
		}
	   
	  
	   
}
