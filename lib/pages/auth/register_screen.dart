import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hanzo/theme/app_colors.dart';
import 'package:hanzo/utils/utils.dart';

import '../../consts/consts.dart';
import '../../data/blocs/blocs.dart';
import '../../theme/theme.dart';
import '../pages.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          context.read<AuthBloc>().add(
                const Clean(),
              );
          return;
        },
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          return Scaffold(
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
                          if (state is InitialState) ...[
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Stack(
                                children: [
                                  Form(
                                    key: context.read<AuthBloc>().registerKey,
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(
                                          Assets.logo,
                                        ),
                                        const SizedBox(height: 16),
                                        CustomTextForm(
                                          controller: context
                                              .read<AuthBloc>()
                                              .emailController,
                                          hint: Strings.email,
                                          validator: validateEmail,
                                        ),
                                        CustomTextForm(
                                          controller: context
                                              .read<AuthBloc>()
                                              .nameController,
                                          hint: Strings.name,
                                          validator:
                                              validateNotBlankAndNoNumbers,
                                        ),
                                        CustomTextForm(
                                          controller: context
                                              .read<AuthBloc>()
                                              .passwordController,
                                          hint: Strings.password,
                                          obscure: true,
                                          validator: validatePassword,
                                        ),
                                        CustomTextForm(
                                          controller: context
                                              .read<AuthBloc>()
                                              .confirmPasswordController,
                                          hint: Strings.confirmPassword,
                                          obscure: true,
                                          validator: (value) =>
                                              validateConfirmPassword(
                                                  value,
                                                  context
                                                      .read<AuthBloc>()
                                                      .passwordController
                                                      .text),
                                        ),
                                        const SizedBox(height: 16),
                                        CustomButton(
                                          onPressed: () {
                                            if (context
                                                .read<AuthBloc>()
                                                .registerKey
                                                .currentState!
                                                .validate()) {
                                              context.read<AuthBloc>().add(
                                                    const Register(),
                                                  );
                                            }
                                          },
                                          text: Strings.register,
                                        ),
                                        const SizedBox(height: 16),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: IconButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
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
                            ),
                          ] else if (state is LoadingState) ...[
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: CircularProgressIndicator(
                                      color: primaryColor,
                                    ),
                                  ),
                                  CardWidget(
                                    color: transparent,
                                    subtitle: Strings.loading,
                                    subTitleColor: primaryColor,
                                  ),
                                ],
                              ),
                            )
                          ] else if (state is LoggedState) ...[
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Icon(
                                        Icons.check,
                                        color: secondaryColor,
                                        size: 40,
                                      )),
                                  CardWidget(
                                    color: transparent,
                                    subtitle: Strings.successfullyRegistered,
                                    subTitleColor: primaryColor,
                                  ),
                                  CustomButton(
                                      text: Strings.backToLogin,
                                      onPressed: () {
                                        context.read<AuthBloc>().add(
                                              const Back(),
                                            );
                                        Navigator.pop(context);
                                      })
                                ],
                              ),
                            )
                          ] else if (state is ErrorState) ...[
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Icon(
                                        Icons.close,
                                        color: secondaryColor,
                                        size: 40,
                                      )),
                                  CardWidget(
                                    color: transparent,
                                    subtitle: Strings.resgiteredError,
                                    subTitleColor: primaryColor,
                                  ),
                                  CustomButton(
                                      text: Strings.backToLogin,
                                      onPressed: () {
                                        context.read<AuthBloc>().add(
                                              const Back(),
                                            );
                                        Navigator.pop(context);
                                      })
                                ],
                              ),
                            )
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
