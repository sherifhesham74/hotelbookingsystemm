
class Hotel{
  final String name;
  final String imageUrl;
  final double price;
  final int reviewsNumber;
  final int stars;
  final String locationCity;
  final double lat;
  final double lng;

  Hotel({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.reviewsNumber,
    required this.stars,
    required this.locationCity,
    required this.lat,
    required this.lng
  });
}