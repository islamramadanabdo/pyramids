<%-- 
    Document   : updateHotelInformation
    Created on : Jan 12, 2021, 12:40:44 AM
    Author     : Ahmed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Hotel Information</title>
        <style>
            .update{
                border-radius: 4px;
                width: 22%;
                margin-left: 0px;
            }
            .label{
                width: 50%;
                box-sizing: 20px;
            }
            form{
                margin:70px 200px 10px 450px;
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
        <form action="updateHotelInformation">
            <label class="label">Enter Required Hotel ID: </label><br>
            <input type="text" name="hotelid" required="true" placeholder="Enter Hotel Id"><br><br>
            <label>Enter Hotel Name: </label><br>

            <input type="text" name="hotelname" required="true" placeholder="Enter Hotel Name"><br><br>
            <label>Enter Hotel Location: </label><br>
            <input type="text" name="hotellocation" required="true" placeholder="Enter Hotel Location"><br><br>

            <label>Enter Hotel Email: </label><br>
            <input type="text" name="hotelemail" required="true" placeholder="Enter Hotel Email"><br><br>
            <label>Enter Hotel Phone: </label><br>
            <input type="text" name="hotelphone" required="true" placeholder="Enter Hotel Phone"><br><br>
            <input type="submit" value="UPDATE" class="update">
        </form>
    </body>
</html>
