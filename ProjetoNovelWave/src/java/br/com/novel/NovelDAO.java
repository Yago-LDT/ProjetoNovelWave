package br.com.novel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class NovelDAO {
    private Connection con;
    public NovelDAO (Connection con) {
        this.con=con;
    }
    public void cadastrarusuario(Novel n) throws SQLException{
    
        String sql = "INSERT INTO usuario (login, senha, email, dia_registro) values (?,?,?, curdate())";
        
        try{
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, n.getLogin());
            stmt.setString(2, n.getSenha());
            stmt.setString(3, n.getEmail());
            stmt.execute();
            stmt.close();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
        con.close();}
        
    
    }
    
}

