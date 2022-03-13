class Reservation {
  final String hotelName;
  final String roomType;
  final int roomsNumber;
  final String startDate;
  final String endDate;
  final int daysNumber;
  final double cost;

  Reservation(
      {required this.hotelName,
      required this.roomType,
      required this.roomsNumber,
      required this.startDate,
      required this.endDate,
      required this.cost,
      required this.daysNumber});
}
