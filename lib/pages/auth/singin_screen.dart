import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hanzo/pages/widgets/cbutton.dart';
import 'package:hanzo/theme/theme.dart';

import '../../consts/consts.dart';

class SinginScreen extends StatelessWidget {
  SinginScreen({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: Container(
        color: primaryColor,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              Assets.logo,
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              controller: _emailController,
                              decoration:
                                  InputDecoration(hintText: Strings.email),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              obscureText: true,
                              controller: _passwordController,
                              decoration:
                                  InputDecoration(hintText: Strings.password),
                            ),
                            const SizedBox(height: 16),
                            Cbutton(
                              onPressed: () {},
                              text: Strings.enter,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {},
                              child: SizedBox(
                                width: 150,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(Strings.enterWithGoogle),
                                    SizedBox(
                                      height: 20,
                                      child: Image.network(
                                          'http://pngimg.com/uploads/google/google_PNG19635.png',
                                          fit: BoxFit.cover),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                                child: Text(Strings.registerMsg))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
