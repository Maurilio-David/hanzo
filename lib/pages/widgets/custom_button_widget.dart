import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.secondButton = false});

  final String text;
  final VoidCallback? onPressed;
  final bool secondButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: secondButton ? secondaryColor : primaryColor,
        side: BorderSide(
          width: 1,
          color: secondButton ? primaryColor : secondaryColor,
        ),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppTextStyle.subTitleH1
                .copyWith(fontSize: 16)
                .copyWith(color: secondButton ? primaryColor : secondaryColor),
          ),
        ],
      ),
    );
  }
}
