<%-- 
    Document   : index
    Created on : Sep 26, 2023, 8:02:23 PM
    Author     : steven
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <h1>Hola soy un h1</h1>
        <% String hola = "Hola mundo desde java";%>

        <h1> <%=hola%> </h1>

        <h2>Suma de 2 numeros</h2>

        <form action="index.jsp" method="GET">
            <table>
                <tr>
                    <td>Ingrese numero 1 : </td>
                    <td><input type="text" name="numero1"></td>
                </tr>
                <tr>
                    <td>Ingrese numero 2 : </td>
                    <td><input type="text" name="numero2"></td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name ="enviar" value="Sumar">
                    </td>
                </tr>
            </table>

        </form>

    </body>
</html>

 <%
    
    if (request.getMethod().equals("Get")) {
        int num1 = Integer.parseInt(request.getParameter("numero1"));
        int num2 = Integer.parseInt(request.getParameter("numero2"));
        int suma = num1 + num2;
        out.print("La suma es : " + suma);
    }
%>