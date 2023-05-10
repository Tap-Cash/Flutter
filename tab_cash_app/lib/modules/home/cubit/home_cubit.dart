import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tab_cash_app/data/models/user_data.dart';
import 'package:tab_cash_app/data/repo/users_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final UsersRepo userRepo;
  UserDataModel userBloc = UserDataModel(firstName: 'test');
  HomeCubit(this.userRepo) : super(HomeInitial());

  UserDataModel gitUsersBloc() {
    userRepo.saveUserRepo().then((userBloc) {
      emit(UserLoaded(userBloc));
      print('${userBloc.firstName} home cubit');
      this.userBloc = userBloc;
    });
    return userBloc;
  }
}
