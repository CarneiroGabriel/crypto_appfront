import 'dart:convert';
import 'currency.dart';
import 'package:http/http.dart' as http;

class CryptoApi{
  static final _key = 'f476b1dcb6237e24561e75f695276d395320ddb2';
  static Future<List<Currency>> getCurrencies() async{
    final url = "https://api.nomics.com/v1/currencies/ticker?key=$_key&interval=1d,1h&convert=BRL&per-page=50&page=1";

    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body) as List;

    return body.map((item) => Currency.fromJson(item)).toList();

  }
}