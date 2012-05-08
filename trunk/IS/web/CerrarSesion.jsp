<%-- 
    Document   : CerrarSesion
    Created on : 16-abr-2012, 13:35:52
    Author     : Toshiba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            request.getSession().invalidate();
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
