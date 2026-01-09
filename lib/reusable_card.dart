
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final String coinValueInCurrency;
  final String selectedCurrency;
  final String coin;
  ReusableCard({required this.coinValueInCurrency,required this.selectedCurrency,required this.coin});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
        child: Card(
          color: Colors.lightBlueAccent,
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
            child: Text(
              '1 $coin = $coinValueInCurrency $selectedCurrency',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
  }
}