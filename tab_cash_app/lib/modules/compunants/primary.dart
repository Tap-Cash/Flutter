import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tab_cash_app/constants/colors.dart';

Widget PraimaryButton(String text, double medWidth, function) {
  return ElevatedButton(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      )),
      backgroundColor: MaterialStatePropertyAll(
        AppColors.primaryColor,
      ),
    ),
    onPressed: function,
    child: Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
  // Container(
  //   decoration: BoxDecoration(
  // color: AppColors.primaryColor, borderRadius: BorderRadius.circular(18)),
  //   width: 151,
  //   height: 48,
  //   child: Center(
  //     child: Text(
  //       text,
  //       style: TextStyle(color: Colors.white, fontSize: 20),
  //     ),
  //   ),
  // );
}

Widget logo() {
  return Container(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Image.asset(
        'assets/images/logo.jpg',
        width: 75,
      ),
    ),
  );
}
