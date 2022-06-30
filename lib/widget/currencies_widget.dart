import 'package:crypto_app/currency_data_source.dart';
import 'package:crypto_app/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CurrenciesWidget extends StatefulWidget {
  @override
  State<CurrenciesWidget> createState() => _CurrenciesWidgetState();
}

class _CurrenciesWidgetState extends State<CurrenciesWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CurrencyProvider>(context);
    final currencyDataSource = provider.currencyDataSource;

    if (currencyDataSource == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return SfDataGrid(
        allowSorting: true,
        defaultColumnWidth: 110,
        frozenColumnsCount: 1,
        columns: buildGridColumns(),
        source: currencyDataSource,
      );
    }
  }

  List<GridColumn> buildGridColumns() => <GridColumn>[
        GridColumn(
          columnName: CurrencyColumn.id.toString(),
          label: buildLabel("ID"),
        ),
        GridColumn(
          columnName: CurrencyColumn.rank.toString(),
          label: buildLabel("Rank"),
        ),
        GridColumn(
          columnName: CurrencyColumn.name.toString(),
          label: buildLabel("Name"),
        ),
        GridColumn(
          columnName: CurrencyColumn.price.toString(),
          label: buildLabel("Price"),
        ),
        GridColumn(
          columnName: CurrencyColumn.oneHChange.toString(),
          label: buildLabel("Last 1 Hour"),
        ),
        GridColumn(
          columnName: CurrencyColumn.oneHChange.toString(),
          label: buildLabel("Last 1 Day"),
        ),
        GridColumn(
          columnName: CurrencyColumn.marketCap.toString(),
          label: buildLabel("Market Cap"),
        ),
      ];

  Widget buildLabel(String text) => Padding(
    padding: const EdgeInsets.all(12),
    child: Text(
          text, textAlign: TextAlign.center,

        ),
  );
}
