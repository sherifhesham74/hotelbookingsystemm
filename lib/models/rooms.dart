class Room {
  final int id;
  final int hotelId;
  final String name;
  final double cost;
  final int? peopleCapacity;

  Room(
      {required this.id,
      required this.hotelId,
      required this.name,
      required this.cost,
      this.peopleCapacity});

  factory Room.fromJson(Map<String,dynamic> json){
    return Room(id: json['roomid'], hotelId: json['hotelid'], name: json['type'], cost: double.parse(json['cost'].toString()));
  }
}
