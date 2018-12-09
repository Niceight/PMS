package pms.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
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
    
  //add new user (register)
    public void add(AdminBean bean) throws NoSuchAlgorithmException{
    	
        admName = bean.getAdmName();
        admPassword = bean.getAdmPassword();
    	admEmail = bean.getAdmEmail();
    	admPhone = bean.getAdmPhone();
        svID = bean.getSvID();

        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(admPassword.getBytes());
 
        byte byteData[] = md.digest();
 
        //convert the byte to hex format
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }
        
        String pass = sb.toString();
       
    	try {
    		currentCon = ConnectionManager.getConnection();
    		ps=currentCon.prepareStatement("insert into ADMIN (ADMNAME,ADMPASSWORD,ADMEMAIL,ADMPHONE,SVID)values(?,?,?,?,?)");
    		ps.setString(1,admName);
    		ps.setString(2,pass);
    		ps.setString(3,admEmail);
    		ps.setString(4,admPhone);
    		ps.setString(5,svID);
    		ps.executeUpdate();
    	
    		System.out.println("The email is " + admName);
    		System.out.println("The password is " + pass);
            
    	}

    	catch (Exception ex) {
    		System.out.println("failed: An Exception has occurred! " + ex);
    	}

    	finally {
    		if (ps != null) {
    			try {
    				ps.close();
    			} catch (Exception e) {
    			}
    			ps = null;
    		}
    		
    		if (currentCon != null) {
    			try {
    				currentCon.close();
    			} catch (Exception e) {
    			}
    			currentCon = null;
    		}
    	}
    }
    
    //get user by email
    public static AdminBean getAdmin(AdminBean bean)  {
    	
        admEmail = bean.getAdmEmail();

        String searchQuery = "select * from ADMIN where ADMEMAIL='" + admEmail + "'";

        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            boolean more = rs.next();

            // if user exists set the isValid variable to true
            if (more) {
            	String email = rs.getString("admEmail");
           
                bean.setAdmEmail(email);
                bean.setValid(true);
           	}
           
            else if (!more) {
            	System.out.println("Sorry");
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
    
    //update account
    public void updateAccount(AdminBean bean) throws NoSuchAlgorithmException {

    	admName = bean.getAdmName();
        admPassword = bean.getAdmPassword();
    	admEmail = bean.getAdmEmail();
    	admPhone = bean.getAdmPhone();
        svID = bean.getSvID();
    	
    	//convert the password to MD5
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(admPassword.getBytes());
 
        byte byteData[] = md.digest();
 
        //convert the byte to hex format
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }
       
        String searchQuery = "UPDATE ADMIN SET ADMNAME='" + admName + "', ADMPASSWORD='" + sb.toString() +  "', ADMEMAIL='" + admEmail + 
        					"', ADMPHONE='" + admPhone + "', SVID='" + svID +
        					"' WHERE ADMEMAIL= '" + admEmail + "'";

    	try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            stmt.executeUpdate(searchQuery);
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    //get user by email
    public AdminBean getAdminByEmail(String admEmail) {
    	AdminBean admin = new AdminBean();
        try {
        	currentCon = ConnectionManager.getConnection();
            ps=currentCon.prepareStatement("select * from ADMIN where ADMEMAIL=?");

            ps.setString(1, admEmail);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            	admin.setAdmName(rs.getString("admName"));
            	admin.setAdmPassword(rs.getString("admPassword"));
            	admin.setAdmEmail(rs.getString("admEmail"));
            	admin.setAdmPhone(rs.getString("admPhone"));
            	admin.setSvID(rs.getString("svID"));
            	admin.setPosition(rs.getString("position"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return admin;
    }
    
    public AdminBean getAdminByID(String svID) {
    	AdminBean admin = new AdminBean();
        try {
        	currentCon = ConnectionManager.getConnection();
        	stmt = currentCon.createStatement();
            ResultSet rs = stmt.executeQuery("select admName from ADMIN where admID='" + svID + "'");

            while (rs.next()) {
            	admin.setAdmName(rs.getString("admName"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return admin;
	}
    
	public List<AdminBean> getAdminBySvID(String svID) {
		List<AdminBean> admins = new ArrayList<AdminBean>();
        try {
        	currentCon = ConnectionManager.getConnection();
        	stmt = currentCon.createStatement();
            ResultSet rs = stmt.executeQuery("select * from ADMIN where svID='" + svID + "'");

            while (rs.next()) {
            	AdminBean admin = new AdminBean();
            	admin.setAdmID(rs.getString("admID"));
            	admin.setAdmName(rs.getString("admName"));
            	admin.setAdmPassword(rs.getString("admPassword"));
            	admin.setAdmEmail(rs.getString("admEmail"));
            	admin.setAdmPhone(rs.getString("admPhone"));
            	admin.setSvID(rs.getString("svID"));
            	admin.setPosition(rs.getString("position"));
            	admins.add(admin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return admins;
	}
	
	public List<AdminBean> getAllManager() {
		List<AdminBean> managers = new ArrayList<AdminBean>();
        try {
        	currentCon = ConnectionManager.getConnection();
        	stmt = currentCon.createStatement();
            ResultSet rs = stmt.executeQuery("select * from ADMIN where POSITION='MANAGER'");

            while (rs.next()) {
            	AdminBean manager = new AdminBean();
            	manager.setAdmID(rs.getString("admID"));
            	manager.setAdmName(rs.getString("admName"));
            	managers.add(manager);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return managers;
	}
	
	//get sum diproses
	public int getSumPendingProgram() {
    	int diproses = 0;
        try {
        	currentCon = ConnectionManager.getConnection();
        	stmt = currentCon.createStatement();
            ResultSet rs = stmt.executeQuery("select count(progid) diproses from program join status using (progid) where (progid, statusdate) in ( select progid, max(statusdate) from status group by progid) and status='DIPROSES'");
            
            while (rs.next()) {
            	diproses = rs.getInt("diproses");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return diproses;
	}
	
	//get sum lulus
	public int getSumApproveProgram() {
    	int lulus = 0;
        try {
        	currentCon = ConnectionManager.getConnection();
        	stmt = currentCon.createStatement();
            ResultSet rs = stmt.executeQuery("select count(progid) lulus from program join status using (progid) where (progid, statusdate) in ( select progid, max(statusdate) from status group by progid) and status='LULUS'");
            
            while (rs.next()) {
            	lulus = rs.getInt("lulus");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lulus;
	}
	
	//get sum gagal
	public int getSumRejectProgram() {
    	int gagal = 0;
        try {
        	currentCon = ConnectionManager.getConnection();
        	stmt = currentCon.createStatement();
            ResultSet rs = stmt.executeQuery("select count(progid) gagal from program join status using (progid) where (progid, statusdate) in ( select progid, max(statusdate) from status group by progid) and status='GAGAL'");
            
            while (rs.next()) {
            	gagal = rs.getInt("gagal");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return gagal;
	}
	
	//get sum semua
	public int getSumAllProgram() {
    	int semua = 0;
        try {
        	currentCon = ConnectionManager.getConnection();
        	stmt = currentCon.createStatement();
            ResultSet rs = stmt.executeQuery("select count(progid) semua from program p join status s using (progid) where (progid, statusdate) in ( select progid, max(statusdate) from status group by progid)");
            
            while (rs.next()) {
            	semua = rs.getInt("semua");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return semua;
	}
	
	//get sum pengguna program
	public int getSumOrganizerProgram() {
    	int pengguna = 0;
        try {
        	currentCon = ConnectionManager.getConnection();
        	stmt = currentCon.createStatement();
            ResultSet rs = stmt.executeQuery("select count(progid) pengguna from program join status using (progid) where (progid, statusdate) in ( select progid, max(statusdate) from status group by progid) and orgid is not null");
            
            while (rs.next()) {
            	pengguna = rs.getInt("pengguna");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return pengguna;
	}
	
	//get sum pentadbir program
	public int getSumAdminProgram() {
    	int pentadbir = 0;
        try {
        	currentCon = ConnectionManager.getConnection();
        	stmt = currentCon.createStatement();
            ResultSet rs = stmt.executeQuery("select count(progid) pentadbir from program p join status s using (progid) where (progid, statusdate) in ( select progid, max(statusdate) from status group by progid) and p.admid is not null");
            
            while (rs.next()) {
            	pentadbir = rs.getInt("pentadbir");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return pentadbir;
	}
}
