import 'package:flutter/material.dart';
import 'price_screen.dart';

void main() => runApp(MyApp());
const apiKey="CG-4zsAtiZJSM5Pwjxe5gYstw8q";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
          foregroundColor: Colors.white,
        ),
      ),

      home: PriceScreen(),
    );
  }
}