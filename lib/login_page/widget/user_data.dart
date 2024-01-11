class DataUser {
  String id;
  String password;
  String role;

  DataUser({required this.id, required this.password, required this.role});

  // Convert DataUser to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'password': password,
      'role': role,
    };
  }

  // Create a DataUser instance from a map
  factory DataUser.fromMap(Map<String, dynamic> map) {
    return DataUser(
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
