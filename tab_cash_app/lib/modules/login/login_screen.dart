import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:extended_phone_number_input/consts/enums.dart';
import 'package:extended_phone_number_input/phone_number_controller.dart';
import 'package:extended_phone_number_input/phone_number_input.dart';
import 'package:flutter/material.dart';
import 'package:tab_cash_app/constants/media_query_values.dart';
import '../../constants/strings.dart';
import '../compunants/login.dart';
import '../compunants/primary.dart';
import 'package:http/http.dart' as http;

import '../signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  Future<int> gitRespons() async {
    try {
      String getTry = '${AppEndPoints.usersPhoneUrl}${controller.text}';
      Response response = await Dio().get(getTry);
      return response.statusCode!;
    } catch (e) {
      print('error');
      return 1;
    }
  }

  signInOnTab(context) async {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          content: CircularProgressIndicator(),
        );
      },
    );
    var resInt = await gitRespons();
    print(resInt);
    switch (resInt) {
      case 200:
        print('Sucsses');
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SignupScreen(),
        ));
        break;
      case 404:
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("Error"),
              content: Text("This phone number is not registered."),
              icon: Icon(
                size: 40,
                Icons.error,
                color: Colors.red,
              ),
            );
          },
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQueryValues(context).height / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              logo(),
              Container(
                height: 75,
                width: MediaQueryValues(context).width * 0.80,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10, left: 30),
                      height: 48,
                      width: MediaQueryValues(context).width * 0.20,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(18))),
                      child: const Text(
                        '+20',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      width: MediaQueryValues(context).width * 0.60,
                      child: phoneFormField(),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 48,
                    width: 151,
                    child: PraimaryButton(
                        'Sign in', MediaQueryValues(context).width, () {
                      signInOnTab(context);
                    }),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, AppRouterStrings.homeRouteString);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQueryValues(context).width * 0.60,
                      height: 30,
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'dont have account     '),
                            TextSpan(
                              text: 'Sign UP',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  phoneFormField() {
    String? phoneValidateor(value) {
      String pattern = r'^01[0-2,5]{1}[0-9]{8}$';
      RegExp regExp = new RegExp(pattern);
      if (value!.length < 10) {
        return 'Please enter mobile number';
      } else if (!regExp.hasMatch(value)) {
        return 'Please enter valid mobile number';
      }
    }

    return Form(
      key: formKey,
      child: TextFormField(
        maxLength: 11,
        cursorColor: Colors.black,
        style: TextStyle(fontSize: 20),
        controller: controller,
        decoration: LoginCompunants().phoneFormDecoration(),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          formKey.currentState?.validate();
        },
        validator: (value) {
          return phoneValidateor(value);
        },
      ),
    );
  }
}
