// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:mobile_store_management/Backend/Utility/Mapping.dart';

class ServedBorrowers extends StatefulWidget {
  @override
  _ServedBorrowersState createState() => _ServedBorrowersState();
}

class _ServedBorrowersState extends State<ServedBorrowers> {

  List<_Row> _servedBorrowers = [];
  int? sortColumnIndex;
  bool _sortAscending = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _servedBorrowers = _borrowerlist();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: EdgeInsets.only(left: 15, right: 15, top: 40, bottom: 80),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            child: Column(
              children: [
                //Close Button
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

                //Display Page Title
                Container(
                  margin: const EdgeInsets.only(left: 6, top: 20),
                  child: Text(
                    "Served Borrowers",
                    style: TextStyle(
                      fontFamily: 'Cairo_Bold',
                      color: HexColor("#155293"),
                      fontSize: 30,
                    ),
                  ),
                ),

                //Display Data Table
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(10),
                      children: [
                        PaginatedDataTable(
                          columnSpacing: 25,
                          horizontalMargin: 15,
                          showCheckboxColumn: false,
                          rowsPerPage: 10,
                          sortColumnIndex: 0,
                          sortAscending: _sortAscending,
                          columns: [
                            DataColumn2(
                              size: ColumnSize.S,
                              label: Text('BID',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Cairo_SemiBold')),
                                      onSort: (index, sortAscending) {
                                    setState(() {
                                      _sortAscending = sortAscending;
                                      if (sortAscending) {
                                        _servedBorrowers.sort((a, b) =>
                                            a.getValueA.compareTo(b.getValueA));
                                      } else {
                                        _servedBorrowers.sort((a, b) => 
                                        b.getValueA.compareTo((a.getValueA)));
                                      }
                                    });
                                  },
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
                          source: _DataSource(context,_servedBorrowers),
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

  get getValueA => int.parse(this.valueA);

  bool selected = false;
}

class _DataSource extends DataTableSource {
  var _paymentsHistory;
  
  _DataSource(this.context, this._paymentsHistory);
  final BuildContext context;

  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _paymentsHistory.length) return null;
    final row = _paymentsHistory[index];
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
  int get rowCount => _paymentsHistory.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

List<_Row> _borrowerlist() {
  try {
    return List.generate(
      Mapping.servedBorrowers.length,
      (index) {
        return _Row(
          Mapping.servedBorrowers[index].getBorrowerId.toString(),
          Mapping.servedBorrowers[index].getName.toString(),
          Mapping.servedBorrowers[index].getAmount.toStringAsFixed(2),
        );
      },
    );
  } catch (e) {
    return List.generate(
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
