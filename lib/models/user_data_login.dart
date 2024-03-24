class DataLoginUser {
  String id;
  String password;
  String role;

  DataLoginUser({required this.id, required this.password, required this.role});

  // Convert DataLoginUser to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'password': password,
      'role': role,
    };
  }

  // Create a DataLoginUser instance from a map
  factory DataLoginUser.fromMap(Map<String, dynamic> map) {
    return DataLoginUser(
      id: map['id'],
      password: map['password'],
      role: map['role'],
    );
  }

  @override
  String toString() {
    return 'DataUser{id: $id, password: $password, role: $role}';
  }
}
