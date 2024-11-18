package br.com.conexao;

import java.sql.Connection;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) throws SQLException {
    
    Connection con = CriarConexao.getConexao();
    
    }
}
