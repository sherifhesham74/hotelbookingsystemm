class Reservation {
  int? reservationid;
  String? hotelName;
  int? hotelid;
  int? roomid;
  int? clientid;
  String? roomType;
  int? roomsNumber;
  String? startDate;
  String? endDate;
  int? daysNumber;
  double? cost;

  Reservation(
      {this.hotelName,
      this.hotelid,
      required this.clientid,
      required this.roomid,
      this.reservationid,
      this.roomType,
      this.roomsNumber,
      this.startDate,
       this.endDate,
       this.cost,
      this.daysNumber});

  factory Reservation.fromjson(Map<String, dynamic> json) {
    return Reservation(
        clientid: json['clientid'],
        reservationid: json['reserveid'],
        roomid: json['roomid'],
        startDate: json['startdate'],
        endDate: json['enddate'],
        cost: double.parse(json['totalcost'].toString()),
        roomsNumber: json['number']);
  }

  Reservation.fromMap(Map<String, dynamic> res) {
    clientid = res['clientid'];
    reservationid = res['reserveid'];
    roomid = res['roomid'];
    startDate = res['startdate'];
    endDate = res['enddate'];
    cost = res['totalcost'];
    roomsNumber = res['number'];
  }
}
