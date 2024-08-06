import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanzo/pages/pages.dart';
import '../../consts/consts.dart';
import '../../data/blocs/blocs.dart';
import '../../theme/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetMovies());
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            Strings.movies,
            style: AppTextStyle.titleH1.copyWith(color: primaryColor),
          ),
          leading: IconButton(
            onPressed: () async {
              context.read<AuthBloc>().add(const Logout());
              bool logged = await context.read<AuthBloc>().getUserLogged();

              if (logged && context.mounted) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.signinRoute, (Route<dynamic> route) => false);
              } else if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: errorColor,
                    content: Text(Strings.errorTryAgain),
                  ),
                );
              }
            },
            icon: Icon(
              Icons.login_outlined,
              color: primaryColor,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () => context.read<HomeBloc>().add(GetMovies()),
                icon: Icon(
                  Icons.refresh,
                  color: primaryColor,
                ))
          ],
        ),
        backgroundColor: secondaryColor,
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            } else if (state is HomeLoadedState) {
              return ListView.builder(
                  itemCount: state.movies.length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          textColor: primaryColor,
                          tileColor: primaryColor,
                          contentPadding: const EdgeInsets.all(8),
                          leading: Image.network(
                            state.movies[index].posterPath!,
                            fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              );
                            },
                          ),
                          title: Column(
                            children: [
                              Text(state.movies[index].title!,
                                  style: AppTextStyle.subTitleH1),
                            ],
                          ),
                        ),
                      ));
            } else {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
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
                        subtitle: Strings.errorTryAgain,
                        subTitleColor: primaryColor,
                      ),
                      CustomButton(
                        text: Strings.tryAgain,
                        onPressed: () {
                          context.read<HomeBloc>().add(
                                GetMovies(),
                              );
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
