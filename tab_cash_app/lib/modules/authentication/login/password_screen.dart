import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tab_cash_app/modules/compunants/authentication.dart';
import '../../../constants/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordScreen extends StatefulWidget {
  final String phoneNumper;
  const PasswordScreen({super.key, required this.phoneNumper});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  TextEditingController textEditingController = TextEditingController();

  final TextEditingController passworController = TextEditingController();
  final FocusNode pinFocusNode = FocusNode();

  Future<void> sharedIdSave(phoneNumber, userId) async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('phoneNumber', phoneNumber);
    sharedPreferences.setString('userId', userId);
  }

  Future<int> gitRespons() async {
    try {
      String getTry = AppEndPoints.loginUrl;
      Object body = {
        "phone": widget.phoneNumper,
        "password": '${passworController.text}789'
      };
      Response response = await Dio().post(getTry, data: body);
      sharedIdSave(widget.phoneNumper, response.data["userID"]);
      print(response.data["userID"]);
      return response.statusCode!;
    } catch (e) {
      debugPrint('error');
      return 1;
    }
  }

  passwordOnComplete() async {
    LoginCompunants.showDialogLoading(context);
    var resInt = await gitRespons();
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    debugPrint(resInt.toString());
    Navigator.of(context).pop();
    switch (resInt) {
      case 200:
        debugPrint('Sucsses');
        debugPrint(sharedPref.getString('phoneNumber'));
        debugPrint(sharedPref.getString('userId'));

        Navigator.of(context)
            .pushReplacementNamed(AppRouterStrings.homeRouteString);
        break;
      default:
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("Error"),
              content: Text("Incorrect Password"),
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
      appBar: AppBar(
        title: Text("Password Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Focus(
              // this pin code is invisible (all colors is transparent)
              // to keep onle the dots visible -----------------------------------------
              child: PinCodeTextField(
                focusNode: pinFocusNode,
                autoFocus: true,
                appContext: context,
                length: 6,
                keyboardType: TextInputType.number,
                controller: passworController,
                onChanged: (value) {
                  setState(() {});
                  debugPrint(passworController.text);
                },
                onCompleted: (_) {
                  passwordOnComplete();
                },
                onSubmitted: (value) {
                  pinFocusNode
                      .requestFocus(); // Keep the keybouard on submitting
                },
                pinTheme: passwordCompunants.stextFieldTheme,
                textStyle: TextStyle(color: Colors.transparent),
              ),
            ),
            SizedBox(height: 16),
            // this is a row of 6 dots that change color occording to the input field -------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                6,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index < passworController.text.length
                        ? Colors.grey.shade800
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
