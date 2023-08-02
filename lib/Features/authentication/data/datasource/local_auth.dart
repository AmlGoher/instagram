import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/auth_Constants.dart';
import '../../../../core/errors/exceptions.dart';
import 'package:instagram/Features/authentication/data/model/user_model.dart';



abstract class AuthLocalDataSource {
  Future<UserModel> getUserData();
  Future<Unit> setUserData(UserModel userModel);
  Future<Unit> clearUserData();
  Future<Unit> setIsUserLoggedIn({required bool isUserLoggedIn});
  bool? getIsUserLoggedIn();
}

class AuthLocalDataSourceSharedPrefes implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceSharedPrefes(this.sharedPreferences);

  @override
  Future<Unit> setUserData(UserModel userModel) async {
    Map<String, dynamic> userModelToJson = userModel.toJson();

    await sharedPreferences.setString(
        AuthConstants.kUserData, json.encode(userModelToJson));
    await sharedPreferences.setBool(AuthConstants.kIsUserLoggedIn, true);
    return Future.value(unit);
  }

  @override
  Future<UserModel> getUserData() async {
    final jsonString = sharedPreferences.getString(AuthConstants.kUserData);
    if (jsonString != null) {
      Map<String, dynamic> jsonToAuthModel =
          json.decode(jsonString) as Map<String, dynamic>;

      UserModel savedModel =UserModel.fromJson(jsonToAuthModel);

      return savedModel;
    } else {
      throw NoSavedUserException();
    }
  }

  @override
  Future<Unit> clearUserData() async {
    await sharedPreferences.clear();
    return Future.value(unit);
  }

  @override
  Future<Unit> setIsUserLoggedIn({required bool isUserLoggedIn}) async {
    await sharedPreferences.setBool(
        "isUserLoggedIn", isUserLoggedIn);
    return Future.value(unit);
  }

  @override
  bool? getIsUserLoggedIn() {
    final isUserLoggedIn =
        sharedPreferences.getBool("isUserLoggedIn");
    return isUserLoggedIn;
  }
}