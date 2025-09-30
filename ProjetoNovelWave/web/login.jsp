<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script>
            function validarLogin(){
                if (document.formLogin.login.value===""){
                    alert ("Campo login não informado");
                    return false;
                    
                }
                if ( document.formLogin.senha.value===""){
                    alert("Campo senha não informado");
                    return false;
                }
                
                document.formLogin.submit();
                
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login NovelWave</title>
        <link rel="stylesheet" href="estiloindex.css">
        
    
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
            
        <h1>Login</h1>
        <br><br>
        
        <form name="formLogin" action="Novel" method="post"/>
            <tr>
                <td>Login:</td><td><input type="text" name="login"/></td>
                <td>Senha:</td><td><input type="password" name="senha"/></td>
                <td>Email:</td><td><input type="text" name="email"/></td>
                <td colspan="2">
                        <input type="submit" value="Entrar"
                    onclick="validarLogin()"/></td>
            </tr>                
            
        </form>
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br>
        <footer>
        <p>&copy; 2024 NovelWave. Todos os direitos reservados.</p>
    </footer>
    </body>
</html>
