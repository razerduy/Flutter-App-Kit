import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {

  final storage = FlutterSecureStorage();

  Future<Map<String, dynamic>> readObject(String key) async {
    try {
      String jsonEncode = await storage.read(key: key);
      return json.decode(jsonEncode) as Map<String, dynamic>;
    } catch (err) {
      print(err);
      return null;
    }
  }

  Future<bool> writeObject(String key, Map<String, dynamic> jsonObject) async {
    try {
      await storage.write(key: key, value: json.encode(jsonObject));
      return true;
    } catch (err) {
      print(err);
    }
    return false;
  }

  Future<bool> writeList(String key, List list) async {
    try {
      await storage.write(key: key, value: json.encode(list));
      return true;
    } catch (err) {
      print(err);
    }
    return false;
  }

  Future<List> readList(String key) async {
    try {
      String jsonEncode = await storage.read(key: key);
      return json.decode(jsonEncode) as List;
    } catch (err) {
      print(err);
      return null;
    }
  }

  @override
  Future<bool> delete(String key) async {
    try {
      await storage.delete(key: key);
      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }

}