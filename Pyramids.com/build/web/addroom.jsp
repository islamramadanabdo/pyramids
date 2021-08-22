<%-- 
    Document   : addroom
    Created on : Jan 12, 2021, 5:22:48 PM
    Author     : Ahmed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Room</title>
        <style>
            .add{
                border-radius: 4px;
                width: 15%;
            }
            form{
                margin-top: 60px;
                margin-left: 400px;
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


        <form action="addroom">
            <p>Enter Hotel Id To Add Room:</p>
            <input type="text" name="hotelId" required="true" placeholder="Enter Hotel Id">
            <p>Enter Room Adults Number:</p>
            <input type="text" name="adultsNum" required="true" placeholder="Room Adults Number">
            <p>Enter Room Children Number:</p>
            <input type="text" name="childrenNum" required="true" placeholder="Room Children Number">
            <p>Enter Room Price:</p>
            <input type="text" name="price" required="true" placeholder="Enter Room Price"><br><br>
            <p>Upload Room Photo:</p>
            <input type="file" id="myFile" name="photo"><br><br>
            <input type="submit" value="Add Room" class="add">

        </form>
    </body>
</html>
