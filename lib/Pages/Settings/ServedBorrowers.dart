import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:mobile_store_management/Backend/Utility/Mapping.dart';

class ServedBorrowers extends StatefulWidget {
  @override
  _ServedBorrowersState createState() => _ServedBorrowersState();
}

class _ServedBorrowersState extends State<ServedBorrowers> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: EdgeInsets.only(left: 20, right: 20, top: 180, bottom: 200),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            child: Column(
              children: [
                // Close Button
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.cancel,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),

                // Display Page Title
                Container(
                  margin: const EdgeInsets.only(left: 4, top: 20),
                  child: Text(
                    "Served Borrowers",
                    style: TextStyle(
                      fontFamily: 'Cairo_Bold',
                      color: HexColor("#155293"),
                      fontSize: 30,
                    ),
                  ),
                ),

                // Display Data Table
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(10),
                      children: [
                        PaginatedDataTable(
                          columnSpacing: 30,
                          horizontalMargin: 15,
                          columns: [
                            DataColumn2(
                              size: ColumnSize.S,
                              label: Text('BID',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Cairo_SemiBold')),
                            ),
                            DataColumn2(
                              size: ColumnSize.L,
                              label: Text('NAME',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Cairo_SemiBold')),
                            ),
                            DataColumn2(
                              size: ColumnSize.S,
                              label: Text('AMOUNT',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Cairo_SemiBold')),
                            ),
                          ],
                          source: _DataSource(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Row {
  _Row(
    this.valueA,
    this.valueB,
    this.valueC,
  );

  final String valueA;
  final String valueB;
  final String valueC;

  bool selected = false;
}

class _DataSource extends DataTableSource {
  _DataSource(this.context) {
    _paymentsHistory(context);
  }

  final BuildContext context;

  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _paymentsHistory(context).length) return null;
    final row = _paymentsHistory(context)[index];
    return DataRow.byIndex(
      index: index,
      selected: row.selected,
      cells: [
        DataCell(Text(row.valueA)),
        DataCell(Text(row.valueB)),
        DataCell(Text(row.valueC)),
      ],
    );
  }

  @override
  int get rowCount => _paymentsHistory(context).length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

List _paymentsHistory(BuildContext context) {
  List<_Row> _servedBorrowers;

  try {
    return _servedBorrowers = List.generate(
      Mapping.servedBorrowers.length,
      (index) {
        return _Row(
          Mapping.servedBorrowers[index].getBorrowerId.toString(),
          Mapping.servedBorrowers[index].getName.toString(),
          Mapping.servedBorrowers[index].getAmount.toString(),
        );
      },
    );
  } catch (e) {
    return _servedBorrowers = List.generate(
      0,
      (index) {
        return _Row(
          '',
          '',
          '',
        );
      },
    );
  }
}
