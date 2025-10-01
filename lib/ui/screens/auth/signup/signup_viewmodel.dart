import 'dart:developer';

import 'package:fam_chat/core/enums/enums.dart';
import 'package:fam_chat/core/models/user_model.dart';
import 'package:fam_chat/core/other/base_viewmodel.dart';
import 'package:fam_chat/core/services/auth_service.dart';
import 'package:fam_chat/core/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupViewmodel extends BaseViewmodel {
  final AuthService _auth;
  final DatabaseService _db;

  SignupViewmodel(this._auth, this._db, [storageService]);

  String _name = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  void setName(String value) {
    _name = value;
    notifyListeners();
    print("Name: $_name");
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
    log("Email: $_email");
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
    log("Password: $_password");
  }

  void setConfirmPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }

  signup() async {
    setState(ViewState.loading);
    try {
      if (_password != _confirmPassword) {
        throw Exception("Passwords do not match");
      }
      final res = await _auth.signup(_email, _password);
      if (res != null) {
        UserModel user = UserModel(uid: res.uid, name: _name, email: _email);

        await _db.saveUser(user.toMap());
      }

      setState(ViewState.idle);
    } on FirebaseAuthException catch (e) {
      setState(ViewState.idle);
      rethrow;
    } catch (e) {
      log(e.toString());
      setState(ViewState.idle);
      rethrow;
    }
  }
}
