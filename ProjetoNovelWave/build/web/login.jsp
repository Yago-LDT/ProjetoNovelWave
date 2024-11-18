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
        <link rel="stylesheet" href="estilologin.css">
        
    
    </head>
    <body>
        <header>
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
