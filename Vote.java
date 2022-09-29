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
public class Vote {
   @RequestMapping("/vote")
      public String func01(Model model,      
               @RequestParam(value="id") int id, 
               @RequestParam(value="candiname") String candiname
            ) {

      
      Dbconnect dbcon = new Dbconnect();
      Connection conn=dbcon.dbconn();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String result="";
      String resultstr="";
       ArrayList<VoteDTO> al= new ArrayList<VoteDTO>();
       try {
          String sql =" select id from vote where id= ? ";
          pstmt = conn.prepareStatement(sql);          
          //System.out.println(sql);
          pstmt.setInt(1,id);
          rs = pstmt.executeQuery();
          if (rs.next()) {
        	  System.out.println("id있음");
             result="F";
             resultstr="이미 투표하셨습니다.";
          } else {
        	  System.out.println("id없음");
             sql =" insert INTO vote ( id, candiname) VALUES ( ?,? );  ";
             pstmt = conn.prepareStatement(sql);
             pstmt.setInt(1, id);
             pstmt.setString(2,candiname);
             System.out.println(sql);
             pstmt.executeQuery();
             
             sql =" select name from candidate where name= ? ";
             pstmt = conn.prepareStatement(sql);            
             System.out.println(sql);
             pstmt.setString(1,candiname);
             rs = pstmt.executeQuery();
             if (rs.next()) {
                sql =" update candidate set cnt =cnt+1 WHERE NAME = ? ";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1,candiname);
             } else {
                sql =" insert INTO candidate ( name, cnt) VALUES ( ?,? );  ";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1,candiname);
                pstmt.setInt(2, 1);
             }
             System.out.println(sql);
             pstmt.executeQuery();
             result="S";
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
     model.addAttribute("result",result);
     model.addAttribute("resultstr",resultstr);
      return "voteafter";
   }
}

   
   