import 'package:flutter/material.dart';
import 'package:makemebela/blocs/login-bloc/field_state.dart';
import 'package:makemebela/blocs/login-bloc/login_bloc.dart';
import 'package:makemebela/pages/login-screen/widgets/faceb_button.dart';
import 'widgets/login_button.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    Key key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc _loginBloc = LoginBloc();

  bool status = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F3F6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Make me Bella",
                  style: TextStyle(
                    color: Color(0xFF4D70A6),
                    fontSize: 36,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'DollieScript',
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: SocialButton(),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: SocialButton(),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                StreamBuilder<FieldState>(
                  stream: _loginBloc.outEmail,
                  initialData: FieldState(),
                  builder: (context, snapshot) {
                    return Stack(
                      children: <Widget>[
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            color: Color(0xFF4D70A6),
                          ),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF4D70A6),
                                width: 2,
                              ),
                            ),
                            labelText: "Email",
                            labelStyle: TextStyle(
                              color: Color(0xFF4D70A6),
                              fontSize: 14,
                            ),
                            errorText: snapshot.data.error,
                          ),
                          onChanged: _loginBloc.changeEmail,
                          enabled: snapshot.data.enable,
                        ),
                      ],
                    );
                  },
                ),
                StreamBuilder<FieldState>(
                  stream: _loginBloc.outPassword,
                  initialData: FieldState(),
                  builder: (context, snapshot) {
                    return Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 25, 0, 50),
                          child: TextField(
                            obscureText: true,
                            autocorrect: false,
                            style: TextStyle(
                              color: Color(0xFF4D70A6),
                            ),
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF4D70A6),
                                    width: 2,
                                  ),
                                ),
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  color: Color(0xFF4D70A6),
                                  fontSize: 14,
                                ),
                                errorText: snapshot.data.error),
                            onChanged: _loginBloc.changePassword,
                            enabled: snapshot.data.enable,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                LoginButton(_loginBloc),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Don't have an account?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                          text: " Sign Up",
                          style: TextStyle(
                            color: Color(0xFF4D70A6),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
