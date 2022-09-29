package Pack01;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Index {  
   @RequestMapping("/Indexcontroller")
   public String login (Model model,
         @RequestParam (value = "name") String name,
         @RequestParam(value = "pwd") String pwd)
   {
        Dbconnect dbcon = new Dbconnect();
        Connection con=dbcon.dbconn();
        PreparedStatement ps = null;
        ResultSet rs = null;         
        int count =0;
      String rsname=null;     
      int id=0;
      int rsid=0;    
       try {

            String sql= "select id, name, pwd from member where name = ?";
            System.out.println(sql);
            ps=con.prepareStatement(sql);
            ps.setString(1,name);
            System.out.println("["+name+"]");
            rs=ps.executeQuery(); 

          if(rs.next()) {
               rsname = rs.getString("name");   
               rsid=rs.getInt("id");
               System.out.println(rs.getInt("id"));
              
               if (pwd.equals(rs.getString("pwd"))) {
                    System.out.println("로그인 되었습니다.");   
               }
               else {
                  System.out.println("비밀번호 불일치입니다."); 
                  count = 1;
               }
               
              
        }
       }catch (SQLException e) {
          System.out.println("error: " + e);
       } finally {
          try {
             if (rs != null) {rs.close();}
             if (ps != null) {ps.close(); }
      
               if (con != null && !con.isClosed()) {
                  con.close();
               }
            } 
          catch (SQLException e) {
               e.printStackTrace();
            }
       }
       model.addAttribute("name",rsname); 
       model.addAttribute("id",rsid); 
       model.addAttribute("count",count); 
       System.out.println(rsname);
       System.out.println(rsid);
       System.out.println(count);
         return "indexView";

   }
}