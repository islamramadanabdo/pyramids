<%-- 
    Document   : logout
    Created on : Jan 6, 2021, 2:22:53 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.invalidate(); 
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
