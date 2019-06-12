<%-- 
    Document   : welcome
    Created on : 14-Feb-2017, 11:46:58
    Author     : johnp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
    </head>
    <body>
         <%@include file= "header.jsp" %>
         <br>
        
          
            <%
                 String name = request.getParameter("name");
                 out.println("Welcome " + name); 
            %>
         
   </body>
      
               <%@include file= "footer.jsp" %>

</html>