import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tab_cash_app/app_router.dart';

import 'app_start_point.dart';

//App main
void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent)); // hide status bar

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}
