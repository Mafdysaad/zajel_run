class TicketModel {
  final String companyName;
  final String seatClass;
  final String seatNumber;
  final String fromCode;
  final String fromCity;
  final String toCode;
  final String toCity;
  final String departureTime;
  final String arrivalTime;
  final String departureDate;
  final String arrivalDate;
  final String duration;

  const TicketModel({
    required this.companyName,
    required this.seatClass,
    required this.seatNumber,
    required this.fromCode,
    required this.fromCity,
    required this.toCode,
    required this.toCity,
    required this.departureTime,
    required this.arrivalTime,
    required this.departureDate,
    required this.arrivalDate,
    required this.duration,
  });
}
