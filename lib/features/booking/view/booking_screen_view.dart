import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common_widgets/buttons/custom_button.dart';
import '../../../common_widgets/containers/custom_container.dart';
import '../../../common_widgets/form_componants/custom_input_field.dart';
import '../../../common_widgets/images/custom_netword_image.dart';
import '../../../common_widgets/text/custom_text.dart';
import '../../../models/Hotel/hotel_room.dart';
import '../../../styles/app_colors.dart';
import '../../../styles/font_styles.dart';
import '../../../utils/extentions/border_radius_ex.dart';
import '../../../utils/extentions/paddings_and_margins_ex.dart';
import '../../../utils/validations/form_validatot.dart';
import '../../landing/view/screens/landing_screen.dart';
import '../bloc/booking_bloc.dart';

class BookingScreenView extends StatefulWidget {
  final HotelRoom room;
  BookingScreenView({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  State<BookingScreenView> createState() => _BookingScreenViewState();
}

class _BookingScreenViewState extends State<BookingScreenView> {
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingBloc, BookingState>(
      listener: (context, state) {
        if (state is BookingFailed) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage.isNotEmpty ? state.errorMessage : 'Booking Failure'),
              ),
            );
        }
        if (state is BookingSuccessed) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Booking Success')),
            );
        }
        if (state is BookingSuccessed) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LandingScreen(),
              ),
              (Route<dynamic> route) => false);
        }
      },
      child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              widget.room.image.isNotEmpty
                  ? CustomNetwordImage(
                      imagePath: widget.room.image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox.shrink(),
              CustomContainer(
                margin: 24.all,
                child: Column(
                  children: [
                    Column(
                      children: [
                        widget.room.title.isNotEmpty
                            ? CustomText(
                                text: widget.room.title,
                                textStyle: customFontStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              )
                            : const SizedBox.shrink(),
                        widget.room.description.isNotEmpty
                            ? CustomText(
                                marginTop: 10,
                                text: widget.room.description,
                                textStyle: customFontStyle(
                                  fontColor: black.withOpacity(0.75),
                                  fontSize: 14,
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.room.features.length > 5 ? 5 : widget.room.features.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(top: 7.5),
                            child: Row(
                              children: [
                                CustomContainer(
                                  height: 7.5,
                                  width: 7.5,
                                  borderRadius: 50.fullRadius,
                                  bgColor: black,
                                ),
                                Expanded(
                                  child: CustomText(
                                    text: widget.room.features[index],
                                    textAlign: TextAlign.left,
                                    containerAlignment: Alignment.centerLeft,
                                    marginLeft: 5,
                                    textStyle: customFontStyle(
                                      fontHeight: 13,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                    Form(
                      key: _formKey,
                      child: CustomInputField(
                        controller: controller,
                        hintText: "Your Name",
                        lableText: "Name",
                        validator: validateUserName,
                        margin: 25.top,
                      ),
                    ),
                    BlocBuilder<BookingBloc, BookingState>(
                      builder: (context, state) {
                        return CustomContainer(
                          margin: 25.top,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                        text: "From",
                                        textStyle: dateLableStyle(),
                                        marginRight: 25,
                                      ),
                                      CustomText(
                                        text: state.fromDate,
                                        textStyle: inputStyle(fontColor: black.withOpacity(0.5)),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      pickFromDate();
                                    },
                                    icon: const Icon(
                                      Icons.calendar_month,
                                      color: black,
                                      size: 27,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                        text: "To",
                                        textStyle: dateLableStyle(),
                                        marginRight: 25,
                                      ),
                                      CustomText(
                                        text: state.toDate,
                                        textStyle: inputStyle(fontColor: black.withOpacity(0.5)),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      pickToDate();
                                    },
                                    icon: const Icon(
                                      Icons.calendar_month,
                                      color: black,
                                      size: 27,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    CustomContainer(
                      marginTop: 25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: widget.room.price.isNotEmpty ? "Total (${widget.room.price}LKR per night) " : "Total ",
                            textStyle: dateLableStyle(),
                          ),
                          BlocBuilder<BookingBloc, BookingState>(
                            builder: (context, state) {
                              return CustomText(
                                text: "${state.totalPrice} LKR",
                                textStyle: inputStyle(fontColor: black.withOpacity(0.5)),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<BookingBloc, BookingState>(builder: ((context, state) {
                      if (state is BookingLoading) {
                        return const CustomContainer(
                          marginTop: 25,
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return CustomButton(
                          text: "BOOK",
                          marginTop: 25,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<BookingBloc>(context).add(OnBookingStartEvent(
                                username: controller.text.trim(),
                                roomId: widget.room.id,
                              ));
                            }
                          },
                        );
                      }
                    })),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  pickFromDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null) {
      BlocProvider.of<BookingBloc>(context).add(OnFromDateChangeEvent(pickedDate: pickedDate));
    }
  }

  pickToDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: BlocProvider.of<BookingBloc>(context).state.fromDate.isNotEmpty
          ? DateTime.parse(BlocProvider.of<BookingBloc>(context).state.fromDate).add(const Duration(days: 1))
          : DateTime.now().add(const Duration(days: 2)),
      firstDate: BlocProvider.of<BookingBloc>(context).state.fromDate.isNotEmpty
          ? DateTime.parse(BlocProvider.of<BookingBloc>(context).state.fromDate)
          : DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null) {
      BlocProvider.of<BookingBloc>(context).add(OnToDateChangeEvent(pickedDate: pickedDate));
    }
  }
}
