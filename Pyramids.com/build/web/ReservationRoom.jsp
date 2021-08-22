<%-- 
    Document   : ReservationRoom
    Created on : Jan 3, 2021, 6:52:17 PM
    Author     : dell
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservation Room</title>
    </head>

    <body>
        <%

            Class.forName("com.mysql.jdbc.Driver");
           String url = "jdbc:mysql://localhost:3307/pyramids.com?useSSL=false";
                    String user = "root";
                    String password = "root";
            Connection conn = null;

            conn = (Connection) DriverManager.getConnection(url, user, password);

            String roomId = request.getParameter("roomId");
            String hotelId = request.getParameter("hotelId");
            
            String checkin = request.getParameter("Checkin");
            String checkout = request.getParameter("Checkout");

            int adults = Integer.parseInt(request.getParameter("adults"));
            int children = Integer.parseInt(request.getParameter("Children"));

            String username = session.getAttribute("username").toString();

            String query_hotel = "SELECT * FROM hotel WHERE hotelId = '" + hotelId + "'";
            Statement st1 = (Statement) conn.createStatement();
            ResultSet rs1 = st1.executeQuery(query_hotel);
            rs1.next();
            String hotelname = rs1.getString("hotelName");
            Statement st = (Statement) conn.createStatement();
            String query = "SELECT * FROM room WHERE roomId = '" + roomId + "' AND adultsNum = '" + adults + "' AND childrenNum = '" + children + "'";
            ResultSet rs = st.executeQuery(query);

            String query2 = "SELECT * FROM reservation";
            Statement st2 = (Statement) conn.createStatement();
            ResultSet rs2 = st2.executeQuery(query2);
            boolean empty = true;
            while (rs2.next()) {
                empty = false;
            }

            if (rs.next() == true) {
                query = "SELECT * FROM reservation WHERE roomId = '" + roomId + "'  AND (checkInDate > '" + checkout + "' OR checkOutDate < '" + checkin + "')";
                rs = st.executeQuery(query);
                if (rs.next() == true) {
                    query = "INSERT INTO reservation (roomId , username , checkInDate , checkOutDate)  VALUES('" + roomId + "', '" + username + "' , '" + checkin + "' , '" + checkout + "')";
                    st.executeUpdate(query);
                    out.println("Reservation will confirm within 1 hour.");

                } else if (empty == true) {
                    query = "INSERT INTO reservation (roomId , username , checkInDate , checkOutDate)  VALUES('" + roomId + "', '" + username + "' , '" + checkin + "' , '" + checkout + "')";
                    st.executeUpdate(query);
                    out.println("Reservation will confirm within 1 hour.");
                } else {
                    out.println("Room not available now");
                }
            } else {
                out.println("required inforamtion Room not available now");
            }
        %>

    </body>

</html>
