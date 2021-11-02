import 'package:flutter/material.dart';
import 'package:flutter_search_users/services/search_provider.dart';
import 'package:flutter_search_users/widgets/app_bar.dart';
import 'package:flutter_search_users/widgets/build_lists.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SearchProvider searchProvider;
  @override
  void initState() {
    searchProvider = Provider.of<SearchProvider>(context, listen: false);
    super.initState();
  }

  Icon _appBarIcon = const Icon(Icons.search);
  Widget _appBarTitle = const Text('My Users');
  final TextEditingController _searchControler = TextEditingController();

  void _startSearch() {
    setState(() {
      if (_appBarIcon.icon == Icons.search) {
        _appBarIcon = const Icon(Icons.close);
        _appBarTitle = TextField(
          autofocus: true,
          onChanged: searchProvider.setSearchtext,
          controller: _searchControler,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search...',
          ),
        );
      } else {
        _appBarIcon = const Icon(Icons.search);
        _appBarTitle = const Text('My Users');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(_appBarIcon, _appBarTitle, _startSearch),
      body: build_ListsWidget(),
    );
  }
}
