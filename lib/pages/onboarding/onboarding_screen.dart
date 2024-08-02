import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages.dart';

import '../../consts/consts.dart';
import '../../theme/theme.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  Future<void> _completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingComplete', true);
    Navigator.pushReplacementNamed(context, '/singIn');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              sliver: SliverList.list(
                children: [
                  SvgPicture.asset(
                    Assets.logo,
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              sliver: SliverList.list(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CardWidget(
                          title: Strings.welcome,
                          titleColor: darkColor,
                          subtitle: Strings.descriptionApp,
                          subTitleColor: secondaryColor,
                        ),
                        CardWidget(
                          color: darkColor,
                          subtitle: Strings.instructionOne,
                          subTitleColor: primaryColor,
                        ),
                        CardWidget(
                          subtitle: Strings.instructionOne,
                          subTitleColor: darkColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Cbutton(
                        text: Strings.conclude,
                        onPressed: () => _completeOnboarding(context),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
