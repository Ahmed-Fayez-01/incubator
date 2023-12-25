import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../enums/data_type.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // static Future<bool> saveData({
  //   required String key,
  //   required dynamic value,
  // }) async {
  //   if (value is String) return await sharedPreferences.setString(key, value);
  //   if (value is int) return await sharedPreferences.setInt(key, value);
  //   if (value is bool) return await sharedPreferences.setBool(key, value);
  //   if (value is double) return await sharedPreferences.setDouble(key, value);
  //   return await sharedPreferences.setStringList(key, value);


  static Future<T> tryCatchWrapper<T>(Function body) async {
    try {
      return await body();
    } on Exception catch (e) {
      throw e.toString();
    }
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is double) return await sharedPreferences.setDouble(key, value);
    return await sharedPreferences.setStringList(key, value);
  }

  static setData({
    required DataType dataType,
    required String key,
    required dynamic value,
  }) async {
    switch (dataType) {
      case DataType.string:
        return await sharedPreferences.setString(key, value);
      case DataType.int:
        return await sharedPreferences.setInt(key, value);
      case DataType.double:
        return await sharedPreferences.setDouble(key, value);
      case DataType.bool:
        return await sharedPreferences.setBool(key, value);
      case DataType.stringList:
        return await sharedPreferences.setStringList(key, value);
    }
  }

  static getData({
    required DataType dataType,
    required String key,
  }) {
    switch (dataType) {
      case DataType.string:
        return sharedPreferences.getString(key);
      case DataType.int:
        return sharedPreferences.getInt(key);
      case DataType.double:
        return sharedPreferences.getDouble(key);
      case DataType.bool:
        return sharedPreferences.getBool(key);
      case DataType.stringList:
        return sharedPreferences.getStringList(key);
    }
  }

  static clearAllData() {
    // sharedPreferences.clear();
    removeData(key: "userID");
    removeData(key: "userToken");
    removeData(key: "userLogin");
  }

  static Future<bool> removeData({
    required String key,
  }) async {
    return await sharedPreferences.remove(key);
  }
}
