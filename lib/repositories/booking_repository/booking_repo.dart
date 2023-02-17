import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/booking/booking.dart';

class BookingRepository {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  BookingRepository({FirebaseFirestore? firebaseFirestore}) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Future<void> saveBooking(Booking booking) async {
    try {
      CollectionReference _collectionRef = _firebaseFirestore.collection("booking");
      booking.bookingId = _collectionRef.doc().id;
      await _collectionRef.doc(_collectionRef.doc().id).set(booking.toMap());
      return;
    } on FirebaseException catch (e) {
      log("FirebaseException : ${e.toString()}");
      throw Exception(e.toString());
    } catch (e) {
      log("Exception : ${e.toString()}");
      throw Exception(e.toString());
    }
  }
}
