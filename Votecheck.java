package Pack01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
@Controller
public class Votecheck {
	   @RequestMapping("/votecheck")
	      public String func01(Model model,      
	               @RequestParam(value="id") int id
	            ) {

	      
	      Dbconnect dbcon = new Dbconnect();
	      Connection conn=dbcon.dbconn();
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String vc="N";
	       ArrayList<VoteDTO> al= new ArrayList<VoteDTO>();
	       try {
	          String sql =" select id from vote where id= ? ";
	          pstmt = conn.prepareStatement(sql); 
	          pstmt.setInt(1,id);        
	          rs = pstmt.executeQuery(); 	   	          
	          if (rs.next()) {
	        	  vc="Y";
	          } 
	          System.out.println(vc);
	       }catch (SQLException e) {
	          System.out.println("error: " + e);
	       } finally {
	          try {
	             if (rs != null) {rs.close();}
	             if (pstmt != null) {pstmt.close(); }
	      
	               if (conn != null && !conn.isClosed()) {
	                  conn.close();
	               }
	            } 
	          catch (SQLException e) {
	               e.printStackTrace();
	            }
	       } 
	     model.addAttribute("vc",vc);
	     return "vote";
	   }
	}

	   
