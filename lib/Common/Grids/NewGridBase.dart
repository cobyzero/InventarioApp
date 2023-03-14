import 'package:flutter/material.dart';

class NewGridBase extends StatelessWidget {
  NewGridBase({super.key, required this.columns, required this.rows});
  List<DataColumn> columns;
  List<DataRow> rows;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: DataTable(columns: columns, rows: rows));
  }

  static getListColumns(List<String> data) {
    List<DataColumn> columns = [];
    for (var element in data) {
      columns.add(DataColumn(label: Text(element)));
    }
    return columns;
  }
}
