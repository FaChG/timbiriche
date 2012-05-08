<%-- 
    Document   : PaginaInicio
    Created on : 26/03/2012, 10:08:52 PM
    Author     : Jonas
--%>

<%@page import="TimLog.Jugador"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="CerrarSesion.jsp"> cerrar sesión</a>
        <% Jugador j = (Jugador) session.getAttribute("Jugador");%>
        <h3>Bienvenido <%= j.getUsuario()%> </h3>
        
        <form action="PaginaJuego.jsp" method="post">
            <% String conectados[] = Jugador.getStringConnected();
                for (int i = 0; i < conectados.length; i++) {%>
                <input type="checkbox" value<%=conectados[i]%> name ="pasa"><%out.print(conectados[i]);%><br>
            <%}%>
            <input type="submit" value="Invitar">
        </form>
        Comienza a Jugar <a href="PaginaJuego.jsp"> aqui</a>



    </body>
</html>
