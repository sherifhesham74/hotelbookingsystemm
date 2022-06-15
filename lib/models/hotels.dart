class Hotel {
  final int? hotelid;
  final String name;
  final String imageUrl;
  final double? price;
  final int? reviewsNumber;
  final int? stars;
  final String locationCity;
  final double? lat;
  final double? lng;
  final List? rooms;
  final List? reviews;

  Hotel(
      {required this.name,
      this.hotelid,
      required this.imageUrl,
      this.price,
      this.reviewsNumber,
      this.stars,
      required this.locationCity,
      this.lat,
      this.rooms,
      this.reviews,
      this.lng});

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
        hotelid: json['userid'],
        name: json['name'],
        imageUrl: json['photo'],
        reviews: json['reviewHotels'],
        rooms: json['rooms'],
        lat: json['lat'],
        lng: json['lng'],
        locationCity: json['address']);
  }
}
