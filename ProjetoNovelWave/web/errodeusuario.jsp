<%@page isErrorPage="true" %>
<%@page import="java.util.Enumeration" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="estiloindex.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
    </head>
    
    <body>
        <header>
        <div class="navbar">
            <div class="logo">
                <a href="index.jsp"><img src="imagens/novelwavelogo.png" width="100" height="100" alt="Logo Novel Wave"/> </a>
            </div>
            <ul class="nav-links">
                <li><a href="index.jsp"><img src="imagens/homelogo.png" width="50" height="50" alt="Home" title="Home"/></a></li>
                <li><a href="#"><img src="imagens/categoriaslogo.png" width="50" height="50" alt="Categorias" title="Categorias"/></a></li>
                <%
                    String loginLogado = (String) session.getAttribute("login");
                    if (loginLogado != null) {
                %>
                <li><a href="perfil.jsp"><img src="imagens/perfillogo.png" width="50" height="50" alt="Perfil" title="Perfil"/>g</a></li>
                <li><a href="logout.jsp"><img src="imagens/logosaida.png" width="50" height="50" alt="Logout" title="Logout"/></a></li>
                <%
                    } else {
                %>
                    <li><a href="cadastrar.jsp"><img src="imagens/cadastrologo.png" width="50" height="50" alt="Cadastrar" title="Cadastro"/></a></li>
                    <li><a href="login.jsp"><img src="imagens/loginlogo.png" width="50" height="50" alt="Login" title="Login"/></a></li>
                <%
                    }
                %>
            </ul>
        </div>
    </header>
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
