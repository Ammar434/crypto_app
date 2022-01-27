import 'package:crypto_app/models/users.dart';
import 'package:crypto_app/ressources/auth_method.dart';
import 'package:flutter/widgets.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;

    notifyListeners();
  }
}
