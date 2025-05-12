import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:telalogin/models/user.dart';

class UsersData extends ChangeNotifier{
  List<User> listUsers = [];
  Future<void> getUsers() async {
    String jsonString = await rootBundle.loadString('assets/dados.json');
    Map<String, dynamic> data = json.decode(jsonString);
    List<dynamic> usersData = data['users'];
    for (var user in usersData) {
      listUsers.add(User.fromMap(user));
    }
  }
}