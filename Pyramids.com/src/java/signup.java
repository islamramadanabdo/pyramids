/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
@WebServlet(urlPatterns = {"/signup"})
public class signup extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3307/pyramids.com?useSSL=false";
                    String user = "root";
                    String password = "root";
            Connection conn = null;

            conn = (Connection) DriverManager.getConnection(url, user, password);

            String fName = request.getParameter("fName");
            String lName = request.getParameter("lName");
            String phone = request.getParameter("phone");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            out.println(email);
            int balance = 10000;

            final String hash = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*_=+-/";
            final int len = 11;
            String pass = "";

            for (int i = 0; i < len; i++) {
                int index = (int) (Math.random() * (hash.length() - 10 + 1) + 0);
                if(index < len - 1)
                    pass += hash.charAt(index);

            }
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
            final String PIRAMIDS = "ahmedmohamed3bd@gmail.com";
            final String PIRAMIDS_password = "Ahmed01222818754";

            try {
                Session session = Session.getInstance(props,
                        new Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(PIRAMIDS, PIRAMIDS_password);
                    }
                });

                // -- Create a new message --
                Message msg = new MimeMessage(session);
                // -- Set the FROM and TO fields --
                msg.setFrom(new InternetAddress(PIRAMIDS));
                msg.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(email, false));
                msg.setSubject("PYRAMIDS.COM Team Mail >> [Password]");
                msg.setText("Welcome TO PYRAMIDS.COM.\n password: '" + pass + "'. \n Thnsks for using our service. \n\n\n PYRAMIDS.COM Team Mail");
                msg.setSentDate(new Date());
                Transport.send(msg);
                out.println("Message sent.");
                 String query = "INSERT INTO client (userName, fname , lname , balance , email , password , phone) VALUES ( '" + username + "','" + fName + "','" + lName + "', '" + balance + "','" + email + "','" + pass + "','" + phone + "')";
            Statement st = (Statement) conn.createStatement();
            st.executeUpdate(query);
                response.sendRedirect("Login.html");

            } catch (MessagingException e) {
                System.out.println("Message falid.");
            }
           
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
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
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
