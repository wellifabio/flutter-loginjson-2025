class User {
  int id;
  String nome;
  String email;
  String senha;

  User({
    required this.id,
    required this.nome,
    required this.email,
    required this.senha,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'nome': nome, 'email': email, 'senha': senha};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      senha: map['senha'],
    );
  }

  @override
  String toString() {
    return 'User(id: $id, nome: $nome, email: $email, senha: $senha)';
  }
}
