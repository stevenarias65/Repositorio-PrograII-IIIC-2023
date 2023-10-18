<%-- 
    Document   : index
    Created on : Oct 9, 2023, 8:17:32 PM
    Author     : steven
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <title>Users</title>
    </head>
    <body> 
        <%
            Connection con = null;
            ResultSet resultset = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/Prueba", "root", "123456789");
                Statement statement = con.createStatement();
                resultset = statement.executeQuery("select * from usuarios");                                                           
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %>   
        
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Navbar</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="index.html">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="users.jsp">Users</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="search.jsp">Search</a>
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
                            <input type="text" class="form-control" name="txtId" placeholder="Id">
                            <label>Id</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name="txtName" placeholder="Name">
                            <label>Name</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name="txtLastName" placeholder="Last Name">
                            <label>Last Name</label>
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
                        <th scope="col">Last Name</th>
                       
                    </tr>
                </thead>
                <tbody>
                    <% while (resultset.next()) {%>
                    <tr onclick="window.location.href='loadUser.jsp?Id=<%=resultset.getInt("id")%>'">
                        <th scope="row"> <%=resultset.getInt("id")%> </th>
                        <td><%=resultset.getString("nombre")%></td>
                        <td><%=resultset.getString("apellidos")%></td>
                                                                  
                    </tr>                    
                    <%}%>
                </tbody>
            </table>   
        </div>
    </body>
</html>
