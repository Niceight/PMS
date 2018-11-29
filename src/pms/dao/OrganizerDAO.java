package pms.dao;

import java.util.*;
import java.sql.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import pms.model.OrganizerBean;
import pms.connection.ConnectionManager;

public class OrganizerDAO {
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps = null;
	static Statement stmt = null;
    static String orgID, orgName, orgPassword, orgEmail, orgIC, orgPhone1, orgPhone2, typeOrganization, organization;
    
    //login
    public static OrganizerBean login(OrganizerBean bean) throws NoSuchAlgorithmException {
    	
        orgEmail = bean.getOrgEmail();
        orgPassword = bean.getOrgPassword();
        
        //convert the password to MD5
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(orgPassword.getBytes());
 
        byte byteData[] = md.digest();
 
        //convert the byte to hex format
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }
        
        String searchQuery = "select * from ORGANIZER where ORGEMAIL='" + orgEmail + "' AND ORGPASSWORD='" + sb.toString() + "'";

        System.out.println("Your email is " + orgEmail);
        System.out.println("Your password is " + orgPassword);
        System.out.println("Query: " + searchQuery);

        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            boolean more = rs.next();

            // if user exists set the isValid variable to true
            if (more) {
            	String email = rs.getString("orgEmail");
            	String name = rs.getString("orgName");
            	String id = rs.getString("orgID");
           		System.out.println("Welcome " + name + ", ID = " + id);
                bean.setOrgEmail(email);
                bean.setOrgName(name);
                bean.setOrgID(id);
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
    public void add(OrganizerBean bean) throws NoSuchAlgorithmException{
    	
        orgName = bean.getOrgName();
        orgPassword = bean.getOrgPassword();
    	orgEmail = bean.getOrgEmail();
    	orgIC = bean.getOrgIC();
        orgPhone1 = bean.getOrgPhone1();
        orgPhone2 = bean.getOrgPhone2();
        typeOrganization = bean.getTypeOrganization();
        organization = bean.getOrganization();

        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(orgPassword.getBytes());
 
        byte byteData[] = md.digest();
 
        //convert the byte to hex format
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }
        
        String pass = sb.toString();
       
    	try {
    		currentCon = ConnectionManager.getConnection();
    		ps=currentCon.prepareStatement("insert into ORGANIZER (ORGNAME,ORGPASSWORD,ORGEMAIL,ORGIC,ORGPHONE1,ORGPHONE2,TYPEORGANIZATION,ORGANIZATION)values(?,?,?,?,?,?,?,?)");
    		ps.setString(1,orgName);
    		ps.setString(2,pass);
    		ps.setString(3,orgEmail);
    		ps.setString(4,orgIC);
    		ps.setString(5,orgPhone1);
    		ps.setString(6,orgPhone2);
    		ps.setString(7,typeOrganization);
    		ps.setString(8,organization);
    		
    		ps.executeUpdate();
    	
    		System.out.println("Your email is " + orgEmail);
    		System.out.println("Your password is " + pass);
            
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
    
    public void deleteOrganizer(String orgEmail) {
        try {
        	currentCon = ConnectionManager.getConnection();
        	ps=currentCon.prepareStatement("delete from ORGANIZER where ORGEMAIL=?");
            ps.setString(1, orgEmail);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //update account
    public void updateAccount(OrganizerBean bean) throws NoSuchAlgorithmException {

    	orgName = bean.getOrgName();
        orgPassword = bean.getOrgPassword();
    	orgEmail = bean.getOrgEmail();
    	orgIC = bean.getOrgIC();
        orgPhone1 = bean.getOrgPhone1();
        orgPhone2 = bean.getOrgPhone2();
        typeOrganization = bean.getTypeOrganization();
        organization = bean.getOrganization();
    	
    	//convert the password to MD5
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(orgPassword.getBytes());
 
        byte byteData[] = md.digest();
 
        //convert the byte to hex format
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }
       
        String searchQuery = "UPDATE ORGANIZER SET ORGNAME='" + orgName + "', ORGPASSWORD='" + sb.toString() +  "', ORGIC='" + orgIC + 
        					"', ORGPHONE1='" + orgPhone1 + "', ORGPHONE2='" + orgPhone2 + "', TYPEORGANIZATION='" + typeOrganization +  
        					"', ORGANIZATION='" + organization + "' WHERE ORGEMAIL= '" + orgEmail + "'";

    	try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            stmt.executeUpdate(searchQuery);
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    //get all user
    public List<OrganizerBean> getAllOrganizer() {
        List<OrganizerBean> organizers = new ArrayList<OrganizerBean>();
        try {
        	currentCon = ConnectionManager.getConnection();
        	stmt = currentCon.createStatement();
            ResultSet rs = stmt.executeQuery("select * from ORGANIZER");
            
            while (rs.next()) {
            	OrganizerBean organizer = new OrganizerBean();
            	organizer.setOrgEmail(rs.getString("orgEmail"));
            	organizer.setOrgPassword(rs.getString("orgPassword"));
            	organizers.add(organizer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return organizers;
    }
    
    //get user by email
    public OrganizerBean getOrganizerByEmail(String orgEmail) {
    	OrganizerBean organizer = new OrganizerBean();
        try {
        	currentCon = ConnectionManager.getConnection();
            ps=currentCon.prepareStatement("select * from ORGANIZER where ORGEMAIL=?");

            ps.setString(1, orgEmail);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            	organizer.setOrgName(rs.getString("orgName"));
            	organizer.setOrgPassword(rs.getString("orgPassword"));
            	organizer.setOrgEmail(rs.getString("orgEmail"));
            	organizer.setOrgIC(rs.getString("orgIC"));
            	organizer.setOrgPhone1(rs.getString("orgPhone1"));
            	organizer.setOrgPhone2(rs.getString("orgPhone2"));
            	organizer.setTypeOrganization(rs.getString("typeOrganization"));
            	organizer.setOrganization(rs.getString("organization"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return organizer;
    }
    
    //get user by email
    public static OrganizerBean getOrganizer(OrganizerBean bean)  {
    	
        orgEmail = bean.getOrgEmail();

        String searchQuery = "select * from ORGANIZER where ORGEMAIL='" + orgEmail + "'";

        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            boolean more = rs.next();

            // if user exists set the isValid variable to true
            if (more) {
            	String email = rs.getString("orgEmail");
           
                bean.setOrgEmail(email);
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
}
