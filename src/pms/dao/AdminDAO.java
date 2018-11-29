package pms.dao;

import java.sql.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import pms.model.AdminBean;
import pms.connection.ConnectionManager;

public class AdminDAO {
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps = null;
	static Statement stmt = null;
    static String admID, admName, admPassword, admEmail, admPhone, svID;
    
    //login
    public static AdminBean login(AdminBean bean) throws NoSuchAlgorithmException {
    	
        admEmail = bean.getAdmEmail();
        admPassword = bean.getAdmPassword();
        
        //convert the password to MD5
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(admPassword.getBytes());
 
        byte byteData[] = md.digest();
 
        //convert the byte to hex format
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }
        
        String searchQuery = "select * from ADMIN where ADMEMAIL='" + admEmail + "' AND ADMPASSWORD='" + sb.toString() + "'";

        System.out.println("Your email is " + admEmail);
        System.out.println("Your password is " + admPassword);
        System.out.println("Query: " + searchQuery);

        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            boolean more = rs.next();

            // if user exists set the isValid variable to true
            if (more) {
            	String email = rs.getString("admEmail");
            	String name = rs.getString("admName");
            	String id = rs.getString("admID");
           		System.out.println("Welcome " + name + ", ID = " + id);
                bean.setAdmEmail(email);
                bean.setAdmName(name);
                bean.setAdmID(id);
                bean.setValid(true);
           	}
           
            // if user does not exist set the isValid variable to false
            else if (!more) {
            	System.out.println("Sorry, you are not a registered user! Please sign up first");
            	bean.setValid(false);
            }
           
        }

        catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                }
                rs = null;
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
                stmt = null;
            }

            if (currentCon != null) {
                try {
                    currentCon.close();
                } catch (Exception e) {
                }

                currentCon = null;
            }
        }

        return bean;
    }

}
