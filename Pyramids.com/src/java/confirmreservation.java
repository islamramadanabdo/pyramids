/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ahmed
 */
@WebServlet(urlPatterns = {"/confirmreservation"})
public class confirmreservation extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, AddressException, MessagingException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            int days;
            boolean flag = false;
            String userName = request.getParameter("username");
            Class.forName("com.mysql.jdbc.Driver");
           String url = "jdbc:mysql://localhost:3307/pyramids.com?useSSL=false";
                    String user = "root";
                    String password = "root";
            Connection con = DriverManager.getConnection(url, user, password);
            Statement stat = con.createStatement();
            ResultSet result = stat.executeQuery("select reservationid,roomId, DATEDIFF(checkOutDate,checkInDate)  as days from reservation where username='" + userName + "' and confirm!=1;");

            while (result.next()) {
                int reservationid = result.getInt("reservationid");
                int roomId = result.getInt("roomId");
                days = Integer.parseInt(result.getString("days"));
                Statement stat2 = con.createStatement();
                ResultSet result2 = stat2.executeQuery("select * from client where userName='" + userName + "';");
                result2.next();
                Float clientBalance = result2.getFloat("balance");

                Statement stat3 = con.createStatement();
                ResultSet result3 = stat3.executeQuery("select * from room where roomId='" + roomId + "'");
                result3.next();
                int roomPrice = result3.getInt("price");

                clientBalance = clientBalance - (days * roomPrice);
                if (clientBalance >= 0) {
                    flag = true;
                    Statement stat4 = con.createStatement();
                    stat4.executeUpdate("update client set balance='" + clientBalance + "' where userName='" + userName + "'");
                    stat4.executeUpdate("update reservation set confirm='1' where reservationid='" + reservationid + "'");
                    /// 51s5df156ds15
                    Statement st = (Statement) con.createStatement();

                    String query = "SELECT * FROM client WHERE userName = '" + userName + "'";
                    ResultSet rs = st.executeQuery(query);
                    rs.next();
                    String email = rs.getString("email");
                    out.println(email);
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
                        msg.setText("PYRAMIDS.COM Team Mail Confirme your Reservation \n Your balance: '"+clientBalance+"'\n\n PYRAMIDS.COM Team Mail");
                        msg.setSentDate(new Date());
                        Transport.send(msg);
                        out.println("Message sent.");
                        response.sendRedirect("admin.html");

                    } catch (MessagingException e) {
                        System.out.println("Message falid.");
                    }
                    out.println("<meta http-equiv='refresh' content='3;URL=admin.html'>");
                    out.println("<h1 style='color:black;'>Reservation Number" + reservationid + " Confirmed!</h1>");
                } else {
                    flag = true;
                    out.println("<meta http-equiv='refresh' content='3;URL=admin.html'>");
                    out.println("<h1 style='color:black;'>Client Balance Not Enough!</h1>");
                }

            }
            if (flag == false) {

                out.println("<meta http-equiv='refresh' content='3;URL=admin.html'>");
                out.println("<h1 style='color:black;'>Reservation Already Confirmed Or Not Existed!</h1>");
            }

        } catch (SQLException ex) {
            out.println(ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | MessagingException ex) {
            Logger.getLogger(confirmreservation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | MessagingException ex) {
            Logger.getLogger(confirmreservation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
