import 'package:tab_cash_app/data/web/user_web_servies.dart';

import '../models/user_data.dart';

class UsersRepo {
  final UserWebServies userWebServies;
  UsersRepo(this.userWebServies);

  Future<UserDataModel> saveUserRepo() async {
    final userDataJason = await userWebServies.getUserById();
    UserDataModel userData = UserDataModel.formJason(userDataJason);
      print('${userData.firstName} home repo');
    return userData;
  }
}
