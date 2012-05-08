<%-- 
    Document   : index
    Created on : 2/04/2012, 11:56:08 PM
    Author     : Jonas
--%>

<%@page import="TimLog.Jugador"%>
<%@page import="TimBD.JugadorBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
               
            <center>
                <h1>Bienvenido</h1>

                <% if (request.getParameter("error") != null) {%>

                <font color="red">
                    <b>Error en usuario y/o contrase&ntilde;a</b>
                </font>

        <% }%>     
        <h2>Inicia Sesion!<br /></h2>
        <form action="index.jsp" method="post">
            <table border="0" align="center">
                <tbody>
                    <tr>
                        <td>Usuario: </td>
                        <td><input type="text" name="usuario"></td>
                    </tr>
                    <tr>
                        <td>Contrase&ntilde;a: </td>
                        <td><input type="password" name="password"></td>
                    </tr>
                    <tr>
                        <td><a href="PaginaRegistro.jsp" align=" right" style="color: #FFFFFF; font-size: 18px;"><br /><br />¿Aun No Eres Usuario?
                                          <br />Registrate Aqui</a></td>
                        <td align= right><input type="submit" value="Entrar"></td>
                    </tr>
                </tbody>
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

    <% if (request.getParameter("usuario") != null && request.getParameter("password") != null) {

            String usuario = request.getParameter("usuario").trim();
            String password = request.getParameter("password").trim();
            JugadorBD jugador = new JugadorBD(usuario);
            Jugador jugador1 = jugador.autenticarse(password);
            if (jugador1 != null) {
                HttpSession sesion = request.getSession();
                sesion.setAttribute("Jugador", jugador1);
                response.sendRedirect("PaginaInicio.jsp");
            } else {
                response.sendRedirect("index.jsp?error=true");
            }
        }
    %>
</body>
</html>
