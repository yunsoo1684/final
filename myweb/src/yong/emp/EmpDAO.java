package yong.emp;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;

import yong.db.yongDb;

public class EmpDAO { //기능 클래스
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public EmpDAO() {
		System.out.println("EmpDAO()생성자 호출됨!");
		
	}
	
	
	
	/**사원 등록 관련 메서드*/
	public int empAdd(EmpDTO dto){
		try{
			
			
			conn = yong.db.yongDb.getConn();

			String sql = "insert into employee values(employee_idx.nextval, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getDept());
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
				
			}
		}
	}
	
	/**사원 삭제 관련 메서드*/
	public int empDel(EmpDTO dto){
		try{
			conn = yong.db.yongDb.getConn();
			
			String sql = "Delete from employee where name = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
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
				
			}
		}
	}
	
	/**모든 사원 보기 관련 메서드*/
	public EmpDTO[] empList(){
		try{
			conn = yong.db.yongDb.getConn();
			
			String sql = "select * from employee";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();		
			
			Vector<EmpDTO> v = new Vector<EmpDTO>(); //Vector보다는 ArrayList를 많이 사용
			while(rs.next()){
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String dept = rs.getString("dept");
				
				EmpDTO dto = new EmpDTO(idx, name, email, dept);
				v.add(dto);
			}
			
			EmpDTO dtos[] = new EmpDTO[v.size()];
			v.copyInto(dtos); //자동적으로 주소값을 복사
			return dtos;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(conn != null) conn.close(); //또다시 에러나는 것을 미리 방지
			}catch(Exception e2){
				
			}
		}
	}
	
	/**사원 검색 관련 메소드*/
	public EmpDTO[] empSearch(EmpDTO dto){
		try{
			conn = yong.db.yongDb.getConn();
			
			String sql = "select * from employee where name = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			rs = ps.executeQuery();
			
			Vector<EmpDTO> v = new Vector<EmpDTO>();
			while(rs.next()){
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String dept = rs.getString("dept");
				
				dto = new EmpDTO(idx, name, email, dept);
				v.add(dto);
			}
			
			EmpDTO dtos[] = new EmpDTO[v.size()];
			v.copyInto(dtos);
			return dtos;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			}catch(Exception e2){
				
			}
		}
	}
	
	/**사원 수정 관련 메소드*/
	public EmpDTO[] empUpdate(EmpDTO dto){
		try{
			conn = yong.db.yongDb.getConn();
			
			String sql = "select * from employee where idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getIdx());
			rs = ps.executeQuery();
			
			Vector<EmpDTO> v = new Vector<EmpDTO>();
			
			if(rs.next())
			{
				do
				{
					int idx = rs.getInt("idx");
					String name = rs.getString("name");
					String email = rs.getString("email");
					String dept = rs.getString("dept");
					
					dto = new EmpDTO(idx, name, email, dept);
					v.add(dto);
				}while(rs.next());
			}
			
			EmpDTO dtos[] = new EmpDTO[v.size()];
			v.copyInto(dtos); 
			return dtos;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			}catch(Exception e2){
				
			}
		}
	}
	
	public int empUpdate2(EmpDTO dto){
		try{
			conn = yong.db.yongDb.getConn();
			
			String sql = "Update employee set name = ?, email = ?, dept = ? where idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getDept());
			ps.setInt(4, dto.getIdx());
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
				
			}
		}
	}
}