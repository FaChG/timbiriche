<%-- 
    Document   : PaginaRegistro
    Created on : 28/03/2012, 10:56:48 AM
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
        <title>Registro</title>
        <link rel="stylesheet" href="./css/index.css">
    </head>
    <body>
                <div id="contenedor">
	   <div id="encabezado">                                                                                    <!--encabezado-->
		 <div id="logotipo">
			 <A NAME="LOGO"></A>
			 <A HREF="./index.jsp"><img src="./css/img/barra.jpg" alt="logo" width=1018 height=60></A>
		 </div>
	   </div>
            <div id="registro">
        <h1>Ingresa tus datos</h1>
    <center>
        <h3>Escriba los siguientes datos:</h3>
        <form method="post" action="ValidarRegistro.jsp">
            <table>
                <tr>
                    <td align="right">Nombre: </td>
                    <td align="left"><input type="text" name="nombre" size="20" maxlength="50"></td>


                    <% if (request.getParameter("errorNom") != null) {%>
                <tr><td colspan="2"><font color ="red">Solo se aceptan letras</font></td></tr>
                        <%}%>
                </tr>
                <tr>
                    <td align="right">Apellido: </td>
                    <td align="left"><input type="text" name="apellido" size="20" maxlength="50"></td>

                    <% if (request.getParameter("errorAp") != null) {%>
                <tr><td colspan="2"><font color ="red">Solo se aceptan letras</font></td></tr>
                        <%}%>
                </tr>
                <tr>

                    <% if (request.getParameter("errorCo") != null) {%>
                <tr><td colspan="2"><font color ="red">Solo se aceptan letras</font></td></tr>
                        <%}%>
                <td align="right">Correo electr&oacute;nico: </td>
                <td align="left"><input type="text" name="correo" size="20" maxlength="50"></td>
                </tr>
                <tr>

                    <% if (request.getParameter("errorUs") != null) {%>
                <tr><td colspan="2"><font color ="red">Solo se aceptan letras</font></td></tr>
                        <%}%>
                <td align="right">Usuario: </td>
                <td align="left"><input type="text" name="user" size="20" maxlength="50"></td>
                </tr> 

                <td colspan="2" align="right"><input type="submit" value="Registrarse"></td>
            </table>
        </form>
    </center>

                </div>

	  <div id="pie-pagina">
		 <p>&#169; 2012 - TeraCloud System
		 <A NAME="abajo"><br></A>
                     <A HREF="#encabezado">Ir arriba</A></p>
	  </div>
        </div>

</body>
</html>
