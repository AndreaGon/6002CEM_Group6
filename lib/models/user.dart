class Users {
  final String id;
  final String username;
  final String email;
  final String birthdate;
  final String gender;

  Users({
    required this.id,
    required this.username,
    required this.email,
    required this.birthdate,
    required this.gender,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'email': email,
    'gender': gender,
    'birthdate': birthdate,
  };

}