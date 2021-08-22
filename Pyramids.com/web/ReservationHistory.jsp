<%-- 
    Document   : newjsp
    Created on : Jan 11, 2021, 5:13:46 PM
    Author     : Ahmed
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservation History List</title>


        <style>
            h1{
                margin-left: 250px;
            }
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
            .form{

                margin: 50px 100px 100px 250px;
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
        <div class="form">
            <h1>Reservation History List</h1>
            <%
                try {
                    String start = request.getParameter("start");
                    String end = request.getParameter("end");
                    int startyear = Integer.parseInt(start.substring(0, 3));
                    int startmonth = Integer.parseInt(start.substring(5, 6));
                    int startday = Integer.parseInt(start.substring(8));
                    int endyear = Integer.parseInt(end.substring(0, 3));
                    int endmonth = Integer.parseInt(end.substring(5, 6));
                    int endday = Integer.parseInt(end.substring(8));
                    Class.forName("com.mysql.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3307/pyramids.com?useSSL=false";
                    String user = "root";
                    String password = "root";
                    Connection con = DriverManager.getConnection(url, user, password);
                    Statement stat = con.createStatement();
                    ResultSet result = stat.executeQuery("SELECT *  FROM reservation where checkInDate>='" + start + "' and checkInDate<='" + end + "';");
                    boolean flag = false;
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
                        flag = true;
                %>
                <tr>
                    <td>
                        <%
                            out.println(result.getString("username"));

                        %>
                    </td>
                    <td>
                        <%                 out.println(result.getInt("roomId"));

                        %>
                    </td>

                    <%            Statement stat3 = con.createStatement();
                        ResultSet result3 = stat3.executeQuery("select hotelId from room where roomId=" + "'" + result.getInt("roomId") + "';");
                        result3.next();
                        Statement stat2 = con.createStatement();
                        ResultSet result2 = stat2.executeQuery("select hotelName from hotel where hotelId=" + "'" + result3.getInt("hotelId") + "';");
                        result2.next();

                    %>
                    <td>
                        <%                 out.println(result2.getString("hotelName"));

                        %>
                    </td>         </tr>
                    <%                }
                            if (flag == false) {
                                out.println("No Reservations In This Period");

                            }

                        } catch (SQLException ex) {
                            out.println(ex);
                        }
                    %>
            </table>
        </div>
    </body>
</html>
