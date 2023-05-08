import 'package:flutter/material.dart';

class LoginCompunants {
  static const phonefieldBourder = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(18)),
      borderSide: BorderSide(width: 2, style: BorderStyle.solid));

  static const phonefieldBourderError = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(18)),
      borderSide:
          BorderSide(width: 2, style: BorderStyle.solid, color: Colors.red));

  InputDecoration phoneFormDecoration() {
    return const InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      counterText: "",
      focusedErrorBorder: phonefieldBourderError,
      errorBorder: phonefieldBourderError,
      focusedBorder: phonefieldBourder,
      enabledBorder: phonefieldBourder,
      hintText: "Enter Phone Number",
    );
  }
}
