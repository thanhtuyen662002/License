package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import data.user.UserDTO;

public final class admin_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Admin Page</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        ");

            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.html");
                return;
            }
            String search = request.getParameter("search");
            if (search != null) {
                search = "";
            }
//            if(user==null){
//                user=new UserDTO();
//            }
        
      out.write("\r\n");
      out.write("        Welcome: <h1>");
      out.print( loginUser.getFullName());
      out.write("</h1>\r\n");
      out.write("        <a href=\"MainController?action=Logout\"></a> \r\n");
      out.write("        <form action=\"MainController\">\r\n");
      out.write("            <input type=\"submit\" name=\"action\" value=\"Logout\"/>\r\n");
      out.write("        </form>\r\n");
      out.write("        <form action=\"MainController\">\r\n");
      out.write("            Search<input type=\"text\" name=\"search\" value=\"\"");
      out.print( request.getParameter("search"));
      out.write("/>\r\n");
      out.write("            <input type=\"submit\" name=\"action\" value=\"Search\"/>\r\n");
      out.write("        </form>\r\n");
      out.write("        ");

            List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
            if (listUser != null) {
                if (listUser.size() > 0) {
        
      out.write("\r\n");
      out.write("        <table border=\"1\">\r\n");
      out.write("            <thead>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <th>No</th>\r\n");
      out.write("                    <th>User ID</th>\r\n");
      out.write("                    <th>Full Name</th>\r\n");
      out.write("                    <th>Role ID</th>\r\n");
      out.write("                    <th>Password</th>\r\n");
      out.write("                    <th>Delete</th>\r\n");
      out.write("                    <th>Update</th>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </thead>\r\n");
      out.write("            <tbody>\r\n");
      out.write("                ");

                    int count = 0;
                    for (UserDTO user : listUser) {
                
      out.write("\r\n");
      out.write("            <form action=\"MainController\" method=\"POST\">               \r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>");
      out.print( ++count);
      out.write("</td>\r\n");
      out.write("                    <td>\r\n");
      out.write("                        <input type=\"text\" name=\"userID\" value=\"");
      out.print( user.getUserID());
      out.write("\" readonly=\"\"/>\r\n");
      out.write("                    </td>\r\n");
      out.write("                    <td>\r\n");
      out.write("                        <input type=\"text\" name=\"fullName\" value=\"");
      out.print( user.getFullName());
      out.write("\" required=\"\"/>\r\n");
      out.write("                    </td>\r\n");
      out.write("                    <td>\r\n");
      out.write("                        <input type=\"text\" name=\"roleID\" value=\"");
      out.print( user.getRoleID());
      out.write("\" required=\"\"/>\r\n");
      out.write("                    </td>\r\n");
      out.write("                    <td>");
      out.print( user.getPassword());
      out.write("</td>\r\n");
      out.write("                    <!--Delete o day ne-->\r\n");
      out.write("                    <td>\r\n");
      out.write("                        <a href=\"MainController?userID=");
      out.print( user.getUserID());
      out.write("&action=Delete&search=");
      out.print( search);
      out.write("\">Delete</a>\r\n");
      out.write("                    </td>\r\n");
      out.write("                    <!--Update o day ne-->\r\n");
      out.write("                    <td>\r\n");
      out.write("                        <input type=\"submit\" name=\"action\" value=\"Update\"/>\r\n");
      out.write("                        <input type=\"hidden\" name=\"search\" value=\"");
      out.print( search);
      out.write("\"/>\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </form>\r\n");
      out.write("\r\n");
      out.write("            ");

                }
            
      out.write("\r\n");
      out.write("        </tbody>\r\n");
      out.write("    </table>\r\n");
      out.write("    ");

        String error = (String) request.getAttribute("ERROR");
        if (error == null) {
            error = "";
        }
    
      out.write("\r\n");
      out.write("    ");
      out.print( error);
      out.write("\r\n");
      out.write("    ");

            }
        }
    
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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
