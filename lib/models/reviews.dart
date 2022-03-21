class Review{
  final String description;
  final String? happiness;
  String? username;
  final int? hotelid;
  final int? userid;

  Review({
    this.username = 'ahmed',
    this.hotelid,
    this.userid,
    required this.description,
    this.happiness,

});

  factory Review.fromJson(Map<String,dynamic> json){
    return Review(hotelid: json['hotelid'],description: json['review1'], userid: json['clientid'],happiness: json['ishappy']);
  }
}