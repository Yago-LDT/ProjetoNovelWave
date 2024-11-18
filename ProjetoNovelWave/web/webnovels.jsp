<%@page import="br.com.conexao.CriarConexao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Webnovel</title>
        <link rel="stylesheet" href="estilowebnovels.css">
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
                        Integer idUsuario = (Integer) session.getAttribute("idusuario");

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
            <br><br><br><br><br><br>
        <%
            String acao = request.getParameter("acao");
            String idListarStr = request.getParameter("id");
            int idListar;

            if (acao != null && "listar".equals(acao)) {
                if (idListarStr != null && !idListarStr.isEmpty()) {
                    try {
                        idListar = Integer.parseInt(idListarStr);

                        // Conexão com o banco para buscar os dados da Novel
                        Connection conn = CriarConexao.getConexao();
                        String sql = "SELECT * FROM webnovels WHERE id = ?";
                        PreparedStatement stmt = conn.prepareStatement(sql);
                        stmt.setInt(1, idListar);
                        ResultSet rs = stmt.executeQuery();

                        if (rs.next()) {
                            // Variáveis da Novel
                            int id = rs.getInt("id");
                            String nome = rs.getString("nome");
                            String sinopse = rs.getString("sinopse");
                            String autor = rs.getString("autor");
                            int num_cap = rs.getInt("num_cap");
                            String status = rs.getString("status");
                            String genero1 = rs.getString("genero1");
                            String genero2 = rs.getString("genero2");
                            String caminho_imagem = rs.getString("caminho_imagem");
        %>
                            <!-- Exibição da Novel -->
                            <div class="pagina-novel">
                                <img src="<%= caminho_imagem %>" alt="<%= nome %>" class="novel-imagem">
                                <h1><%= nome %></h1>
                                <h4>Autor: <%= autor %></h4>
                                <p>Capítulos: <%= num_cap %></p>
                                <p>Gêneros: <%= genero1 %> || <%= genero2 %></p>
                                <p>Status: <%= status %></p>
                                <p>Sinopse: <%= sinopse %></p>
                                <form action="webnovels.jsp" method="post">
                                    <input type="hidden" name="id_novel" value="<%= id %>">
                                    <input type="hidden" name="acao" value="favoritar">
                                    <br><br><br>
                                    <input type="submit" value="Favoritar">
                                    <br><br><br>
                                </form>
                            </div>
        <%
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (NumberFormatException e) {
                        out.println("<p>Erro: ID inválido.</p>");
                    }
                } else {
                    out.println("<p>Erro: ID não encontrado.</p>");
                }
            }

            // Adicionar Favoritos
            if ("favoritar".equals(acao) && loginLogado != null) {
                String idNovelStr = request.getParameter("id_novel");
                if (idNovelStr != null && !idNovelStr.isEmpty()) {
                    try {
                        int idNovel = Integer.parseInt(idNovelStr);

                        Connection connFavoritar = CriarConexao.getConexao();
                        String sqlFavoritar = "INSERT INTO novels_fav (idusuario, favnovels) VALUES (?, ?)";
                        PreparedStatement stmtFavoritar = connFavoritar.prepareStatement(sqlFavoritar);
                        stmtFavoritar.setInt(1, idUsuario);
                        stmtFavoritar.setInt(2, idNovel);
                        stmtFavoritar.execute();
                        stmtFavoritar.close();
                        connFavoritar.close();

                        out.println("<p>Novel adicionada aos favoritos!</p>");

                    } catch (NumberFormatException e) {
                        out.println("<p>Erro: ID da Novel inválido.</p>");
                        
                    }
                } else {
                    out.println("<p>Erro: Nenhuma Novel foi selecionada.</p>");
                }
                
            }
        %>

        <!-- Exibição de Capítulos -->
        <h1>Capítulos</h1>
        <%
            try {
            
            idListar = Integer.parseInt(idListarStr);
                Connection connCapitulos = CriarConexao.getConexao();
                String sqlCapitulos = "SELECT c.id as Capitulo, c.num as Numero, c.nome as Titulo, c.data_postagem as Postagem " +
                                      "FROM novel_cap INNER JOIN capitulos AS c ON novel_cap.idcap = c.id " +
                                      "WHERE novel_cap.idnovel = ? ORDER BY c.data_postagem DESC";
                PreparedStatement stmtCapitulos = connCapitulos.prepareStatement(sqlCapitulos);
                stmtCapitulos.setInt(1, idListar);
                ResultSet rsCapitulos = stmtCapitulos.executeQuery();

                if (rsCapitulos.next()) {
        %>
                    <table>
                        <tr>
                            <th>Título</th>
                            <th>Número</th>
                            <th>Data de Postagem</th>
                        </tr>
                   
        <%
                    do {
                        String titulo = rsCapitulos.getString("Titulo");
                        int numero = rsCapitulos.getInt("Numero");
                        String postagem = rsCapitulos.getString("Postagem");
                        int idCapitulo = rsCapitulos.getInt("Capitulo");
        %>
                   
                        <tr>
                            <td>    <%= titulo %></td>
                            <td>    <%= numero %></td>
                            <td>    <%= postagem %></td>
                            <td><a href="capitulos.jsp?acao=listar&id=<%= idListar %>&idcap=<%= idCapitulo %>">Ler</a></td>
                        </tr>
        <%
                    } while (rsCapitulos.next());
        %>
                    </table>
        <%
                } else {
                    out.println("<p>Nenhum capítulo encontrado.</p>");
                }
                rsCapitulos.close();
                stmtCapitulos.close();
                connCapitulos.close();
            } catch (Exception e) {
                out.println("<p>Erro ao buscar capítulos.</p>");
            }
        %>
        <footer>
        <p>&copy; 2024 NovelWave. Todos os direitos reservados.</p>
    </footer>
    </body>
</html>
