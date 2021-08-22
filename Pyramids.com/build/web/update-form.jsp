<%-- 
    Document   : update-profile
    Created on : Jan 11, 2021, 6:46:11 PM
    Author     : dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Profile</title>
        <style>
            h3{
                text-align: center;
            }
            body{
                font-family: Arial;
                background-color: #CCCCCC;
            }
            .form-section{
                width:50%;
                height:50%;
                padding: 20px;
                background-color: #F1F1F1;
                margin-left:23%;
                margin-top: 5%;
            }
            .int{
                color:#222222;
                background-color: #CCCCCC;
                padding: 5px;
                width:60px;
            }
            hr.line1{
                border-top: 1px solid #8c8b8b;
            }

        </style>
    </head>

    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3307/pyramids.com?useSSL=false";
            String user = "root";
            String password = "root";
            Connection conn = null;

            conn = (Connection) DriverManager.getConnection(url, user, password);
            String usernameWithGar = request.getParameter("username");

            String username = usernameWithGar.substring(2, usernameWithGar.length() - 2);

            String query = "SELECT * FROM client WHERE userName = '" + username + "'";

            Statement st = (Statement) conn.createStatement();
            ResultSet rs = st.executeQuery(query);
        %>

        <%if (rs.next() == true) {%>
        <form class="form-section" action="updateProfile?username= <%= username%>">

            <h3>UPDATE PROFILE</h3>   
            <hr class="line1">
            <label>Username:</label><br>
            <input type="text" value=<%= rs.getString("userName")%>  name="username" readonly><br><br>
            <label>First name:</label><br>
            <input type="text" value=<%= rs.getString("fname")%>  name="fname"><br><br>
            <label>Last name</label><br>
            <input type="text" value=<%= rs.getString("lname")%>  name="lname"><br><br>
            <label>Email:</label><br>
            <input type="text" value=<%= rs.getString("email")%>  name="email"><br><br>
            <label>Password:</label><br>
            <input type="text" value=<%= rs.getString("password")%>  name="password"><br><br>
            <label>Phone number:</label><br>
            <input type="text" value=<%= rs.getString("phone")%> name="phone"><br><br>

            <input class="int" type="submit" value="Save"><br><br>
            <%}%>
        </form>
    </body>
</html>
