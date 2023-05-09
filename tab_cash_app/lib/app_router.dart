import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tab_cash_app/constants/strings.dart';
import 'package:tab_cash_app/data/repo/users_repo.dart';
import 'package:tab_cash_app/data/web/user_web_servies.dart';
import 'package:tab_cash_app/modules/home/cubit/home_cubit.dart';

import 'modules/authentication/login/login_screen.dart';
import 'modules/home/home_screen.dart';

class AppRouter {
  late UsersRepo usersRepo;
  late HomeCubit homeCubit;

  AppRouter() {
    usersRepo = UsersRepo(UserWebServies());
    homeCubit = HomeCubit(usersRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterStrings.homeRouteString:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => homeCubit,
                  child: const HomeScreen(),
                ));
      case AppRouterStrings.loginRouteString:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
