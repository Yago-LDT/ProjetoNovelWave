<%@page import="java.sql.ResultSet"%>
<%@page import="br.com.conexao.CriarConexao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Capitulo</title>
        <link rel="stylesheet" href="estilocapitulo.css">
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
        <%
         String acao = request.getParameter("acao");
    if ("listar".equals(acao)) {
        int idListar = Integer.parseInt(request.getParameter("id"));
        int idCap = Integer.parseInt(request.getParameter("idcap"));
        Connection conn = CriarConexao.getConexao();
        String sql = "SELECT n.id,n.nome as Novel, c.id, c.num as Numero, c.conteudo as Conteudo, c.nome as Titulo "
        + "from novel_cap"
        + " inner join webnovels as n on novel_cap.idnovel = n.id"
        + " inner join capitulos as c on novel_cap.idcap = c.id where n.id = ? and c.id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, idListar);  
        stmt.setInt(2, idCap);
        ResultSet rs = stmt.executeQuery();
        
        if (rs.next()) {
            String novel = rs.getString("Novel");
            int numero = rs.getInt("Numero");
            String conteudo = rs.getString("Conteudo");
             String conteudoFormatado = conteudo.replace("\n", "<br>");
            String titulo = rs.getString("Titulo");
            %>
            <div class="card">
            <h1><%= novel %>   ||  Capitulo: <%= numero %></h1>
            <br>
            <h2><%= titulo %></h2>
            </div>
            <br>
            <div class="card">
            <p><%= conteudoFormatado %></p>
            </div>
            
            
            <%
            }
            rs.close();
            stmt.close();
            conn.close();
}
%>
<footer>
        <p>&copy; 2024 NovelWave. Todos os direitos reservados.</p>
    </footer>
    </body>
</html>
