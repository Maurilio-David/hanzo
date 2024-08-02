import 'package:flutter/material.dart';
import 'package:hanzo/theme/theme.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {super.key,
      this.title,
      required this.subtitle,
      this.titleColor,
      required this.subTitleColor,
      this.color});

  final String? title;
  final String subtitle;
  final Color? titleColor;
  final Color subTitleColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color ?? primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          if (title != null && title!.isNotEmpty)
            Text(
              title!,
              style:
                  AppTextStyle.titleH1.copyWith(color: titleColor ?? darkColor),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              subtitle,
              style: AppTextStyle.subTitleH1.copyWith(color: subTitleColor),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
