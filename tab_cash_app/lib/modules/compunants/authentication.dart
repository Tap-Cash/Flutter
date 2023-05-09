import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginCompunants {
  static const phonefieldBourder = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(18)),
      borderSide: BorderSide(width: 2, style: BorderStyle.solid));

  static const phonefieldBourderError = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(18)),
      borderSide:
          BorderSide(width: 2, style: BorderStyle.solid, color: Colors.red));

  static showDialogLoading(context) => showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text(
                    "Loading...",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );

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

class passwordCompunants {
  static PinTheme stextFieldTheme = PinTheme(
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(5),
    fieldHeight: 50,
    fieldWidth: 40,
    activeColor: Colors.transparent,
    inactiveColor: Colors.transparent,
    selectedColor: Colors.transparent,
    activeFillColor: Colors.transparent,
    inactiveFillColor: Colors.transparent,
    selectedFillColor: Colors.transparent,
  );
}
