import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hanzo/pages/pages.dart';
import 'package:hanzo/theme/theme.dart';
import 'package:hanzo/utils/utils.dart';

import '../../consts/consts.dart';

class SinginScreen extends StatelessWidget {
  SinginScreen({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: PopScope(
        canPop: false,
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
                              CustomTextForm(
                                controller: _emailController,
                                hint: Strings.email,
                                validator: validateEmail,
                              ),
                              CustomTextForm(
                                controller: _passwordController,
                                hint: Strings.password,
                                validator: validatePassword,
                                obscure: true,
                              ),
                              const SizedBox(height: 16),
                              CustomButton(
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
                                      Container(
                                        margin: const EdgeInsets.only(left: 8),
                                        width: 16,
                                        child: SvgPicture.asset(
                                          Assets.google,
                                        ),
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
      ),
    );
  }
}
