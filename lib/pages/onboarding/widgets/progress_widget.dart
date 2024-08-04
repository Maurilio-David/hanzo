import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key, required this.progress});

  final int progress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          height: 16,
          width: 16,
          decoration: BoxDecoration(
            color: progress == 1 ? primaryColor : secondaryColor,
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          height: 16,
          width: 16,
          decoration: BoxDecoration(
            color: progress == 2 ? primaryColor : secondaryColor,
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          height: 16,
          width: 16,
          decoration: BoxDecoration(
            color: progress == 3 ? primaryColor : secondaryColor,
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ],
    );
  }
}
