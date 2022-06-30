import 'package:crypto_app/crypto_api.dart';
import 'package:crypto_app/currency_data_source.dart';
import 'package:flutter/foundation.dart';
import 'currency.dart';

class CurrencyProvider extends ChangeNotifier{
  CurrencyDataSource? currencyDataSource;
  List<Currency> currencies = [];

  CurrencyProvider(){
    loadCurrencies();
  }

  Future loadCurrencies() async{
    final currencies = await CryptoApi.getCurrencies();

    this.currencies = currencies;
    currencyDataSource = CurrencyDataSource(currencies: currencies);
    notifyListeners();
  }
}