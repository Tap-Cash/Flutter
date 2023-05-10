import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tab_cash_app/app_router.dart';

import 'app_start_point.dart';
import 'constants/bloc_observe.dart';

//App main
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent)); // hide status bar

  Bloc.observer = MyBlocObserver();

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}
