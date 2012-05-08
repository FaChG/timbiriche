<%-- 
    Document   : ValidarRegistro
    Created on : 27/03/2012, 07:23:04 PM
    Author     : Jonas
--%>

<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="TimLog.Jugador"%>
<%@page import="TimBD.JugadorBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validando Registro</title>
    </head>
    <body>
        <%
            String nombre, apellido, usuario, correo;

            nombre = "";
            apellido = "";
            usuario = "";
            correo = "";

            //Verificacion NOMBRE
            if (request.getParameter("nombre") != null) {
                nombre = request.getParameter("nombre").trim();
                Pattern p = Pattern.compile("([a-zA-Z])+");
                Matcher m = p.matcher(nombre);
                if (!m.matches()) {
                    response.sendRedirect("PaginaRegistro.jsp?errorNom=true");
                }
            }

            //Verificacion APELLIDO
            if (request.getParameter("apellido") != null) {
                apellido = request.getParameter("apellido").trim();
                Pattern p = Pattern.compile("([a-zA-Z])+");
                Matcher m = p.matcher(apellido);
                if (!m.matches()) {
                    response.sendRedirect("PaginaRegistro.jsp?errorAp=true");
                }
            }


            //Verificacion USUARIO
            if (request.getParameter("user") != null) {
                usuario = request.getParameter("user").trim();
                Pattern p = Pattern.compile("([a-zA-Z]([a-zA-z]|[1-9]|[_.-])+)");
                Matcher m = p.matcher(usuario);
                if (!m.matches()) {
                    response.sendRedirect("PaginaRegistro.jsp?errorUs=true");
                }
            }


            //Verificacion CORREO
            if (request.getParameter("correo") != null) {
                correo = request.getParameter("correo").trim();
                Pattern p = Pattern.compile("([a-zA-Z]|[.-/_]|[0-9])+(@)([a-zA-Z]|[.-/_])+(.com(.mx)*)");
                Matcher m = p.matcher(correo);
                if (!m.matches()) {
                    response.sendRedirect("PaginaRegistro.jsp?errorCo=true");
                }
            }
            JugadorBD jugador = new JugadorBD();
            if(jugador.registrarse(nombre,apellido,correo,usuario)){
        %>
        
        <H3>Gracias por registrarte en Timbirilina, tu contraseña sera enviada a tu correo electronico.
        <br>Tu nombre de usuario es: <% out.println(usuario);%><br></H3>
        <a href="index.jsp">Inicio</a>

        <% }else{ %>
        <H3>Lo sentimos pero el nombre de usuario: <% out.println(usuario);%> o correo electronico: <%= correo%> estan ocupados:<br>
        Intenta con otro usuario y/o correo electronico</h3>
        <% } %>
    </body>
</html>
