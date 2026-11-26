class AppUser {
  final String id;
  final String email;
  final String name;

  /// get user data from firestore
  AppUser({required this.id, required this.email, required this.name});
  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
    );
  }

  /// store data from firestore
  Map<String, Object?> toJson() {
    return {"id": id, "email": email, "name": name};
  }
}
