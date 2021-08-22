<%-- 
    Document   : cancelReservation
    Created on : Jan 12, 2021, 3:55:57 PM
    Author     : dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel Reservation</title>
    </head>
    <body>
        <%

            Class.forName("com.mysql.jdbc.Driver");
           String url = "jdbc:mysql://localhost:3307/pyramids.com?useSSL=false";
                    String user = "root";
                    String password = "root";
            Connection conn = null;
            conn = (Connection) DriverManager.getConnection(url, user, password);

            String roomIdWithGar = request.getParameter("roomid");
            int roomId = Integer.parseInt(roomIdWithGar.substring(2, roomIdWithGar.length() - 2));

            Statement st = (Statement) conn.createStatement();

            String query = "SELECT * FROM reservation WHERE roomId = '" + roomId + "'";
            ResultSet rs = st.executeQuery(query);
            rs.next();
            String username = rs.getString("username");

            query = "SELECT * FROM client WHERE userName = '" + username + "'";
            rs = st.executeQuery(query);
            rs.next();
            String email = rs.getString("email");

            String quert_cancel = "DELETE FROM reservation WHERE roomId = '" + roomId + "' ";
            st.executeUpdate(quert_cancel);

            final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
            // Get a Properties object
            Properties props = System.getProperties();
            props.setProperty("mail.smtp.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
            props.setProperty("mail.smtp.socketFactory.fallback", "false");
            props.setProperty("mail.smtp.port", "465");
            props.setProperty("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.auth", "true");
            props.put("mail.debug", "true");
            props.put("mail.store.protocol", "pop3");
            props.put("mail.transport.protocol", "smtp");
            final String PIRAMIDS = "aatya8000@gmail.com";
            final String PIRAMIDS_password = "Eagle01113986309";

            try {
                Session new_session = Session.getInstance(props,
                        new Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(PIRAMIDS, PIRAMIDS_password);
                    }
                });

                // -- Create a new message --
                Message msg = new MimeMessage(new_session);

                // -- Set the FROM and TO fields --
                msg.setFrom(new InternetAddress(PIRAMIDS));
                msg.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(email, false));
                msg.setSubject("PYRAMIDS.COM Team Mail >> [Reservation Cancelation]");
                msg.setText("Client: '" + username + "' make Reservation Cancelation for room '" + roomId + "'th \n\n\n PYRAMIDS.COM Team Mail");
                msg.setSentDate(new Date());
                Transport.send(msg);
                out.println("Message sent.");
                response.sendRedirect("Profile.jsp");

            } catch (MessagingException e) {
                System.out.println("Message falid.");
            }

        %>
    </body>
</html>
