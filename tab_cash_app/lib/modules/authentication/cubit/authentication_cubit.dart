import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tab_cash_app/data/web/user_web_servies.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());
}

class loginCubit extends Cubit<AuthenticationState> {
  loginCubit() : super(AuthenticationInitial());

  void gitUsersBloc(String phoneNumber) async {
    emit(LoginLodingState());
    int webStatusCode = await UserWebServies().getUserByPhone(phoneNumber);
    switch (webStatusCode) {
      case 200:
        emit(LoginSucsessState(webStatusCode));
        break;
      default:
        emit(LoginErrorState(webStatusCode));
    }
  }
}
