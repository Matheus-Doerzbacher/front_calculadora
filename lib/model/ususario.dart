class Usuario {
  final String email;
  final String name;
  final int age;
  final bool isAdmin;

  Usuario({
    required this.email,
    required this.name,
    required this.age,
    required this.isAdmin,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      email: json['email'],
      name: json['name'],
      age: json['age'],
      isAdmin: json['isAdmin'],
    );
  }
}
