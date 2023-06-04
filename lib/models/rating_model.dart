class Rating {
  final String id;
  final String ratedBy;
  final String rating;

  Rating({
    required this.id,
    required this.ratedBy,
    required this.rating
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'ratedBy': ratedBy,
    'rating': rating
  };

}

class RatingRegis{
  final String id;
  final String username;

  RatingRegis({
    required this.id,
    required this.username
  });

  Map<String, dynamic> toJson() =>{
    'id': id,
    'username': username
  };
}