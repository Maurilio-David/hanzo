import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/blocs/blocs.dart';
import '../../consts/consts.dart';
import '../../theme/theme.dart';

import '../pages.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<OnboardingBloc, OnboardingState>(
            bloc: context.read<OnboardingBloc>(),
            builder: (context, state) {
              if (state is ShowOnboarding) {
                return CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 32),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            SvgPicture.asset(
                              Assets.logo,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 32),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            if (state.page == 0) ...[
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    SvgPicture.asset(
                                      Assets.welcome,
                                      width: 150,
                                    ),
                                    const SizedBox(height: 24),
                                    CardWidget(
                                      color: transparent,
                                      title: Strings.welcome,
                                      titleColor: primaryColor,
                                      subtitle: Strings.descriptionApp,
                                      subTitleColor: primaryColor,
                                    ),
                                    const SizedBox(height: 16),
                                    const ProgressWidget(
                                      progress: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ] else if (state.page == 1) ...[
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      Assets.register,
                                      width: 150,
                                    ),
                                    const SizedBox(height: 24),
                                    CardWidget(
                                      color: transparent,
                                      subtitle: Strings.instructionOne,
                                      subTitleColor: primaryColor,
                                    ),
                                    const SizedBox(height: 16),
                                    const ProgressWidget(
                                      progress: 2,
                                    ),
                                  ],
                                ),
                              )
                            ] else if (state.page == 2) ...[
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      Assets.movies,
                                      width: 150,
                                    ),
                                    const SizedBox(height: 24),
                                    CardWidget(
                                      color: transparent,
                                      subtitle: Strings.instructionTwo,
                                      subTitleColor: primaryColor,
                                    ),
                                    const SizedBox(height: 16),
                                    const ProgressWidget(
                                      progress: 3,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      sliver: SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Cbutton(
                              text: state.page == 2
                                  ? Strings.conclude
                                  : Strings.next,
                              onPressed: state.page == 2
                                  ? () {
                                      context.read<OnboardingBloc>().add(
                                            CompletedOnboarding(),
                                          );
                                      Navigator.pushReplacementNamed(
                                          context, '/singIn');
                                    }
                                  : () => context.read<OnboardingBloc>().add(
                                        ControllerPage(page: state.page + 1),
                                      ),
                            ),
                            if (state.page > 0)
                              Cbutton(
                                text: Strings.previous,
                                onPressed: () =>
                                    context.read<OnboardingBloc>().add(
                                          ControllerPage(page: state.page - 1),
                                        ),
                                secondButton: true,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
