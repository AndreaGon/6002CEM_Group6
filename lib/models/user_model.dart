class Users {
  final String id;
  final String username;
  final String email;
  final String birthdate;
  final String gender;
  final String rating;

  Users({
    required this.id,
    required this.username,
    required this.email,
    required this.birthdate,
    required this.gender,
    required this.rating,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'email': email,
    'gender': gender,
    'birthdate': birthdate,
    'rating': '0.0',
  };

}