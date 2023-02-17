import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/Hotel/hotel_room.dart';
import '../../models/booking/booking.dart';
import '../../services/user_service.dart';

class MyBookingRepo {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  MyBookingRepo({FirebaseFirestore? firebaseFirestore}) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Future<List<HotelRoom>> getMyBookings() async {
    try {
      final result = await _firebaseFirestore.collection("booking").where("userId", isEqualTo: userState.value.userId).get();
      List<Booking> booking = [];
      final List<String> bookingIds = [];
      for (var element in result.docs) {
        booking.add(Booking.fromJson(element.data()));
      }
      bookingIds.addAll(booking.map((e) => e.roomId).toList());
      log("bookingIds.length.toString()");
      log(bookingIds.length.toString());
      return _getAllHotelsById(bookingIds);
    } on FirebaseException catch (e) {
      log("FirebaseException : ${e.toString()}");
      throw Exception(e.toString());
    } catch (e) {
      log("Exception : ${e.toString()}");
      throw Exception(e.toString());
    }
  }

  Future<List<HotelRoom>> _getAllHotelsById(List<String> roomId) async {
    try {
      final result = await _firebaseFirestore.collection("room").where("room_id", whereIn: roomId).get();
      log("result.length.toString()");
      log(result.docs.length.toString());
      List<HotelRoom> hotelRooms = [];

      for (var element in result.docs) {
        hotelRooms.add(HotelRoom.fromJson(element.data()));
      }

      log("hotelRooms.length.toString()");
      log(hotelRooms.length.toString());
      return hotelRooms;
    } on FirebaseException catch (e) {
      log("FirebaseException : ${e.toString()}");
      throw Exception(e.toString());
    } catch (e) {
      log("Exception : ${e.toString()}");
      throw Exception(e.toString());
    }
  }
}
