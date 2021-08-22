<%-- 
    Document   : Search For Client
    Created on : Jan 11, 2021, 7:35:19 PM
    Author     : Ahmed
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
        <title>Client Page</title>
        <style>
            body{

                background-color: #CCCCCC;
            }
            .topnav {
                margin: -10px -10px -10px -10px;
                background-color: #999999;
                overflow: hidden;
            }

            /* Style the links inside the navigation bar */
            .topnav a {
                float: left;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
            }

            /* Change the color of links on hover */
            .topnav a:hover {
                background-color: #ddd;
                color: black;
            }

            /* Add a color to the active/current link */
            .topnav a.active {
                background-color: #000000;
                color: white;
            }
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

            .sectionPrfole{
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


        <div class="topnav">
            <a class="active" href="admin.html">PYRAMIDS.COM</a>
            <a href="checkin.jsp">Check Client In</a>
            <a href="ckeckout.jsp">Check Client Out</a>
            <a href="ViewReservationList.jsp">View Reservation List</a>
            <a href="ReservationHistory.html">Reservation history</a>
            <a href="SearchForClient.html">Search For Client</a>
            <a href="cancelReservation.html">Cancel Reservation</a>
            <a href="confirmReservationPayment.jsp">Confirm Reservation Payment</a>
            <a href="updateHotelInformation.jsp">Update Hotel Information</a>
            <a href="uploadPhotos.jsp"> Upload Hotel Photos</a>
            <a href="uploadPhotos.jsp"> Update Hotel Photos</a>
            <a href="addroom.jsp"> Add Room</a>
            <a href="updateroom.jsp"> Update Room</a>
            <a href="viewHotelRating.jsp">View Hotel Rating</a>
            <a class="active" href="logout.jsp">Log Out</a>
        </div>

        <%

            String username = request.getParameter("username");
            Class.forName("com.mysql.jdbc.Driver");
           String url = "jdbc:mysql://localhost:3307/pyramids.com?useSSL=false";
                    String user = "root";
                    String password = "root";
            Connection conn = null;

            conn = (Connection) DriverManager.getConnection(url, user, password);

            String query = "SELECT * FROM client WHERE userName = '" + username + "'";

            Statement st = (Statement) conn.createStatement();

            ResultSet rs_peronal = st.executeQuery(query);

            query = "SELECT * FROM reservation WHERE userName = '" + username + "'";
            Statement st2 = (Statement) conn.createStatement();
            ResultSet rs_reservation = st2.executeQuery(query);


        %>

        <h1>PROFILE</h1>

        <hr class="line1">

        <div class='sectionPrfole'>
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
            <%}%>
        </div>
        <hr class="line1">

        <div class='sectionPrfole'>
            <h2>RESERVATION</h2>
            <hr class="line1">

            <table>
                <tr>
                    <th>Room Number</th>
                    <th>Check in</th>
                    <th>Check out</th>
                </tr>
                <% while (rs_reservation.next()) {%>
                <tr>
                    <td><%= rs_reservation.getInt("roomId")%></td>
                    <td><%= rs_reservation.getString("checkInDate")%></td>
                    <td><%= rs_reservation.getString("checkOutDate")%></td>
                </tr>
                <%}%>
            </table>

        </div>

    </body>
</html>
