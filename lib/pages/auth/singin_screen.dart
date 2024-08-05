import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hanzo/pages/pages.dart';
import 'package:hanzo/theme/theme.dart';
import 'package:hanzo/utils/utils.dart';

import '../../consts/consts.dart';
import '../../data/blocs/blocs.dart';

class SinginScreen extends StatelessWidget {
  const SinginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: PopScope(
        canPop: false,
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
                            child: Form(
                              key: context.read<AuthBloc>().signinKey,
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
                                        .passwordController,
                                    hint: Strings.password,
                                    validator: validatePassword,
                                    obscure: true,
                                  ),
                                  const SizedBox(height: 16),
                                  if (state is! LoadingState) ...[
                                    CustomButton(
                                      onPressed: () {
                                        if (context
                                            .read<AuthBloc>()
                                            .signinKey
                                            .currentState!
                                            .validate()) {
                                          context
                                              .read<AuthBloc>()
                                              .add(const Login());

                                          if (context.read<AuthBloc>().logged) {
                                            Navigator.of(context)
                                                .pushNamedAndRemoveUntil(
                                                    '/home',
                                                    (Route<dynamic> route) =>
                                                        false);
                                          }
                                        }
                                      },
                                      text: Strings.enter,
                                    ),
                                  ],
                                  if (state is LoadingState) ...[
                                    Center(
                                      child: CircularProgressIndicator(
                                        color: primaryColor,
                                      ),
                                    )
                                  ] else if (state is ErrorState) ...[
                                    CardWidget(
                                      color: transparent,
                                      subtitle: Strings.resgiteredError,
                                      subTitleColor: primaryColor,
                                    ),
                                  ],
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  if (state is! LoadingState) ...[
                                    TextButton(
                                      onPressed: () {
                                        context
                                            .read<AuthBloc>()
                                            .add(const Clean());
                                        Navigator.pushNamed(
                                            context, '/register');
                                      },
                                      child: Text(Strings.registerMsg),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ));
        }),
      ),
    );
  }
}
