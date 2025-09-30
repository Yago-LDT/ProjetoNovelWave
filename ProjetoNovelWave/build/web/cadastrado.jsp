<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script language="Javascript">
            var timer= 2;
            function countdown() {
                if ( timer > 0){
                    timer -=1;
                    setTimeout("countdown()", 3000);
                } else {
                    location.href = 'login.jsp';
                }
            }
            countdown();
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seu perfil</title>
        <link rel="stylesheet" href="estiloperfil.css">
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
                <li><a href="perfil.jsp"><img src="imagens/perfillogo.png" width="50" height="50" alt="Perfil" title="Perfil"/></a></li>
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
            
        <%  String login = (String) request.getAttribute("login");
            out.println("<h4>Login " + login + " Cadastrado com sucesso <h4>");
            out.println("Você será redirecionado para a página de login");
        %>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <footer>
        <p>&copy; 2024 NovelWave. Todos os direitos reservados.</p>
    </footer>
    </body>
</html>
