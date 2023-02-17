import 'package:flutter/material.dart';

import '../../features/login/view/screens/login_screen.dart';
import '../../repositories/auth_repository/auth_repository.dart';
import '../../styles/styles.dart';
import '../containers/custom_container.dart';

class CommonAppBar extends StatelessWidget implements PreferredSize {
  final String? title;

  const CommonAppBar({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      bgColor: white,
      child: AppBar(
        title: Text(
          title!,
          style: customFontStyle(
            fontColor: black,
            fontSize: 22,
            fontHeight: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await AuthRepository().signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (Route<dynamic> route) => false,
              );
            },
            icon: const Icon(
              Icons.logout,
              color: black,
            ),
          ),
        ],
        elevation: 2.5,
        shadowColor: black,
        centerTitle: true,
        backgroundColor: white,
        automaticallyImplyLeading: false,
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();
}
