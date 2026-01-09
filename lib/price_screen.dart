import 'dart:convert';

import 'package:bitcoin_ticker/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String selectedCurrency = 'USD';
  String bitcoinValueInCurrency = '?';
  String ethereumValueInCurrency = '?';
  String litecoinValueInCurrency = '?';

  void getData()async{
    try{
      double bitcoinData = await CoinData()
          .getCoinData('bitcoin', selectedCurrency.toLowerCase());

      double ethereumData = await CoinData()
          .getCoinData('ethereum', selectedCurrency.toLowerCase());

      double litecoinData = await CoinData()
          .getCoinData('litecoin', selectedCurrency.toLowerCase());
      setState(() {
        bitcoinValueInCurrency = bitcoinData.toStringAsFixed(0);
        ethereumValueInCurrency = ethereumData.toStringAsFixed(0);
        litecoinValueInCurrency = litecoinData.toStringAsFixed(0);
      });
      print(bitcoinValueInCurrency);
    } catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    super.initState();
    getData();
  }

  DropdownButton<String> androidDropDown(){
    List<DropdownMenuItem<String>> myDropDownItems=[];
    for(String currency in currenciesList){
      var newItem=DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      myDropDownItems.add(newItem);
    }

    return DropdownButton<String>(
        value: selectedCurrency,
        items: myDropDownItems,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value!;
            getData();
          });
        },
      );
  }

  CupertinoPicker iOSPicker(){
    List<Text> items=[];
    for(String currency in currenciesList){
      items.add(Text(currency));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32,
      children:items,
      onSelectedItemChanged: (selectedIndex){
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getData();
        });
      },

    );

  }

  Widget getPicker(){
    if(Platform.isIOS){
      return iOSPicker();
    }else if(Platform.isAndroid){
      return androidDropDown();
    }else{
      print('no platform');
      return Text('no platform');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ReusableCard(
              coinValueInCurrency: bitcoinValueInCurrency,
              selectedCurrency: selectedCurrency,
              coin: 'Bitcoin'
          ),
          ReusableCard(
              coinValueInCurrency: ethereumValueInCurrency,
              selectedCurrency: selectedCurrency,
              coin: 'Ethereum'
          ),
          ReusableCard(
              coinValueInCurrency: litecoinValueInCurrency,
              selectedCurrency: selectedCurrency,
              coin: 'Litecoin'
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child:getPicker(),
          ),
        ],
      ),
    );
  }
}

