import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_search_users/models/user_model.dart';

class SearchProvider with ChangeNotifier {
  String _searchText = '';
  bool _isLoading = false;
  final List<User> _users = [];

  void _updateLoading() {
    _isLoading = !_isLoading;
  }

  void setSearchtext(String key) {
    _searchText = key;
    notifyListeners();
  }

  bool get status => _isLoading;
  String get searchText => _searchText;

  UnmodifiableListView<User> get users => UnmodifiableListView(_users);

  Future<void> updateUsersData() async {
    try {
      _updateLoading();
      final response =
          await http.get(Uri.parse('https://reqres.in/api/users?delay=1'));

      if (response.statusCode == 200) {
        List data = json.decode(response.body)["data"];

        for (var i = 0; i < data.length; i++) {
          _users.add(
            User(
              id: data[i]["id"],
              name: data[i]["first_name"],
              avatar: data[i]["avatar"],
              email: data[i]["email"],
            ),
          );
        }
        _updateLoading();
      }
    } on Exception catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
