class Users {
  final int? userid;
  final bool? isdeleted;
  final String role;
  final String name;
  final String password;
  final String email;
  final String photo;
  final String address;
  final List reservations;
  final List reviewClient;
  final List reviewHotels;
  final List rooms;

  Users({
      this.userid,
      this.isdeleted,
      required this.role,
      required this.name,
      required this.password,
      required this.email,
      required this.photo,
      required this.address,
      required this.reservations,
      required this.reviewClient,
      required this.reviewHotels,
      required this.rooms});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        userid: json['userid'],
        isdeleted: json['isdeleted'],
        role: json['role'],
        name: json['name'],
        password: json['password'],
        email: json['email'],
        photo: json['photo'],
        address: json['address'],
        reservations: json['reservations'],
        reviewClient: json['reviewClient'],
        reviewHotels: json['reviewHotels'],
        rooms: json['rooms']);
  }

  Map toMap() {
    var map = new Map();
    map["name"] = name;
    map["email"] = email;
    map["role"] = role;
    map["address"] = address;
    map["photo"] = photo;

    return map;
  }
}
