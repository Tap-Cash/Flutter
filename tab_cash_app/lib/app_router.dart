import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tab_cash_app/constants/strings.dart';
import 'package:tab_cash_app/data/repo/users_repo.dart';
import 'package:tab_cash_app/data/web/user_web_servies.dart';
import 'package:tab_cash_app/modules/authentication/cubit/authentication_cubit.dart';
import 'package:tab_cash_app/modules/authentication/login/password_screen.dart';
import 'package:tab_cash_app/modules/authentication/signup_screen.dart';
import 'package:tab_cash_app/modules/home/cubit/home_cubit.dart';
import 'modules/authentication/login/login_screen.dart';
import 'modules/home/home_screen.dart';

// create app routing class to anvifate throw application
class AppRouter {
  // create my cubits
  late UsersRepo usersRepo;
  late HomeCubit homeCubit;
  late AuthenticationCubit authenticationCubit;

  // create AppRouter contractor
  AppRouter() {
    // declared my cubits
    usersRepo = UsersRepo(UserWebServies());
    homeCubit = HomeCubit(usersRepo);
    authenticationCubit = AuthenticationCubit();
  }

  // create routing method
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterStrings.loginRouteString: // start with login
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => authenticationCubit,
            child: const LoginScreen(),
          ),
        );

      // case AppRouterStrings.passwordRouteString: // password page
      //   return MaterialPageRoute(builder: (_) => const PasswordScreen());

      case AppRouterStrings.signupRouteString: // signup page
        return MaterialPageRoute(builder: (_) => const SignupScreen());

      case AppRouterStrings
          .navigationBarRouteString: // navigation bar start with home page
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => homeCubit,
            child: const HomeScreen(),
          ),
        );
    }
  }
}
