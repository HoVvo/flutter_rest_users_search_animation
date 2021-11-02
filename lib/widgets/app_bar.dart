import 'package:flutter/material.dart';

AppBar buildAppBar(
    Icon _appBarIcon, Widget _appBarTitle, VoidCallback _startSearch) {
  return AppBar(
    centerTitle: true,
    title: _appBarTitle,
    actions: [
      IconButton(
        icon: _appBarIcon,
        onPressed: _startSearch,
      )
    ],
  );
}
