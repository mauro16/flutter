import 'package:makemebela/blocs/login-bloc/button_state.dart';
import 'package:makemebela/blocs/login-bloc/field_state.dart';
import 'package:makemebela/blocs/login-bloc/login_bloc_state.dart';
import 'package:makemebela/validator/login_validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with LoginValidator {
  final _stateController = BehaviorSubject<LoginBlocState>.seeded(
    LoginBlocState(LoginState.IDLE),
  );
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Stream<LoginBlocState> get outState => _stateController.stream;

  Stream<FieldState> get outEmail =>
      _emailController.stream.transform(emailValidator);
  //CombineLatestStream.combine2(
  //        _passwordController.stream.transform(passwordValidator),
  //        outState,
  //       (a, b) {
  //        a.enabled = b.state != LoginState.LOADING;
  //        return a;
  //      },
  //    );
  Stream<FieldState> get outPassword =>
      _passwordController.stream.transform(passwordValidator);

  Stream<ButtonState> get outLoginButton => CombineLatestStream.combine3(
        outEmail,
        outPassword,
        outState,
        (a, b, c) {
          return ButtonState(
            loading: c.state == LoginState.LOADING,
            enable: a.error == null &&
                b.error == null &&
                c.state != LoginState.LOADING,
          );
        },
      );
  void loginWithEmail() async {
    _stateController.add(
      LoginBlocState(LoginState.LOADING),
    );
    await Future.delayed(
      Duration(seconds: 3),
    );
    _stateController.add(
      LoginBlocState(LoginState.DONE),
    );
  }

  void dispose() {
    _stateController.close();
    _emailController.close();
    _passwordController.close();
  }
}
