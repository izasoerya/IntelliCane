class DataUser {
  DataUser({required this.role, required this.id, required this.password});

  String role;
  String id;
  String password;
}

void generateUserSample() {
  DataUser(id: "123456789", password: "123456789", role: "Patient");
  DataUser(id: "987654321", password: "987654321", role: "Guardian");
}
