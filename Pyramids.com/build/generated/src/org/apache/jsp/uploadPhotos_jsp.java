package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class uploadPhotos_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Upload Photos</title>\n");
      out.write("        <style>\n");
      out.write("            #myFile{\n");
      out.write("                width: 60%;\n");
      out.write("                background-color: white;\n");
      out.write("            }\n");
      out.write("            .upload{\n");
      out.write("                border-radius: 4px;\n");
      out.write("                width:15%;\n");
      out.write("                margin-left: 80px;\n");
      out.write("            }\n");
      out.write("            form{\n");
      out.write("\n");
      out.write("                margin: 100px 200px 100px 400px;\n");
      out.write("            }\n");
      out.write("            body{\n");
      out.write("\n");
      out.write("                background-color: #ddd;\n");
      out.write("            }\n");
      out.write("            .topnav {\n");
      out.write("                margin: -10px -10px -10px -10px;\n");
      out.write("                background-color: #999999;\n");
      out.write("                overflow: hidden;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Style the links inside the navigation bar */\n");
      out.write("            .topnav a {\n");
      out.write("                float: left;\n");
      out.write("                color: #f2f2f2;\n");
      out.write("                text-align: center;\n");
      out.write("                padding: 14px 16px;\n");
      out.write("                text-decoration: none;\n");
      out.write("                font-size: 17px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Change the color of links on hover */\n");
      out.write("            .topnav a:hover {\n");
      out.write("                background-color: #ddd;\n");
      out.write("                color: black;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Add a color to the active/current link */\n");
      out.write("            .topnav a.active {\n");
      out.write("                background-color: #000000;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"topnav\">\n");
      out.write("            <a class=\"active\" href=\"admin.html\">PYRAMIDS.COM</a>\n");
      out.write("            <a href=\"checkin.jsp\">Check Client In</a>\n");
      out.write("            <a href=\"ckeckout.jsp\">Check Client Out</a>\n");
      out.write("            <a href=\"ViewReservationList.jsp\">View Reservation List</a>\n");
      out.write("            <a href=\"ReservationHistory.html\">Reservation history</a>\n");
      out.write("            <a href=\"SearchForClient.html\">Search For Client</a>\n");
      out.write("            <a href=\"cancelReservation.html\">Cancel Reservation</a>\n");
      out.write("            <a href=\"confirmReservationPayment.jsp\">Confirm Reservation Payment</a>\n");
      out.write("            <a href=\"updateHotelInformation.jsp\">Update Hotel Information</a>\n");
      out.write("            <a href=\"uploadPhotos.jsp\"> Upload Hotel Photos</a>\n");
      out.write("            <a href=\"uploadPhotos.jsp\"> Update Hotel Photos</a>\n");
      out.write("            <a href=\"addroom.jsp\"> Add Room</a>\n");
      out.write("            <a href=\"updateroom.jsp\"> Update Room</a>\n");
      out.write("            <a href=\"viewHotelRating.jsp\">View Hotel Rating</a>\n");
      out.write("            <a class=\"active\" href=\"logout.jsp\">Log Out</a>\n");
      out.write("        </div>\n");
      out.write("        <form action=\"uploadPhoto\">\n");
      out.write("            <label> Enter Hotel ID:</label><br><br>\n");
      out.write("            <input type=\"text\" name=\"hotelId\" placeholder=\"Enter Hotel Id\"><br><br>\n");
      out.write("            <label> Upload Hotel Photo</label><br><br>\n");
      out.write("            <input type=\"file\" id=\"myFile\" name=\"photo\"><br><br>\n");
      out.write("            <input type=\"submit\" value=\"Upload\" class=\"upload\" >\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
