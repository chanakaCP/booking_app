import 'package:rxdart/rxdart.dart';

import '../models/user/user.dart';

UserService userState = UserService();

class UserService {
  BehaviorSubject _controller = BehaviorSubject.seeded(AppUser.empty);

  Stream get stream => _controller.stream;

  AppUser get value => _controller.value;

  update(AppUser data) {
    _controller.add(data);
  }

  void dispose() {
    _controller.close();
  }
}
