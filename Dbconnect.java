package Pack01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbconnect {
	   public Connection dbconn() {
		      int rcnt=0;
		      Connection conn = null;
		      String driver = "org.mariadb.jdbc.Driver";
		      String DB_IP = "192.168.0.19";
		      String DB_PORT = "3306";
		      String DB_NAME = "poll";
		      String DB_URL = "jdbc:mariadb://" + DB_IP + ":" + DB_PORT + "/" + DB_NAME;
		      String DB_user="root";
		      String DB_pwd="1234";
		      try {
		         Class.forName(driver);
		         conn = DriverManager.getConnection(DB_URL,DB_user,DB_pwd);
		         System.out.println("로드성공");
		      } catch (ClassNotFoundException e) {
		         System.out.println("드라이버 로드 실패");
		         e.printStackTrace();
		      } catch (SQLException e) {
		         System.out.println("DB 접속 실패");
		         e.printStackTrace();
		      }
		      return conn;
		   }
		}