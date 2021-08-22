/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ahmed
 */
@WebServlet(urlPatterns = {"/checkin"})
public class checkin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     *
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String userName = request.getParameter("username");
        PrintWriter out = response.getWriter();

        java.sql.Connection con;
        try {

            Class.forName("com.mysql.jdbc.Driver");
           String url = "jdbc:mysql://localhost:3307/pyramids.com?useSSL=false";
                    String user = "root";
                    String password = "root";
            Statement stat = null;
            con = DriverManager.getConnection(url, user, password);
            stat = con.createStatement();
            ResultSet result = stat.executeQuery("Select clientin from reservation WHERE username" + "='" + userName + "';");
            if (result.next() == false) {
                out.println("<meta http-equiv='refresh' content='3;URL=admin.html'>");
                out.println("<h1 style='color:black;'>Client Has No Reservation!</h1>");
            } else {

                int clientin = result.getInt("clientin");
                if (clientin == 1) {
                    out.println("<meta http-equiv='refresh' content='3;URL=admin.html'>");
                    out.println("<h1 style='color:black;'>Client Already In!</h1>");
                } else {
                    String update = "UPDATE reservation SET clientin='1' WHERE username" + "='" + userName + "';";
                    stat.executeUpdate(update);
                    out.println("<meta http-equiv='refresh' content='3;URL=admin.html'>");
                    out.println("<h1 style='color:black;'>Done!</h1>");
                }
            }
        } catch (SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     *
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(checkin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(checkin.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(checkin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(checkin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
