package br.com.novel;


public class Novel {
    //usuario//
       private int id;
       private String login;
       private String senha;
       private String email;
       private int novoid;
       private int excluirid;
       private String data_registro;
       
       //novels_fav//
       private int idusuario;
       private int favnovels;
       
       //webnovels//
       private String nome;
       private String caminho_imagem;
       private String autor;
       private String genero1;
       private String genero2;
       private int ano_postagem;
       private int num_cap;
       private String sinopse;
       
       //capitulos//
       private int idnovel;
       private String conteudo;
       private String data_postagem;
       
       //novel_cap//
       private int idcap;
       
       
        public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNovoid() {
        return novoid;
    }

    public void setNovoid(int novoid) {
        this.novoid = novoid;
    }

    public int getExcluirid() {
        return excluirid;
    }

    public void setExcluirid(int excluirid) {
        this.excluirid = excluirid;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
    
    public String getEmail() {
    return email;
}

public void setEmail(String email) {
    this.email = email;
}


    //novelsfav//
    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public int getFavnovels() {
        return favnovels;
    }

    public void setFavnovels(int favnovels) {
        this.favnovels = favnovels;
    }

    //webnovels//
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCaminho_imagem() {
        return caminho_imagem;
    }

    public void setCaminho_imagem(String caminho_imagem) {
        this.caminho_imagem = caminho_imagem;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getGenero1() {
        return genero1;
    }

    public void setGenero1(String genero1) {
        this.genero1 = genero1;
    }

    public String getGenero2() {
        return genero2;
    }

    public void setGenero2(String genero2) {
        this.genero2 = genero2;
    }

    public int getAno_postagem() {
        return ano_postagem;
    }

    public void setAno_postagem(int ano_postagem) {
        this.ano_postagem = ano_postagem;
    }

    public int getNum_cap() {
        return num_cap;
    }

    public void setNum_cap(int num_cap) {
        this.num_cap = num_cap;
    }

    public String getSinopse() {
        return sinopse;
    }

    public void setSinopse(String sinopse) {
        this.sinopse = sinopse;
    }

    //capitulos//
    public int getIdnovel() {
        return idnovel;
    }

    public void setIdnovel(int idnovel) {
        this.idnovel = idnovel;
    }

    public String getConteudo() {
        return conteudo;
    }

    public void setConteudo(String conteudo) {
        this.conteudo = conteudo;
    }

    public String getData_postagem() {
        return data_postagem;
    }

    public void setData_postagem(String data_postagem) {
        this.data_postagem = data_postagem;
    }

    //novel_cap//
    public int getIdcap() {
        return idcap;
    }

    public void setIdcap(int idcap) {
        this.idcap = idcap;
    }
}
