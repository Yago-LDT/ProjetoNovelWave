<%@page import="br.com.conexao.CriarConexao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NovelWave - WebNovels</title>
    <link rel="stylesheet" href="estiloindex.css">
</head>
<body>
    
    <header>
        <div class="navbar">
            <div class="logo">
                <a href="index.jsp">NovelWave</a>
            </div>
            <ul class="nav-links">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#">Categorias</a></li>
                <%
                    String loginLogado = (String) session.getAttribute("login");
                    if (loginLogado != null) {
                %>
                    <li><a href="perfil.jsp">Perfil</a></li>
                    <li><a href="logout.jsp">Sair</a></li>
                <%
                    } else {
                %>
                    <li><a href="cadastrar.jsp">Cadastrar</a></li>
                    <li><a href="login.jsp">Login</a></li>
                <%
                    }
                %>
            </ul>
        </div>
    </header>



    
    <section class="destaques">
        <br><br><br>
                <h2>Destaques</h2>
               
         <%
            Connection conn = CriarConexao.getConexao();
            String sql = "SELECT * FROM webnovels";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            

            while (rs.next()) {
                int id = rs.getInt("id");
                String nome = rs.getString("nome");
                String autor = rs.getString("autor");
                int num_cap = rs.getInt("num_cap");
                String status = rs.getString("status");
                String caminho_imagem = rs.getString("caminho_imagem");
        %>
       
        <div class="conteudo-card">
            <img src="<%= caminho_imagem %>" alt="<%= nome %>" class="conteudo-imagem">
            <h3><%= nome %></h3>
            <h4>Autor: <%= autor %></h4>
            <p>Capítulos: <%= num_cap %></p>
            <p>Status: <%= status %></p>
            <a href="webnovels.jsp?acao=listar&id=<%=id %>">Ver mais</a>
        </div>
    <%
            }
            
            rs.close();
            conn.close();
            stmt.close();
            
        %>
      </section>
      
        <br><br><br>
        
        <section class="atualizados">
        <h2>Atualizadas Recentemente</h2>
         <%
            Connection conn2 = CriarConexao.getConexao();
            String sql2 = "SELECT * FROM webnovels ORDER BY ult_at desc";
            PreparedStatement stmt2 = conn2.prepareStatement(sql2);
            ResultSet rs2 = stmt2.executeQuery();
            

            while (rs2.next()) {
                int id = rs2.getInt("id");
                String nome = rs2.getString("nome");
                String autor = rs2.getString("autor");
                int num_cap = rs2.getInt("num_cap");
                String status= rs2.getString("status");
                String caminho_imagem = rs2.getString("caminho_imagem");
        %>
        
        <div class="conteudo-card">
            <img src="<%= caminho_imagem %>" alt="<%= nome %>" class="conteudo-imagem">
            <h3><%= nome%></h3>
            <h4>Autor: <%= autor %></h4>
            <p>Capítulos: <%= num_cap %></p>
            <p>Status: <%= status %></p>
            <a href="webnovels.jsp?acao=listar&id=<%=id %>">Ver mais</a>
        </div>
        <%
            }
            
            rs2.close();
            stmt2.close();
            conn2.close();
        %>
        
    </section>
        
        <section class="filtragem">
    <h2>Filtrar WebNovels</h2>
    <form method="GET" action="index.jsp">
        <label for="genero">Gênero:</label>
        <select name="genero" id="genero">
            <option value="">Todos</option>
            <option value="Fantasia">Fantasia</option>
            <option value="Aventura">Aventura</option>
            <option value="Romance">Romance</option>
            <option value="Mistério">Mistério</option>
        </select>
        
        <label for="ano">Ano de Postagem:</label>
        <select name="ano" id="ano">
            <option value="">Todos</option>
            <%
                
                int anoAtual = java.time.Year.now().getValue();
                for (int i = anoAtual; i >= anoAtual - 10; i--) {
            %>
                <option value="<%= i %>"><%= i %></option>
            <%
                }
            %>
        </select>
        <br><br><br>
        <button type="submit">Filtrar</button>
    </form>
</section>
        
        <section class="filtragem-resultado">
    <h2>Resultados Filtrados</h2>
    <%
      
        String genero = request.getParameter("genero");
        String ano = request.getParameter("ano");

       
        Connection connfiltrar = CriarConexao.getConexao();
        String sqlfiltrar = "SELECT * FROM webnovels WHERE 1=1";

        if (genero != null && !genero.isEmpty()) {
            sqlfiltrar += " AND (genero1 = ? OR genero2 = ?)";
        }
        if (ano != null && ano != "Todos" && !ano.isEmpty()) {
            sqlfiltrar += " AND ano_postagem = ?";
        }

        PreparedStatement stmtfiltrar = connfiltrar.prepareStatement(sqlfiltrar);
        
        int paramIndex = 1;
        if (genero != null && !genero.isEmpty() && ano != "Todos") {
            stmtfiltrar.setString(paramIndex++, genero);
            stmtfiltrar.setString(paramIndex++, genero);
        }
        if (ano != null && !ano.isEmpty()) {
            stmtfiltrar.setInt(paramIndex++, Integer.parseInt(ano));
        }
        ResultSet rsfiltrar = stmtfiltrar.executeQuery();
        
        if (rsfiltrar.isBeforeFirst()) {
        while (rsfiltrar.next()) {
            int id = rsfiltrar.getInt("id");
            String nome = rsfiltrar.getString("nome");
            String autor = rsfiltrar.getString("autor");
            String cap = rsfiltrar.getString("num_cap");
            String status = rsfiltrar.getString("status");
            String caminho_imagem = rsfiltrar.getString("caminho_imagem");
    %>
        <div class="conteudo-card">
            <img src="<%= caminho_imagem %>" alt="<%= nome %>" class="conteudo-imagem">
            <h3><%= nome %></h3>
            <h4>Autor: <%= autor %></h4>
            <p>Capítulos: <%= cap %></p>
            <p>Status: <%= status %></p>
            <a href="webnovels.jsp?acao=listar&id=<%= id %>">Ver mais</a>
        </div>
    <%
        }
 } else {
    %>
        <p>Nenhuma novel encontrada para os filtros selecionados.</p>
    <%
        }


        rsfiltrar.close();
        stmtfiltrar.close();
        connfiltrar.close();
    %>
</section>



    <!-- Rodapé -->
    <footer>
        <p>&copy; 2024 NovelWave. Todos os direitos reservados.</p>
    </footer>
</body>
</html>


