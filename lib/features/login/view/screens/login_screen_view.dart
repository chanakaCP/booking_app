import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common_widgets/buttons/custom_button.dart';
import '../../../../common_widgets/containers/custom_container.dart';
import '../../../../common_widgets/images/custom_image.dart';
import '../../../../styles/app_colors.dart';
import '../../../../utils/constants/asset_const.dart';
import '../../../../utils/extentions/paddings_and_margins_ex.dart';
import '../../../landing/view/screens/landing_screen.dart';
import '../../bloc/login_bloc.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: CustomContainer(
        margin: 24.horizontal,
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LandingScreen(),
                  ),
                  (Route<dynamic> route) => false);
            }
            if (state is LoginFailedState) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage.isNotEmpty ? state.errorMessage : 'Authentication Failure'),
                  ),
                );
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImage(
                imagePath: logo,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: ((context, state) {
                  if (state is LoginInProgressState) {
                    return const CustomContainer(
                      marginTop: 100,
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return CustomButton(
                      text: "LOGIN",
                      marginTop: 100,
                      onPressed: () {
                        BlocProvider.of<LoginBloc>(context).add(UserAnnonLoginEvent());
                      },
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
