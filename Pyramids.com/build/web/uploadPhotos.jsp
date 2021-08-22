<%-- 
    Document   : uploadPhotos
    Created on : Jan 14, 2021, 6:29:17 PM
    Author     : Ahmed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Photos</title>
        <style>
            #myFile{
                width: 60%;
                background-color: white;
            }
            .upload{
                border-radius: 4px;
                width:15%;
                margin-left: 80px;
            }
            form{

                margin: 100px 200px 100px 400px;
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
        <form action="uploadPhoto">
            <label> Enter Hotel ID:</label><br><br>
            <input type="text" name="hotelId" placeholder="Enter Hotel Id"><br><br>
            <label> Upload Hotel Photo</label><br><br>
            <input type="file" id="myFile" name="photo"><br><br>
            <input type="submit" value="Upload" class="upload" >
        </form>
    </body>
</html>
