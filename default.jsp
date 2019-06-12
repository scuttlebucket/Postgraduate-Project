<%-- 
    Document   : defaultjsp
    Created on : 14-Feb-2017, 12:02:01
    Author     : johnp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurant Login Page </title>
    </head>
    <body>
        <h1>Hello. Please log in.</h1>
        
         <form name="LoginForm" action="connect.jsp" method="POST">
            <table border="1">

                <tbody>
                    <tr>
                        <td>Name:</td>
                        <td><input type="text" name="name" value="" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" name="psswrd" value="" size="20" /></td>
                    </tr>
                </tbody>
            </table>

            
        <input type="submit" value="Submit" name="submit" />
        <input type="reset" value="Clear" name="clear" />
        
        </form>
       
     
    </body>
</html>
