import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const apiKey="YOUR_KEY";
const coingeckoUrl='https://api.coingecko.com/api/v3/simple/price';

class CoinData {


  Future<double> getCoinData(String coin,String currency) async {
    final url = Uri.parse(
        '$coingeckoUrl?ids=$coin&vs_currencies=$currency'
    );

    final response = await http.get(
      url,
      headers: {
        'x-cg-demo-api-key': apiKey,
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data[coin][currency] as num).toDouble();
    }else{
      throw Exception('Failed to load price');
    }
  }
}
