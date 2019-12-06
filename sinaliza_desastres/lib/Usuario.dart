class Usuario {

  String nome;
  String sobrenome;
  String email;
  String cpf;
  bool alerta;
  int distanciaAlerta;

  //construtor usuario simples
  Usuario(this.nome, this.sobrenome, this.email, this.cpf){
    this.alerta = false;
    this.distanciaAlerta = 0;
  }

  //construtor generico
  Usuario.completo(this.nome, this.sobrenome, this.email, this.cpf, this.alerta, this.distanciaAlerta);


  void t1 () {

    print("testeeee");
  }

}