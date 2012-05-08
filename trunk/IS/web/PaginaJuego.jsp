<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html>
    <head>
        <style type="text/css">
            body {
                background: #000000; 
                color: #aaaaaa; 
                font-family: sans-serif; 
                text-align: center; 
                margin-top: 5em;
            }
            a:link {color: #F88113; text-decoration: none}
            a:visited {color: #ad5a0d; text-decoration: none}
            a:active {color: #F88113; text-decoration: none}
            a:hover {color: #F88113; text-decoration: underline}
        </style>
        <title>Images - Created with PulpCore</title>
    </head>

    <body>
        <h3>Hola</h3>
        <div id="game">
            <script type="text/javascript"><!--
                pulpcore_width = 1000;
                pulpcore_height = 500;
                pulpcore_archive = "Timbiriche.jar";
                pulpcore_assets = "Timbiriche.zip";
                pulpcore_scene = "Timbiriche";
                //-->
            </script>
            <script type="text/javascript" src="pulpcore.js"></script>
            <noscript><p>Para Jugar, acticva JavaScript del menu de opciones o herramientas.</p></noscript>
        </div>
        <% String res = request.getParameter("pasa");
                        out.print(res);%>
        <a href="PaginaInicio.jsp" >atras</a>
        

    </body>
</html>
