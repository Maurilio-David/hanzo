import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanzo/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/blocs/blocs.dart';
import 'firebase_options.dart';
import 'router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.appRouter,
  });

  final AppRouter appRouter;

  Future<bool> _checkOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboardingComplete') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: _checkOnboarding(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              home: Scaffold(
                body: Center(
                    child: CircularProgressIndicator(
                  color: primaryColor,
                )),
              ),
            );
          } else {
            final showOnboarding = !snapshot.data!;
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => OnboardingBloc(),
                ),
                BlocProvider(
                  create: (context) => AuthBloc(),
                ),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Hanzo',
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                initialRoute: showOnboarding ? '/' : '/singIn',
                onGenerateRoute: appRouter.onGenerateRoute,
              ),
            );
          }
        });
  }
}
