import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'currency.dart';

enum CurrencyColumn { id, rank, name, price, oneHChange, oneDChange, marketCap }

class CurrencyDataSource extends DataGridSource {
  late List<DataGridRow> _currencies;

  @override
  List<DataGridRow> get rows => _currencies;

  CurrencyDataSource({required List<Currency> currencies}) {
    buildDataGrid(currencies);
  }

  void buildDataGrid(List<Currency> currencies) => _currencies = currencies
      .map<DataGridRow>(
        (currency) => DataGridRow(
          cells: CurrencyColumn.values
              .map(
                (colunm) => DataGridCell<CurrencyComparable>(
                  columnName: colunm.toString(),
                  value: CurrencyComparable(colunm, currency),
                ),
              )
              .toList(),
        ),
      )
      .toList();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) => DataGridRowAdapter(
          cells: row.getCells().map<Widget>((dataGridCell) {
        final CurrencyComparable currencyWrapper  = dataGridCell.value;
        final currency = currencyWrapper.currency;
        final column = CurrencyColumn.values
            .firstWhere((value) => value.toString() == dataGridCell.columnName);
        print("build|Row ");

        switch (column) {
          case CurrencyColumn.id:
            return buildIdRow(currency);
          case CurrencyColumn.rank:
            return buildRankRow(currency);
          case CurrencyColumn.name:
            return buildNameRow(currency.name);
          case CurrencyColumn.price:
            return buildPriceRow(currency.price);
          case CurrencyColumn.marketCap:
            return buildMarketCapRow(currency.marketCap);
          case CurrencyColumn.oneHChange:
            return buildOneHChangeRow(currency.oneHourChange);
          case CurrencyColumn.oneDChange:
            return buildOneDChangeRow(currency.oneDayChange);
          default:
            return Text("hello");
        }
      }).toList());

  Widget buildIdRow(Currency currency) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildLogo(currency),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              currency.id,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPriceRow(double price) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        "\$${price}",
        style: TextStyle(color: Colors.tealAccent),
      ),
    );
  }

  Widget buildRankRow(Currency currency) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Text(
        "${currency.rank}",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget buildNameRow(String name) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        "${name}",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget buildMarketCapRow(double price) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        "\$${price}",
        style: TextStyle(color: Colors.tealAccent),
      ),
    );
  }

  Widget buildOneHChangeRow(double price) {
    if (price >= 0) {
      return Container(
        padding: EdgeInsets.all(16),
        child: Text(
          "▲${price}",
          style: TextStyle(color: Colors.green),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(16),
        child: Text(
          "▼${price}",
          style: TextStyle(
            color: Colors.red,
            letterSpacing: 2,
          ),
        ),
      );
    }
  }

  Widget buildOneDChangeRow(double price) {
    if (price >= 0) {
      return Container(
        padding: EdgeInsets.all(16),
        child: Text(
          "▲${price}",
          style: TextStyle(color: Colors.green),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(16),
        child: Text(
          "▼${price}",
          style: TextStyle(color: Colors.red),
        ),
      );
    }
  }

  Widget buildLogo(Currency currency) {
    final isSvg = currency.logoUrl.endsWith(".svg");

    return CircleAvatar(
      radius: 10,
      child: isSvg
          ? SvgPicture.network(currency.logoUrl)
          : Image.network(currency.logoUrl),
    );
  }
}
