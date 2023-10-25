<%-- 
    Document   : index
    Created on : Oct 17, 2023, 8:06:03 PM
    Author     : steven
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"><!-- comment -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <title>Lista de Usuarios</title>
    </head>
    <body>

        <%
            Connection con = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/Usuarios_Sistema", "root", "123456789");
                Statement st = con.createStatement();
                rs = st.executeQuery("select * from Usuarios");

            } catch (Exception e) {
            }


        %>


        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Sistema de Usuarios</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">

                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Lista de Usuarios</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.jsp">Acerca de</a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>

        <div class="container" style="margin-top:2%">             
            <div class="card">
                <div class="card-header">
                    Create user
                </div>
                <div class="card-body">
                    <form action="insertUser.jsp">            
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name="userName" placeholder="userName">
                            <label>User Name</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name="Name" placeholder="Name">
                            <label>Name</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" name="Email" placeholder="Email">
                            <label>Email</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="number" class="form-control" name="Age" placeholder="Age">
                            <label>Age</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name="Gender" placeholder="Gender">
                            <label>Gender</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" name="Password" placeholder="Password">
                            <label>Password</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="number" class="form-control" name="IdRol" placeholder="IdRol">
                            <label>Id Rol</label>
                        </div>
                        <div class="form-floating mb-3">
                            <button type="submit" class="btn btn-primary">Save</button>                            
                        </div>                          
                    </form>                    
                </div>
            </div>          
            <hr />     


            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">email</th>
                        <th scope="col">Age</th>
                        <th scope="col">Gender</th>
                        <th scope="col">id Rol</th>
                    </tr>
                </thead>
                <tbody>

                    <% while (rs.next()) {%>
                    <tr onclick="window.location.href='loadUser.jsp?Id=<%=rs.getInt("idUsuarios")%>'">
                        <th scope="row"> <%=rs.getInt("idUsuarios")%> </th>
                        <td><%=rs.getString("userName")%></td>
                        <td><%=rs.getString("name")%></td>
                        <td><%=rs.getString("email")%></td>
                        <td><%=rs.getInt("age")%></td>
                        <td><%=rs.getString("gender")%></td>
                        <td><%=rs.getInt("idRoles")%></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>  
        </div>

    </body>
</html>
