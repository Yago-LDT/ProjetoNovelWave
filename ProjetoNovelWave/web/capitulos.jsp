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
