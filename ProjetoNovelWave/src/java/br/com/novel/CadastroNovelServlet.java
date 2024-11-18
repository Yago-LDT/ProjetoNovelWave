package br.com.novel;

import br.com.conexao.CriarConexao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CadastroNovelServlet extends HttpServlet{
    
    private static final long serialVersionUID = 1L;
    
    public CadastroNovelServlet() {
        super();
    }
    
@Override
protected void doPost (HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
PrintWriter writer = response.getWriter();
String login = request.getParameter("login");
String senha = request.getParameter("senha");
String email = request.getParameter("email");

Connection con;
try{
    con = CriarConexao.getConexao();
    
    Novel n = new Novel();
    n.setLogin(login);
    n.setSenha(senha);
    n.setEmail(email);
    
    NovelDAO dao = new NovelDAO (con);
    dao.cadastrarusuario(n);
    request.setAttribute("login", n.getLogin());
    request.getRequestDispatcher("cadastrado.jsp").forward(request, response);
    
    
    
}catch(SQLException e){
    e.printStackTrace();
}
}
    
    
}
