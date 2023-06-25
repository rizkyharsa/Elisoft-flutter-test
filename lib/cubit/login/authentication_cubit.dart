import 'package:bloc/bloc.dart';
import 'package:elisoft_flutter_test/cubit/login/authentication_state.dart';
import 'package:elisoft_flutter_test/repositories/authentication_repository.dart';
import 'package:elisoft_flutter_test/utils/pref_util.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  Future<void> login(String email, String password) async {
    emit(AuthenticationLoading());
    try {
      final account = await AuthenticationRepository().authentication(email, password);
      await SharedPref().saveSession(account.name.toString(), account.email.toString());
      // await Future.delayed(const Duration(seconds: 2));
      emit(AuthenticationSuccess(user: account));
    } catch (e) {
      emit(AuthenticationError(error: "$e"));
    }
  }
}
