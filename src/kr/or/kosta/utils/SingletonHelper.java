package kr.or.kosta.utils;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 
//조건 : Oracle, mysql 연동(oracle, mysql) 연동 할수 있는 싱글톤
public class SingletonHelper {
    public static Connection conn = null;
    public static Connection conn2 = null;
    
    private SingletonHelper(){}
 
    public static Connection getConnection(String dsn) {
        Connection temp = null;
        try {
            if (dsn.equals("mysql")) {
                if (conn == null) {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kostadb", "kosta", "1004");
                }
                temp = conn;
            } else if (dsn.equals("oracle")) {
                if (conn2 == null) {
                    Class.forName("oracle.jdbc.OracleDriver");
                    conn2 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "kglim", "1004");
                }
                temp = conn2;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            return temp;
        }
    }
 
    public static Connection getConnection(String dsn, String uid, String pwd) {
        Connection temp = null;
        try {
            if (dsn.equals("mysql")) {
                if (conn == null) {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kostadb", uid, pwd);
                }
                temp = conn;
            } else if (dsn.equals("oracle")) {
                if (conn2 == null) {
                    Class.forName("oracle.jdbc.OracleDriver");
                    conn2 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", uid, pwd);
                }
                temp = conn2;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            return temp;
        }
    }
    
    // 기능(자원 해제)
    public static void close(Connection conn){
        if (conn != null) {
            try {
                conn.close();
                conn=null;
            } catch (SQLException e) {
 
                e.printStackTrace();
            }
        }else{
        	try {
				conn2.close();
	        	conn2=null;
			} catch (SQLException e) {
				e.printStackTrace();
			}

        }
    }
 
    public static void close(Statement stmt) {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
 
                e.printStackTrace();
            }
        }
    }
 
    public static void close(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
 
                e.printStackTrace();
            }
        }
    }
 
    public static void close(PreparedStatement pstmt) {
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
 
                e.printStackTrace();
            }
        }
    }
}
 