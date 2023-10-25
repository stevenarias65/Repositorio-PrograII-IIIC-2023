<%-- 
    Document   : insertUser
    Created on : Oct 17, 2023, 8:22:27 PM
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
            String userName = request.getParameter("userName");
            String txtName = request.getParameter("Name");
            String txtEmail = request.getParameter("Email");
            int txtage = Integer.parseInt(request.getParameter("Age"));
            String txtgender = request.getParameter("Gender");
            int txtrole = Integer.parseInt(request.getParameter("IdRol"));
            String txtpassword = request.getParameter("Password");
        %>

        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/Usuarios_Sistema", "root", "123456789");
            Statement statement = connection.createStatement();
            Statement statement2 = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from Usuarios where email = '" + txtEmail + "'");

            if (resultSet.next()) {
                out.println("<script type='text/javascript'>alert('User already created');</script>");
            } else {
                String sql = "insert into Usuarios (userName, name, email, age, gender,password,IdRoles) "
                        + "values ('" + userName + "', '" + txtName + "', '"  + txtEmail + "', " + txtage + ", '" + txtgender + "', '" + txtpassword + "'," + txtrole + ")";

                statement2.executeUpdate(sql);

                out.println("<script type='text/javascript'>alert('User created');</script>");
            }

            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            rd.include(request, response);
        %>
    
    </body>
</html>
