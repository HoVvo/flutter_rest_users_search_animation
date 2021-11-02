import 'package:flutter/material.dart';
import 'package:flutter_search_users/services/search_provider.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: SearchProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Users',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: const HomePage(),
      ),
    );
  }
}
