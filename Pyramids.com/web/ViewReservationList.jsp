<%-- 
    Document   : ViewReservationList
    Created on : Jan 11, 2021, 3:23:59 AM
    Author     : Ahmed
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservation List</title> <style>

            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
                background-color: white;
            }

            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {
                background-color: #dddddd;
            }

            body{

                background-color: #ddd;
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
        <h1>Reservation List</h1>
        <%

            java.sql.Connection con;
            try {

                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3307/pyramids.com?useSSL=false";
                    String user = "root";
                    String password = "root";
                Statement stat = null;
                con = DriverManager.getConnection(url, user, password);
                stat = con.createStatement();
                ResultSet result = stat.executeQuery("Select * from reservation;");
        %>
        <table>
            <tr>
                <th>
                    Client Name
                </th>
                <th>
                    Room Number
                </th>
                <th>
                    Hotel Name
                </th>
            </tr>

            <%
                while (result.next()) {


            %> <tr> <td><%            out.println(result.getString("username"));
                    %>

                </td>  
                <td>
                    <%
                        out.println(result.getInt("roomId"));
                    %>
                </td>
                <%
                    Statement stat3 = con.createStatement();
                    ResultSet result3 = stat3.executeQuery("select hotelId from room where roomId=" + "'" + result.getInt("roomId") + "';");
                    result3.next();
                    Statement stat2 = con.createStatement();
                    ResultSet result2 = stat2.executeQuery("select hotelName from hotel where hotelId=" + "'" + result3.getInt("hotelId") + "';");
                    result2.next();
                %>
                <td>
                    <%
                        out.println(result2.getString("hotelName"));
                    %>
                </td></tr>
                <%
                    result3.close();
                    result2.close();
                %>

            <%
                    }
                    result.close();
                } catch (SQLException e) {
                    out.println("SQLException caught: " + e.getMessage());
                }

            %>
    </body>
</html>
