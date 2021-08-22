/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
 * @author Ahmed
 */
@WebServlet(urlPatterns = {"/addroom"})
public class addroom extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            int hotelId = Integer.parseInt(request.getParameter("hotelId"));
            int adultsNum = Integer.parseInt(request.getParameter("adultsNum"));
            int childrenNum = Integer.parseInt(request.getParameter("childrenNum"));
            float price = Float.parseFloat(request.getParameter("price"));
            Class.forName("com.mysql.jdbc.Driver");
           String url = "jdbc:mysql://localhost:3307/pyramids.com?useSSL=false";
                    String user = "root";
                    String password = "root";
            Connection con = DriverManager.getConnection(url, user, password);
            PreparedStatement pstmt = null;
            String myloc = request.getParameter("photo");
            FileInputStream fis = null;

            File image = new File(myloc);
            pstmt = con.prepareStatement("insert into hotel_db.room (adultsNum,childrenNum,hotelId,price,image)values('" + adultsNum + "','" + childrenNum + "','" + hotelId + "','" + price + "',?);");
            fis = new FileInputStream(image);
            pstmt.setBinaryStream(1, (InputStream) fis, (int) (image.length()));
            int count = pstmt.executeUpdate();

            if (count > 0) {
                out.println("<meta http-equiv='refresh' content='3;URL=admin.html'>");
                out.println("<h1 style='color:black;'>Done!</h1>");
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(addroom.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(addroom.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(addroom.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(addroom.class.getName()).log(Level.SEVERE, null, ex);
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
