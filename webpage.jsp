<%-- 
    Document   : show
    Created on : 24-Feb-2017, 15:32:25
    Author     : johnp
--%>

<%@page import= "java.sql.DriverManager"%>
<%@page import= "java.sql.Statement"%>
<%@page import= "java.sql.Connection"%> 
<%@page import= "java.sql.ResultSet"%>
<%@page import= "java.util.*"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>




<!DOCTYPE HTML>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <link rel='styleSheet' type='text/css' href='nicestyle.css'>  
        
        <title>Presentation</title>
    <link rel="alternate" type="application/rss+xml" title="RSS 2.0"
    href="www.popsplace.eu/Last.xml" />
  
 <%-- <script src ="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>
  
  <script> 
      setInterval(function()
      { $ (div class="row").load('webpage.jsp');
      },120000);
  </script> --%>
  
</head>





<%
  //String ID = request.getParameter("USER"); 
  //String JDBC_DRIVER = "org.apache.derby.jdbc.ClientDriver"; 
  String DB_URL = "jdbc:derby://localhost:1527/Restaurant";
  

   //  Database credentials
   String USER = "johnpaul";
   String PASS = "purlease";
   try{
      //STEP 2: Register JDBC driver
    Class.forName ("org.apache.derby.jdbc.ClientDriver");
      }catch(ClassNotFoundException e){

      //Handle errors for retrieve
      e.printStackTrace(); }

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null; 
    
    System.out.println("Connecting to a selected database...");
    conn = DriverManager.getConnection(DB_URL, USER, PASS);
    System.out.println("Connected database successfully...");
    System.out.println("Creating statement...");
    stmt = conn.createStatement();

%>
 
 <div class="box1"><h1> Pop's Place </h1></div>
    <div class="row">
    <div class ="col">
     <div class="box2">  
       <table>
          <thead>
            <tr>
              <th>Beverage</th>
              <th></th>
              <th>Price</th>
            </tr>
          </thead> 
      <tbody>
      <tr>
          <td></td>
          <td></td>
          <td></td>
      </tr>
   
 
<%
try{

      

      
      //STEP 4: Execute a query

      String sql = "SELECT item,sym,price FROM Menu WHERE category = 'Beverage'";
      
      rs = stmt.executeQuery(sql);

      while(rs.next()){     
%>      
      <tr>
          
          <td><%=rs.getString("item")%></td>
          <td><%=rs.getString("sym")%></td>
          <td><%=rs.getFloat("price")%></td>
        
      </tr>  
<%
      
    
 }
 
      //String val = ("price");
      //System.out.printf("%.2f", val);
      //System.out.println(String.format("%8.3f", val));

   



}
       catch(Exception e){
      //Handle errors for retrieve
      e.printStackTrace();
}

%>
   </tbody>
  </table>
  </div>
  </div>
    <div class ="col">
     <div class="box3">   
       <table>
          <thead>
            <tr>
              <th>Appetizer</th>
              <th></th>
              <th>Price</th>
            </tr>
          </thead> 
      <tbody>
      <tr>
          <td></td>
          <td></td>
          <td></td>
      </tr>
   
 
<%
try{

       String sql = "SELECT item,sym, price FROM Menu WHERE category = 'Appetizer'";
      
      rs = stmt.executeQuery(sql);
      
      while(rs.next()){   
      
%>      
      <tr>
          
          <td><%=rs.getString("item")%></td>
          <td><%=rs.getString("sym")%></td>
          <td><%=rs.getFloat("price")%></td>
      </tr>  
<%
   

 }

      //String val = ("price");
      //System.out.printf("%.2f", val);
      //System.out.println(String.format("%8.3f", val));
   
}
       catch(Exception e){
      //Handle errors for retrieve
      e.printStackTrace();
}
%>
</tbody>
</table>
</div>
</div>
    <div class ="col">
     <div class="box4">   
       <table>
          <thead>
            <tr>
              <th>Main course</th>
              <th></th>
              <th>Price</th>
            </tr>
          </thead> 
      <tbody>
      <tr>
          <td></td>
          <td></td>
          <td></td>
      </tr>
   
 
<%
try{

      String sql = "SELECT item,sym,price FROM Menu WHERE category = 'Main Course'";
      rs = stmt.executeQuery(sql);
      while(rs.next()){   
%>      
      <tr>
          
          <td><%=rs.getString("item")%></td>
          <td><%=rs.getString("sym")%></td>
          <td><%=rs.getFloat("price")%></td>
      </tr>  
<%
    
 }
     
      //String val = ("price");
      //System.out.printf("%.2f", val);
      //System.out.println(String.format("%8.3f", val));

}
       catch(Exception e){
      //Handle errors for retrieve
      e.printStackTrace();
}
%>
</tbody>
</table>
</div>
</div>
<div class ="col">
     <div class="box5">   
       <table>
          <thead>
            <tr>
              <th>Dessert</th>
              <th></th>
              <th>Price</th>
            </tr>
          </thead> 
      <tbody>
      <tr>
          <td></td>
          <td></td>
          <td></td>
      </tr>
   
 
<%
try{

      String sql = "SELECT item,sym, price FROM Menu WHERE category = 'Dessert'";
      rs = stmt.executeQuery(sql);
      while(rs.next()){   
%>      
      <tr>
          
          <td><%=rs.getString("item")%></td>
          <td><%=rs.getString("sym")%></td>
          <td><%=rs.getFloat("price")%></td>
      </tr>  
<%
    
 }
  
      //String val = ("price");
      //System.out.printf("%.2f", val);
      //System.out.println(String.format("%8.3f", val));

}
       catch(Exception e){
      //Handle errors for retrieve
      e.printStackTrace();
}

%>

</tbody>
</table>
</div>
</div>
</div>

 <%--<% 


        class Requery {
        private final ScheduledExecutorService execService

                        =   Executors.newScheduledThreadPool(1);
       
        public void main(String[] args) {

        execService.scheduleAtFixedRate(()->{

          String SQL = "SELECT item,sym, price FROM Menu";

            //System.out.println("Updated at: "+ new java.util.Date());

        }, 0, 120, TimeUnit.SECONDS);

        }
        }

%> --%>
    <div class="container">
        <div id="h1" style="float:left;">
            <h1>Promotions </h1>
        </div>
        <div id="image" > 
            <a href="http://www.popsplace.eu/Last.xml"> 
           <img src="http://icons.iconarchive.com/icons/mcdo-design/book/32/RSS-Book-Alt-icon.png" alt="RSS"/></a>
        </div>
   </div>

</html>


