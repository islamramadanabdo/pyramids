package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>home</title>\n");
      out.write("        <style>\n");
      out.write("            .engine{\n");
      out.write("                padding:15px;\n");
      out.write("                height: 65px;\n");
      out.write("                margin-top: 80px;\n");
      out.write("                background: #CCCCCC;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("            input , select , button{\n");
      out.write("                padding:7px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "navbar.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("        <form action=\"resultofsearch.jsp\" class=\"engine\" method=\"post\">\n");
      out.write("            <label>Where you going:</label>\n");
      out.write("            <input type=\"text\" id=\"going\" name=\"going\">\n");
      out.write("            <label>Check in:</label>\n");
      out.write("            <input type=\"date\" id=\"Checkin\" name=\"Checkin\">\n");
      out.write("            <label>Check out:</label>\n");
      out.write("            <input type=\"date\" id=\"Checkout\" name=\"Checkout\">\n");
      out.write("\n");
      out.write("            <label>Adults: </label>\n");
      out.write("            <select name=\"adults\" id=\"adults\">\n");
      out.write("                <option value=\"1\">1</option>\n");
      out.write("                <option value=\"2\">2</option>\n");
      out.write("                <option value=\"3\">3</option>\n");
      out.write("                <option value=\"4\">4</option>\n");
      out.write("                <option value=\"5\">5</option>\n");
      out.write("                <option value=\"6\">6</option>\n");
      out.write("                <option value=\"7\">7</option>\n");
      out.write("                <option value=\"8\">8</option>\n");
      out.write("                <option value=\"9\">9</option>\n");
      out.write("                <option value=\"10\">10</option>\n");
      out.write("                <option value=\"11\">11</option>\n");
      out.write("            </select>\n");
      out.write("\n");
      out.write("            <label>Children: </label>\n");
      out.write("            <select name=\"Children\" id=\"Children\">\n");
      out.write("                <option value=\"0\">0</option>\n");
      out.write("                <option value=\"1\">1</option>\n");
      out.write("                <option value=\"2\">2</option>\n");
      out.write("                <option value=\"3\">3</option>\n");
      out.write("                <option value=\"4\">4</option>\n");
      out.write("                <option value=\"5\">5</option>\n");
      out.write("                <option value=\"6\">6</option>\n");
      out.write("                <option value=\"7\">7</option>\n");
      out.write("                <option value=\"8\">8</option>\n");
      out.write("                <option value=\"9\">9</option>\n");
      out.write("                <option value=\"10\">10</option>\n");
      out.write("                <option value=\"11\">11</option>\n");
      out.write("            </select>\n");
      out.write("\n");
      out.write("            <button type=\"submit\">Search</button>\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("       ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "load-hotel.jsp", out, false);
      out.write("\n");
      out.write("        \n");
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
