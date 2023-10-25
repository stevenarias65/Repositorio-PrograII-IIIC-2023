<%-- 
    Document   : updateUser
    Created on : Oct 22, 2023, 12:28:33 PM
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
            int txtId = Integer.parseInt(request.getParameter("idUsuarios"));
            String txtUserName = request.getParameter("UserName");
            String txtName = request.getParameter("name");
            int txtAge = Integer.parseInt(request.getParameter("age"));
            String txtEmail = request.getParameter("email");
            String txtGender = request.getParameter("gender");
        %>

        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/Usuarios_Sistema", "root", "123456789");
            Statement statement = connection.createStatement();

            String sql = "update Usuarios set name = '" + txtName + 
                         "', userName = '" + txtUserName + 
                         "', email = '" + txtEmail + 
                         "', age = " + txtAge + 
                         ", gender = '" + txtGender + "'" +
                         " where idUsuarios = " + txtId;

            statement.executeUpdate(sql);

            out.println("<script type='text/javascript'>alert('User updated');</script>");

            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            rd.include(request, response);
        %>
    </body>
</html>
