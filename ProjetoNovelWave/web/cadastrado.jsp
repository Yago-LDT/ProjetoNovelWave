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
         <div class="navbar">
            <div class="logo">
                <a href="index.jsp">NovelWave</a>
            </div>
            <ul class="nav-links">
                <li><a href="index.jsp">Home</a></li>
                
                <%
                   String loginLogado = (String) session.getAttribute("login");
                   
                    if (loginLogado == null) {
                %>
                    <li><a href="cadastrar.jsp">Cadastrar</a></li>
                    <li><a href="login.jsp">Login</a></li>    
                <%
                    } else {
                %>
                    <li><a href="perfil.jsp">Perfil</a></li>
                    <li><a href="logout.jsp">Sair</a></li>
                <%
                    }
                %>
            </ul>
        </div>
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
