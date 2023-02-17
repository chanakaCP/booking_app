import 'package:flutter/material.dart';

customTopToBottom({required Color top, required Color bottom}) =>
    LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        top,
        bottom,
      ],
    );
