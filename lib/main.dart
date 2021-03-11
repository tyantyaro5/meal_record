import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:meal_record/screens/home_screen.dart';
import 'package:meal_record/db/database.dart';

import 'generated/l10n.dart';

MyDatabase database;

void main() {
  database = MyDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,

      debugShowCheckedModeBanner: false,
      title: "食事管理",
      theme: ThemeData(
        brightness: Brightness.light,
        buttonColor: Colors.blue,
        primaryIconTheme: IconThemeData(
        color: Colors.white,
      )),
      home: HomeScreen(),
    );
  }
}
