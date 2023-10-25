<%-- 
    Document   : loadUser
    Created on : Oct 22, 2023, 12:00:25 PM
    Author     : steven
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <title>Update user</title>
    </head>
    <body>
        <%
            int Id = Integer.parseInt(request.getParameter("Id"));
            Connection con = null;
            ResultSet resultset = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/Usuarios_Sistema", "root", "123456789");
                Statement statement = con.createStatement();
                resultset = statement.executeQuery("select * from Usuarios where idUsuarios=" + Id);
                resultset.next();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %> 
        <div class="container" style="margin-top:2%">
            <div class="card">
                <div class="card-header">
                    Update user
                </div>
                <div class="card-body">
                    <form action="updateUser.jsp">            
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getInt("idUsuarios")%>' type="text" class="form-control" name="idUsuarios" placeholder="Id" readonly>
                            <label>Id</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getString("UserName")%>' type="text" class="form-control" name="UserName" placeholder="Name">
                            <label>Name</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getString("name")%>' type="text" class="form-control" name="name" placeholder="Last Name">
                            <label>Last Name</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getString("email")%>' type="email" class="form-control" name="email" placeholder="Phone">
                            <label>Phone</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getInt("age")%>' type="number" class="form-control" name="age" placeholder="Email">
                            <label>Email</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getString("gender")%>' type="text" class="form-control" name="gender" placeholder="Address">
                            <label>Address</label>
                        </div>
                                <input value='<%=resultset.getInt("idRoles")%>' type="text" class="form-control" name="idRoles" placeholder="Address">
                            <label>Address</label>
                        </div>
                        <div class="form-floating mb-3">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#confirmUpdateModal">Update</button>
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">Delete</button>
                        </div>                          

                        <!-- Modal 1 -->
                        <div class="modal fade" id="confirmDeleteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Delete user</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        ¿Do you really want to delete <%=resultset.getString("name")%>?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                        <a class="btn btn-danger" href='deleteUser.jsp?Id=<%=resultset.getInt("idUsuarios")%>'>Yes, Delete!</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal 2 -->
                        <div class="modal fade" id="confirmUpdateModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Update user</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        ¿Do you really want to update <%=resultset.getString("name")%>?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                        <button type="submit" class="btn btn-primary">Update</button> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>     
        </div> 
    </body>
</html>
