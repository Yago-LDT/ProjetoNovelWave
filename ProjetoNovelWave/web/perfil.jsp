<%@page import="java.sql.PreparedStatement"%>
<%@page import="br.com.conexao.CriarConexao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil</title>
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
        <% 
          String login_logado = (String) session.getAttribute("login");
    if (login_logado == null) {
        response.sendRedirect("login.jsp");
        return;
    }
            %>
        
            Seja bem vindo: <%=login_logado %> 
            
        <h1>Dados do seu perfil</h1>
        
                    <%
            
             String atualiza = request.getParameter("ac");
    if ("atualizar".equals(atualiza)) {
        String loginNovo = request.getParameter("login");
        String senhaNova = request.getParameter("senha");
        String emailNovo = request.getParameter("email");
        int idUsuario = Integer.parseInt(request.getParameter("id"));
        
        Connection conn2 = CriarConexao.getConexao();
        String sql2 = "UPDATE usuario SET login=?, senha=?, email=? WHERE id=?";
        PreparedStatement stmt2 = conn2.prepareStatement(sql2);
        stmt2.setString(1, loginNovo);
        stmt2.setString(2, senhaNova);
        stmt2.setString(3, emailNovo);
        stmt2.setInt(4, idUsuario);
        stmt2.executeUpdate();
        stmt2.close();
        conn2.close();
    }
                %>
                
               <%
    String acao = request.getParameter("acao");
    if ("excluir".equals(acao)) {
        int idExcluir = Integer.parseInt(request.getParameter("id"));
        Connection conn3 = CriarConexao.getConexao();
        String sql3 = "DELETE FROM usuario WHERE id = ?";
        PreparedStatement stmt3 = conn3.prepareStatement(sql3);
        stmt3.setInt(1, idExcluir);
        stmt3.execute();
        stmt3.close();
        conn3.close();
    }
%>
                
        <br><br>
        <table>
            <tr>
                <td><strong>ID</strong></td>
                <td><strong>Login</strong></td>
                
                <td><strong>Email</strong></td>
                <td><strong>Dia de Registro</strong></td>
            </tr>  
            <%   
    if (login_logado == null) {
        response.sendRedirect("login.jsp");
        return; 
    }
    int id = 0;
    String senha = "";
    String email = "";
    String dia_registro = "";
    Connection conn = CriarConexao.getConexao();
    String sql = "SELECT * FROM usuario WHERE login = ?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, login_logado);
    ResultSet rs = stmt.executeQuery();
    if (rs.next()) {
        id = rs.getInt("id");
        senha = rs.getString("senha");
        email = rs.getString("email");
        dia_registro = rs.getString("dia_registro");
    } else {
        response.sendRedirect("login.jsp");
        return; 
    }
    
    
    rs.close();
    stmt.close();
    conn.close();
    
     int idU = id;
%>
                
                <tr>
                    <td><%=id %></td>
                    <td><%=login_logado %></td>
                    
                    <td><%=email %></td>
                    <td><%=dia_registro %></td>
                    <td><a href="perfil.jsp?id=<%=id %>&login=<%=login_logado %>&senha=<%=senha %>&email=<%=email %>">
                            Editar</a></td>
                            <td><a href="perfil.jsp?id=<%=id %>&acao=excluir">
                                Excluir</a></td>
                </tr>
               
        </table>
        <br><br>
        <h1>Altere seus dados aqui</h1>
        
        <form action="perfil.jsp?id=<%=id %>" method="post" class="dados">
            <table>
                <tr>
                    
                    <td><strong>Login</strong></td>
                    <td><strong>Senha</strong></td>
                    <td><strong>Email</strong></td>
                    
                </tr>
                <tr>
                    <td><input type="text" name="login" size="35" value="<%=request.getParameter("login") %>"></input></td>
                    <td><input type="password" name="senha" size="25" value="<%=request.getParameter("senha") %>"></input></td>
                    <td><input type="text" name="email" size="35" value="<%=request.getParameter("email") %>"></input></td>
                    
                <input type="hidden" name="ac" value="atualizar"></input>
            </tr>
            </table>
                <input type="submit" value="Atualizar"/></input>
                </form>
                <br><br>
                
                <h1>Favoritos</h1>
                <br><br>
                
                <%                
            Connection conn4 = CriarConexao.getConexao();
            String sql4 = "SELECT n.id as idNovel, n.nome as Titulo, n.caminho_imagem as Imagem, n.num_cap as Capitulos, n.ult_at as Atualizado"
                    + " FROM novels_fav"
                    + " INNER JOIN webnovels as n ON novels_fav.favnovels = n.id "
                    + " INNER JOIN usuario as u ON novels_fav.idusuario = u.id WHERE u.id = ?";
            PreparedStatement stmt4 = conn4.prepareStatement(sql4);
            stmt4.setInt(1, idU);
            ResultSet rs4 = stmt4.executeQuery();
            

            while (rs4.next()) {
                int idNovel = rs4.getInt("idNovel");
                String nome = rs4.getString("Titulo");
                String imagem = rs4.getString("Imagem");
                int num_cap = rs4.getInt("Capitulos");
                String ult_at = rs4.getString("Atualizado");
        %>
        
        
        
        <div class="conteudo-card">
            <img src="<%=imagem %>" alt="<%= nome %>" class="conteudo-imagem">
            <h3><%=nome %></h3>
            <p>Capítulos: <%= num_cap %></p>
            <p>Atualizado: <%=ult_at %></p>
            <a href="webnovels.jsp?acao=listar&id=<%=idNovel %>">Ver mais</a>
            <br><br><br>
            <form action="perfil.jsp" method="get" style="display:inline;">
        <input type="hidden" name="acao" value="remover_favorito">
        <input type="hidden" name="id_novel" value="<%= rs4.getInt("idNovel") %>">
         <input type="hidden" name="id" value="<%= id %>">
        <button type="submit">Remover dos Favoritos</button>
    </form>
 </div>
            
        
        <%
            }
            
            rs4.close();
            stmt4.close();
            conn4.close();

        %>
        
        <%
            if ("remover_favorito".equals(acao)) {
                String idNovelStr = request.getParameter("id_novel");
                if (idNovelStr != null && !idNovelStr.isEmpty()) {
                    try {
                        int idNovelRemover = Integer.parseInt(idNovelStr);
                        Connection connRemover = CriarConexao.getConexao();
                        String sqlRemover = "DELETE FROM novels_fav WHERE idusuario = ? AND favnovels = ?";
                        PreparedStatement stmtRemover = connRemover.prepareStatement(sqlRemover);
                        stmtRemover.setInt(1, Integer.parseInt(request.getParameter("id")));
                        stmtRemover.setInt(2, idNovelRemover);
                        stmtRemover.execute();
                        stmtRemover.close();
                        connRemover.close();
                        out.println("<p>Novel removida dos favoritos!</p>");
                    } catch (Exception e) {
                    out.println("ID do usuário: " + request.getParameter("id"));
                    out.println("Valor recebido de id_novel: " + idNovelStr);
                        out.println("<p>Erro ao remover a novel dos favoritos.</p>");
                    }
                }
            }
        %>

        
        </form>
        <footer>
        <p>&copy; 2024 NovelWave. Todos os direitos reservados.</p>
    </footer>
    </body>
    
</html>
