import 'package:flutter/material.dart';
import 'package:raider_io_flutter/Database/PlayerDao.dart';
import 'package:raider_io_flutter/Database/db.dart';
import 'package:raider_io_flutter/home.dart';
import 'package:provider/provider.dart';
import 'ProviderData/RioData.dart';
import 'package:get_it/get_it.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RioData>(
      create: (context) => RioData(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: const Color(0xFF0A0E21),
          scaffoldBackgroundColor: const Color(0xFF0A0E21),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF0A0E21),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color(0xFF0A0E21),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
