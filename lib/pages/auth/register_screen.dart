import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hanzo/theme/app_colors.dart';

import '../../consts/consts.dart';
import '../../theme/theme.dart';
import '../pages.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Stack(
                        children: [
                          Column(
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
                              TextField(
                                controller: _nameController,
                                decoration:
                                    InputDecoration(hintText: Strings.name),
                              ),
                              TextField(
                                obscureText: true,
                                controller: _passwordController,
                                decoration:
                                    InputDecoration(hintText: Strings.password),
                              ),
                              TextField(
                                obscureText: true,
                                controller: _confirmPasswordController,
                                decoration: InputDecoration(
                                    hintText: Strings.confirmPassword),
                              ),
                              const SizedBox(height: 16),
                              Cbutton(
                                onPressed: () {
                                  if (_passwordController.text ==
                                      _confirmPasswordController.text) {}
                                },
                                text: Strings.register,
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                          Positioned(
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: IconButton(
                                      onPressed: () => Navigator.pop(context),
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: secondaryColor,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
