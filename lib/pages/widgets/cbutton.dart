import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class Cbutton extends StatelessWidget {
  const Cbutton({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: secondaryColor,
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppTextStyle.subTitleH1.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
