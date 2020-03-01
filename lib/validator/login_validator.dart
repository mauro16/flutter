import 'dart:async';

import 'package:makemebela/blocs/login-bloc/field_state.dart';

class LoginValidator {
  final StreamTransformer<String, FieldState> emailValidator =
      StreamTransformer<String, FieldState>.fromHandlers(
    handleData: (email, sink) {
      const Pattern pattern = "";
      final RegExp regExp = RegExp(pattern);
      if (email.isEmpty)
        sink.add(
          FieldState(error: 'Pflichtfeld'),
        );
      else if (!regExp.hasMatch(email))
        sink.add(
          FieldState(error: 'Ungültige E-Mail'),
        );
      else
        sink.add(
          FieldState(),
        );
    },
  );
  final StreamTransformer<String, FieldState> passwordValidator =
      StreamTransformer<String, FieldState>.fromHandlers(
    handleData: (pass, sink) {
      if (pass.isEmpty)
        sink.add(
          FieldState(error: 'Pflichtfeld'),
        );
      else
        sink.add(
          FieldState(),
        );
    },
  );
}
