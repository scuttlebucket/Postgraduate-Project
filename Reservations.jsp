<%-- 
    Document   : Reservations
    Created on : 20-Apr-2017, 16:44:31
    Author     : johnp
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*;"%>
<%@page import="java.util.Date;"%>


<!DOCTYPE HTML>

    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Reservations</title>
            
        </head>
      
           <%-- <%@include file= "header.jsp" %> --%>
            
            <h1>Reservations:Please enter a reservation</h1> 
            


           
            <%    

                
                int tableNum = 0; 
                String firstName = null; 
                String lastName = null;
                String Address = null;
                int Phone = 0;
                java.sql.Date date = null;
                int People = 0;
                
               
                if (request.getParameter("table_num")!=null){
                    tableNum = Integer.parseInt(request.getParameter("table_num"));

                }
                if (request.getParameter("first")!=null){
                    firstName = request.getParameter("first");
                }
                if (request.getParameter("last")!=null){
                    lastName = request.getParameter("last");
                }
                if (request.getParameter("address")!=null){
                    Address = request.getParameter("address");
                }
                if (request.getParameter("phone")!=null){
                    Phone = Integer.parseInt(request.getParameter("phone"));
                }   
                if (request.getParameter("date")!=null){
                   java.util.Date utilDate = new java.util.Date(request.getParameter("date"));
                   date = new java.sql.Date(utilDate.getTime());
                   DateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                   Date dateobj = new Date();
                   sdf.format(dateobj);


                }
                    
                      
                if (request.getParameter("people")!=null){
                    People = Integer.parseInt(request.getParameter("people"));
                } 
                if(tableNum != 0 && firstName != null && lastName != null && Address != null && Phone != 0 && date != null && People != 0){ 
                    


                    
                    try{

                        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                        System.out.println("Connecting to DB...");
                        Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/Reservations","johnpaul", "purlease");
                        System.out.println("Connected successfuly");
                                
                        System.out.println("Inserting records into table");      
                        
         
                        PreparedStatement stmt = con.prepareStatement("INSERT INTO CUSTOMER_RESERVATIONS(TABLE_NUM,FIRST_NAME,LAST_NAME,ADDRESS,TELEPHONE,DATE,NUMBER_IN_PARTY)VALUES(?,?,?,?,?,?,?)");
                        stmt.setInt(1, tableNum );
                        stmt.setString(2, firstName);
                        stmt.setString(3, lastName);
                        stmt.setString(4, Address);
                        stmt.setInt(5, Phone );
                        stmt.setDate(6, date);
                        stmt.setInt(7, People);
                        

      
                        stmt.executeUpdate();  
                        System.out.println("Records inserted");
                        //con.close(); 
                    
                       }catch(SQLException se){
                        se.printStackTrace();
                    }catch(ClassNotFoundException se){
    		    //Handle errors for JDBC
                        se.printStackTrace();
    		    }catch(Exception e){
                    //Handle errors for Class.forName
                         e.printStackTrace(); 
                     
                }
                }
                   
             %>
             
        
             <br> 
             <form name="Reserve" action="Reservations.jsp" method="POST">
                <table border="1">

                    <tbody>
                        <tr>
                            <td>Table Number:</td>
                            <td><input type="text" name="table_num" value="" size="10" /></td>
                         
                        </tr>
                        <tr>
                            <td>First name:</td>
                            <td><input type="text" name="first" value="" size="50" /></td> 
                        
                        </tr>
                        <tr>
                            <td>Last name:</td>
                            <td><input type="text" name="last" value="" size="50" /></td> 
                       
                        </tr>
                        <tr>
                            <td>Address:</td>
                            <td><input type="text" name="address" value="" size="50" /></td>
                          
                        </tr>
                        <tr>
                            <td>Telephone:</td>
                            <td><input type="text" name="phone" value="" size="30" /></td>
                            
                        </tr>

                        <tr>
                            <td>Date:</td>
                            <td><input type="text" name="date" value="" size="10" /></td> 
                            
                        </tr>
                        <tr>
                            <td>Number in party:</td>
                            <td><input type="text" name="people" value="" size="10" /></td> 
                        </tr>
                    </tbody>
                </table>
            <input type="submit" value="Submit" name="submit" />
            <input type="reset" value="Clear" name="clear" />
                
            </form>
             <br>
     
       <%!public class Retrieve {
                  String URL = "jdbc:derby://localhost:1527/Reservations";
                  String USER = "johnpaul";
                  String PASS = "purlease";

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null; 

    public Retrieve(){

         try{
             conn = DriverManager.getConnection(URL, USER, PASS);
             stmt = conn.prepareStatement(
              "SELECT * FROM Customer_Reservations");
             }catch(SQLException e){
             e.printStackTrace();}
}

                    

    public ResultSet getReservations(){

          try{ 
             rs = stmt.executeQuery(); 

             }catch(SQLException fe){
             fe.printStackTrace();}
         
          return rs;

}

}         %>
              
          <%    
              Retrieve ret = new Retrieve(); 
              ResultSet rs = ret.getReservations();
          %>
          <table border="1" width="4" cellspacing="4" cellpadding="2">
              <thead>
                  <tr>
                    <th>Table Number</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Date</th>
                    <th>People</th>
                  </tr>
              </thead>
              <% while (rs.next()){ %> 
      <tbody>
      <tr>
          
          <td><%=rs.getString("table_num")%></td>
          <td><%=rs.getString("first_name")%></td>
          <td><%=rs.getString("last_name")%></td>
          <td><%=rs.getString("address")%></td>
          <td><%=rs.getInt("telephone")%></td>
          <td><%=rs.getDate("date")%></td>
          <td><%=rs.getInt("number_in_party")%></td>
      </tr>  
                
    <% } %>

          </tbody>
          </table>    
     <%-- <%@include file= "footer.jsp" %> --%>
      </html>    
             
   
             
             
            
     
