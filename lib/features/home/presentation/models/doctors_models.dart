class Doctor {
  final String name;
  final String specialty;
  final String image;
  final double rating;
  final String reviewsCount;
  final String availableTime;
  final String sessionPrice;
  final String discount;
  final String location;
  bool isFavorite;

  Doctor({
    required this.name,
    required this.specialty,
    required this.image,
    required this.rating,
    required this.reviewsCount,
    required this.availableTime,
    required this.sessionPrice,
    required this.discount,
    required this.location,
    this.isFavorite = false,
  });
}


