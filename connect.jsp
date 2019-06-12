<%-- 
    Document   : connect
    Created on : 14-Feb-2017, 12:33:11
    Author     : johnp
--%>

<%@page import= "java.util.*;"%>

 <%@page import= "java.sql.*" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Check Page</title>
    </head>
    <body>
      
        
        <%

                 
                 String uname = request.getParameter("name");
                 String password = request.getParameter("psswrd");
                 
    	
// below is the section where i make a connection with the database on my localhost and initiliase the statement
// and the resultset to begin to interact with the DB    		 
                 try{
    	    
                  Class.forName("org.apache.derby.jdbc.ClientDriver");
                  Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Reservations","johnpaul","purlease");
                   Statement st = con.createStatement();
                    ResultSet rs;
                   rs = st.executeQuery("select * from SECURITYTABLE where USER_NAME='" + uname + "' and PASSWORD='" + password + "'");
                   if (rs.next()) {
                       response.sendRedirect("welcome.jsp?,name=" + uname+ "");
                       
                    } else {
                         out.println("<h3>Invalid Password.</h3> <a href='default.jsp'><h3>Try Again</h3></a>");
                    }
                 }catch(ClassNotFoundException se){
    		    //Handle errors 
    		    se.printStackTrace();
    		 }
             %>   
            
    </body>
</html>
