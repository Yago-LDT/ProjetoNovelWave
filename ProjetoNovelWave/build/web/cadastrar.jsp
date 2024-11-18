<%@page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro</title>
        <link rel="stylesheet" href="estilocadastro.css">
        <link rel="stylesheet" href="estiloperfil.css">
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
            <br><br>
        <h1>Cadastro</h1>
        
            <form name="formCadastroUsuario" action="CadastroNovel" method="post"/>
            
                    <tr>
                    <td>Login:</td><td><input type="text" name="login"/></td>
                    <td>Senha:</td><td><input type="password" name="senha"/></td>
                    <td>Email:</td><td><input type="text" name="email"/></td>
                    
                </tr>
                  <td><input type="submit" value="Cadastrar"/></td>
                
            </form>
        
        
        <br><br><br><br><br><br><br><br><br><br>
        <footer>
        <p>&copy; 2024 NovelWave. Todos os direitos reservados.</p>
    </footer>
    </body>
</html>
