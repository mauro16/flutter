import 'package:flutter/material.dart';
import 'package:makemebela/blocs/login-bloc/login_bloc.dart';

class SocialButton extends StatelessWidget {
  SocialButton({this.loginBloc, this.icon});
  final LoginBloc loginBloc;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 10),
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
              blurRadius: 10),
        ],
      ),
      child: StreamBuilder(
        builder: (context, snapshot) {
          return RaisedButton(
            color: Color(0xFF4D70A6),
            onPressed: () {},
          );
        },
      ),
    );
  }
}
