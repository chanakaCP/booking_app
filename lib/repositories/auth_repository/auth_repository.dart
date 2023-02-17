import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../../models/user/user.dart';
import '../../services/user_service.dart';

class AuthRepository {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  AuthRepository({FirebaseAuth? firebaseAuth}) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<bool> isLoggedIn() async {
    User? user = _firebaseAuth.currentUser;
    log("USER : ${user.toString()}");
    if (user != null) {
      userState.update(AppUser(userId: user.uid));
      return true;
    } else {
      return false;
    }
  }

  Future<void> anonymousLogin() async {
    try {
      final UserCredential result = await _firebaseAuth.signInAnonymously();
      userState.update(AppUser(userId: result.user!.uid));
      log("Login Success");
      log("result  : ${result.user.toString()}");
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException : ${e.toString()}");
      throw Exception(e.toString());
    } catch (e) {
      log("Exception : ${e.toString()}");
      throw Exception(e.toString());
    }
  }

  Future<void> signOut() async {
    userState.update(AppUser.empty);
    await _firebaseAuth.signOut();
    return;
  }
}
