<%@page isErrorPage="true" %>
<%@page import="java.util.Enumeration" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style type="text/css">
            body{ background-color: #fff;}
            #cabecalho{
                background-color: #fff;
                width: 800px;
                height: 100px;
            }
            
            #corpo{
                background-color: #fff;
                width: 800px;
                height: 450px;
            }
            #rodape{
                background-color: #fff;
                width: 800px;
                height: 100px;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
    </head>
    <body>
    <body>
        <div align="center">
            <div id="cabecalho"> </div>
            <div id="corpo">
                <img src="imagens/erro1.jpg"/>
                <hr/>
                <h3>Login e senha incorretos</h3><br>
                <br>
                <hr>
                <a href="login.jsp"> Tentar novamente</a> <a href="index.jsp">Catálogo</a>
                
                
            </div>
            
       <div id="rodape">
                
                
       </div>
    </body>
   </body>
</html>
