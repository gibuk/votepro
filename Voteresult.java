package Pack01;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class Voteresult {
	@RequestMapping( "/vr" ) 
	public String voteResult(Model model) {
		Dbconnect dbcon = new Dbconnect();
		Connection conn=dbcon.dbconn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
	    ArrayList<VoteDTO> al= new ArrayList<VoteDTO>();
	    try {
	    	String sql =" select name, cnt from candidate order by cnt DESC  ";
	    	pstmt = conn.prepareStatement(sql);
	    	//System.out.println(sql);
	    	rs = pstmt.executeQuery();
	    	String name = "";
	    	int cnt=0;
	    	while (rs.next()) {
	    		name = rs.getString("name");
	    		cnt =rs.getInt("cnt");	
	    		al.add(new VoteDTO(name, cnt));
	    	} 	    	
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
	  model.addAttribute("al",al);
      return "voteresult";
	}
}
