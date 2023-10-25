<%-- 
    Document   : deleteUser
    Created on : Oct 22, 2023, 12:19:17 PM
    Author     : steven
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            int txtIdn = Integer.parseInt(request.getParameter("Id"));
        %>

        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/Usuarios_Sistema", "root", "123456789");
            Statement statement = connection.createStatement();

            String sql = "delete from Usuarios where idUsuarios = " + txtIdn;

            statement.executeUpdate(sql);

            out.println("<script type='text/javascript'>alert('User deleted');</script>");

            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            rd.include(request, response);
        %>
    </body>
</html>
