<%-- 
    Document   : load-hotel
    Created on : Jan 5, 2021, 5:33:33 PM
    Author     : dell
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel</title>
        <link rel="stylesheet" href="css/load-hotel.css">
    </head>
    <body>

        <!--Our Room start-->
        <div class="our-room text-center ptb-80 white-bg">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-title">
                            <h2>Our <span>Hotels</span></h2>
                          
                        </div>
                    </div>
                </div>
                <div class="our-room-show">
                    <div class="row">
                        <div class="carousel-list">

                            <%
                                Connection con = null;
                                Blob image = null;
                                byte[] imgData = null;
                                PreparedStatement psmnt = null;

                                InputStream sImage;
                                try {

                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = DriverManager.getConnection("jdbc:mysql://localhost:3307/pyramids.com", "root", "root");

                                } catch (ClassNotFoundException ex) {

                                }
                                PreparedStatement preparedStatement = con.prepareStatement("select * from hotel");

                                ResultSet rs = preparedStatement.executeQuery();
                                while (rs.next()) {
                            %>
                            <div class="col-md-4">
                                <div class="single-room">
                                    <div class="room-img">
                                        <% image = rs.getBlob("image");
                                            byte[] imageBytes = image.getBytes(1, (int) image.length());
                                            String encodedImage = Base64.getEncoder().encodeToString(imageBytes);
                                            String image2 = "data:image/jpg;base64," + encodedImage;
                                            out.print("<img src=" + image2 + ">");%>
                                    </div>
                                    <div class="room-desc">
                                        <div class="room-name">
                                            <h3><%=rs.getString("hotelName")%></h3>
                                        </div>
                                        <div class="room-rent">
                                            <h5>Location <span><%=rs.getString("location")%></span></h5>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <% }%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Our room end-->
       

    </body>
</html>
