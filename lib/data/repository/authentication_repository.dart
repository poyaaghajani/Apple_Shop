import 'package:book_shop/data/data_source/authentication_datasource.dart';
import 'package:book_shop/di/di.dart';
import 'package:book_shop/util/api_exeption.dart';
import 'package:book_shop/util/auth_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAuthenticationRepository {
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm);

  Future<Either<String, String>> login(String username, String password);
}

class AuthenticationRepository implements IAuthenticationRepository {
  final IAuthenticationDataSource _dataSource = locator.get();

  final SharedPreferences _sharedPref = locator.get();

  @override
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm) async {
    try {
      await _dataSource.register('poyaW', '12345678', '12345678');
      return right('ثبت نام کنید');
    } on ApiExeption catch (ex) {
      return left(ex.message ?? 'خطایی رخ داده است');
    }
  }

  @override
  Future<Either<String, String>> login(String username, String password) async {
    try {
      String token = await _dataSource.login(username, password);
      AuthManager.savedToken(token);
      if (token.isNotEmpty) {
        return right('شما وارد شدید');
      } else {
        return const Left('خطایی پیش امده است');
      }
    } on ApiExeption catch (ex) {
      return left('${ex.message}');
    }
  }
}
