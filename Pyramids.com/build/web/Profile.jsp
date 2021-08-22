<%-- 
    Document   : Profile
    Created on : Jan 4, 2021, 9:54:56 PM
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
        <title>MY PROFILE</title>
        <link rel="styleSheet" href="css/profileStyle.css">
        <link rel="styleSheet" href="css/LoginStyle.css">
        <style>
            body{
                font-family:Arial;
            }
            h4{
                background-color: #CCCCCC;
                display: inline;
            }
            h1{
                background-color: #F1F1F1;
                text-align: center;
                margin-top: 20px;
            }
            h2{
                background-color: #F1F1F1;
                text-align: left;
                margin-top: 20px;
            }

            div{
                width:50%;
                height:50%;
                padding: 20px;
                background-color: #F1F1F1;
                margin-left:23%;
                margin-top: 5%;
            }
            button , a{
                color:#222222;
                background-color: #CCCCCC;
                padding: 5px;
                margin-top: 10px;
            }
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {
                background-color: #dddddd;
            }
            .btn{
                background-color: #F1F1F1;
                text-align: center;
            }
            hr.line1{
                border-top: 1px solid #8c8b8b;
            }

        </style>
    </head>
    <body>
        <%

            String id = (String) session.getAttribute("username");
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3307/pyramids.com?useSSL=false";
            String user = "root";
            String password = "root";
            Connection conn = null;

            conn = (Connection) DriverManager.getConnection(url, user, password);

            String query = "SELECT * FROM client WHERE userName = '" + id + "'";

            Statement st = (Statement) conn.createStatement();

            ResultSet rs_peronal = st.executeQuery(query);

            query = "SELECT * FROM reservation WHERE userName = '" + id + "'";
            Statement st2 = (Statement) conn.createStatement();
            ResultSet rs_reservation = st2.executeQuery(query);


        %>
        <ul class="menu">
            <li> <a href="index.jsp"> <strong>PYRAMIDS.COM</strong></a></li>
        </ul>
        <h1>PROFILE</h1>

        <hr class="line1">

        <div>
            <h2>PERSONAL INFORMATION</h2>
            <hr class="line1">

            <% while (rs_peronal.next()) {%>
            <h4>First name: </h4><%= rs_peronal.getString("fname")%><br><br>
            <h4>Last name: </h4><%= rs_peronal.getString("lname")%><br><br>
            <h4>Account balance: </h4><%= rs_peronal.getString("balance") + "$"%><br><br>
            <h4>Personal phone:</h4> <%= rs_peronal.getString("phone")%><br><br>
            <h4>Username:</h4> <%= rs_peronal.getString("userName")%><br><br>
            <h4>Personal Email:</h4> <%= rs_peronal.getString("email")%><br><br>
            <h4>Account password:</h4> <%= rs_peronal.getString("password")%><br><br>
            <button type=“button”><a href='update-form.jsp?username=" <%= rs_peronal.getString("userName")%> "'>Update Personal Data</a></button>
            <%}%>
        </div>
        <hr class="line1">

        <div>
            <h2>RESERVATION</h2>
            <hr class="line1">

            <table>
                <tr>
                    <th>Room Number</th>
                    <th>Check in</th>
                    <th>Check out</th>
                    <th>Action</th>
                </tr>
                <% while (rs_reservation.next()) {%>
                <tr>
                    <td><%= rs_reservation.getInt("roomId")%></td>
                    <td><%= rs_reservation.getString("checkInDate")%></td>
                    <td><%= rs_reservation.getString("checkOutDate")%></td>
                    <td class="btn"><button type=“button”><a href='cancelReservation.jsp?roomid=" <%= rs_reservation.getInt("roomId")%> "'>Cancel</a></button></td>
                </tr>
                <%}%>
            </table>

        </div>
    </body>
</html>
