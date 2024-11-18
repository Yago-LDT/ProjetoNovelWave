import br.com.conexao.CriarConexao;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class NovelControllers extends HttpServlet{
    
    //private static final log serialVersionUID = 1L;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        int idBuscado = -1;
        String loginBuscado = "";
        String senhaBuscada = "";
        String emailBuscado = "";
        Connection con;
        
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        String email = request.getParameter("email");
        
        String sql = "SELECT * FROM usuario WHERE login=? AND senha=? AND email=?";
        try{
        con = CriarConexao.getConexao();
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, login);
        stmt.setString(2, senha);
        stmt.setString(3, email);
        
        ResultSet rs = stmt.executeQuery();
        if( rs.next() ){
            idBuscado = rs.getInt("id");
            loginBuscado = rs.getString("login");
            senhaBuscada = rs.getString("senha");
            emailBuscado = rs.getString("email");
        }
        rs.close();
        stmt.close();
        }catch(SQLException e){
         e.printStackTrace();
         }
        if (idBuscado != -1 && loginBuscado.equals(login) && senhaBuscada.equals(senha) && emailBuscado.equals(email)) {
            HttpSession session = request.getSession();
            session.setAttribute("idusuario", idBuscado);
            session.setAttribute("login", login);
            request.getRequestDispatcher("perfil.jsp").forward(request, response);
        }else{
            System.out.println(loginBuscado + "-" + login);
            System.out.println(senhaBuscada + "-" + senha);
            request.getRequestDispatcher("errodeusuario.jsp").forward(request, response);
        }
    }
    
}