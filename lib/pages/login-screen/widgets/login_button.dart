import 'package:flutter/material.dart';
import 'package:makemebela/blocs/login-bloc/button_state.dart';
import 'package:makemebela/blocs/login-bloc/login_bloc.dart';

class LoginButton extends StatelessWidget {
  LoginButton(this.loginBloc);

  final LoginBloc loginBloc;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ButtonState>(
      stream: loginBloc.outLoginButton,
      initialData: ButtonState(enable: false, loading: false),
      builder: (context, snapshot) {
        return RaisedButton(
          disabledColor: Color(0xFFF1F3F6),
          color: Color(0xFFF1F3F6),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          onPressed: snapshot.data.enable
              ? () {
                  loginBloc.loginWithEmail();
                }
              : null,
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            height: 60,
            margin: EdgeInsets.symmetric(vertical: 25),
            decoration: BoxDecoration(
              color: Color(0xFFF1F3F6),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                    offset: Offset(10, 10),
                    color: Color(0xFF4D70A6).withOpacity(0.2),
                    blurRadius: 16),
                BoxShadow(
                  offset: Offset(-10, -10),
                  color: Color.fromARGB(170, 255, 255, 255),
                  blurRadius: 10,
                ),
              ],
            ),
            child: snapshot.data.loading
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                  )
                : Text(
                    "Login",
                    style: TextStyle(color: Color(0xFF4D70A6), fontSize: 16),
                  ),
          ),
        );
      },
    );
  }
}
