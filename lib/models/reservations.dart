class Reservation {
  final int? reservationid;
  final String? hotelName;
  final int? hotelid;
  final int roomid;
  final int clientid;
  final String? roomType;
  final int? roomsNumber;
  final String startDate;
  final String endDate;
  final int? daysNumber;
  final double cost;

  Reservation({this.hotelName,
    this.hotelid,
    required this.clientid,
    required this.roomid,
    this.reservationid,
    this.roomType,
    this.roomsNumber,
    required this.startDate,
    required this.endDate,
    required this.cost,
    this.daysNumber});

  factory Reservation.fromjson(Map<String, dynamic> json){
    return Reservation(clientid: json['clientid'],
        reservationid: json['reserveid'],
        roomid: json['roomid'],
        startDate: json['startdate'],
        endDate: json['enddate'],
        cost: double.parse(json['totalcost'].toString()),
        roomsNumber: json['number']
    );
  }
}
