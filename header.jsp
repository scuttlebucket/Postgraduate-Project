<%-- 
    Document   : header
    Created on : 14-Feb-2017, 13:29:38
    Author     : johnp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Restaurant</title>
<style>
body {
    background-color: linen;
}

h2 {
    
    color: maroon;
    margin-left:610px;
} 
h1 {
    
    color: maroon;
    margin-left:625px;
} 

img {
    display: block;
    margin: auto;
    width: 40%;
   
}
</style>
        
    </head>
<body>

<%-- <%  // Get session creation time.
   Date createTime = new Date(session.getCreationTime());
   // Get last access time of this web page.
   Date lastAccessTime = new Date(session.getLastAccessedTime());

   String title = "Welcome Back to Pop's Place";
   Integer visitCount = new Integer(0);
   String visitCountKey = new String("visitCount");
   // String userIDKey = new String("userID");
   //String userID = new String("ABCD");

   // Check if this is new comer on your web page.
   if (session.isNew()){
      title = "Welcome to Pop's Place";
     // session.setAttribute(userIDKey, userID);
      session.setAttribute(visitCountKey,  visitCount);
   } 
   visitCount = (Integer)session.getAttribute(visitCountKey);
   visitCount = visitCount + 1;
  // userID = (String)session.getAttribute(userIDKey);
   session.setAttribute(visitCountKey,  visitCount); %> --%>



<h2>Session Tracking</h2>

<table border="1" align="center"> 
<tr bgcolor="#949494">
   <th>Session info</th>
   <th>Value</th>
</tr> 
<tr>
   <td>Creation Time</td>
   <td><% out.print(""); %></td>
</tr> 
<tr>
   <td>Time of Last Access</td>
   <td><% out.print(""); %></td>
</tr> 
 
<tr>
   <td>Number of visits</td>
   <td><% out.print(""); %></td>
</tr> 
</table> 
<br>
   <%-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        
        <style type="text/css">
            body{background:#ff00cc;}
            p {font-family:sans-serif; font-size:16pt;}
   
        </style> --%>

<h1>Pop's Place</h1>
<br>
       <img src="https://celiac.org/wp/wp-content/uploads/2013/07/what-can-i-eat.jpg" alt="Tasty Bites" style="width:150px;height:120px;">
</body>

</html>