import 'package:equatable/equatable.dart';

class Booking extends Equatable {
  DateTime? from;
  DateTime? to;
  String? bookingId;
  String roomId;
  String userId;
  String userName;
  String totalPrice;

  Booking({
    required this.bookingId,
    required this.roomId,
    required this.userId,
    required this.from,
    required this.to,
    required this.totalPrice,
    required this.userName,
  });

  Map<String, dynamic> toMap() {
    return {
      'bookingId': bookingId,
      'roomId': roomId,
      'userId': userId,
      'from': from!.toString(),
      'to': to!.toString(),
      'userName': userName,
      'totalPrice': totalPrice,
    };
  }

  factory Booking.fromJson(Map<String, dynamic> map) {
    return Booking(
      bookingId: map['bookingId'] ?? '',
      roomId: map['roomId'] ?? '',
      userId: map['userId'] ?? "",
      userName: map['userName'] ?? "",
      totalPrice: map['totalPrice'] ?? "",
      from: DateTime.parse(map['from']),
      to: DateTime.parse(map['to']),
    );
  }

  @override
  List<Object?> get props => [
        bookingId,
        roomId,
        userId,
        userName,
        from,
        to,
        totalPrice,
      ];
}
