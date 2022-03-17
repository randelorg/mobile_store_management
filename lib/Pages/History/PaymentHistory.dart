import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:mobile_store_management/Backend/Operations/History_operation.dart';
import 'package:mobile_store_management/Backend/Utility/Mapping.dart';
import '../../Models/PaymentHistory_model.dart';

class PaymentHistory extends StatefulWidget {
  final String? id, borrowerName;
  PaymentHistory({this.id, this.borrowerName});

  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  var history = HistoryOperation();
  late Future<List<PaymentHistoryModel>> _paymentHistory;
  var _sortAscending = true;

  @override
  void initState() {
    super.initState();
    this._paymentHistory = history.viewPaymentHistory(Mapping.getId());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            //Display Page Title
            Container(
              margin: const EdgeInsets.only(left: 40, right: 40, top: 100),
              child: Text(
                "Payment History",
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
                    FutureBuilder<List<PaymentHistoryModel>>(
                      future: this._paymentHistory,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(
                              semanticsLabel: 'Fetching borrowers',
                            ),
                          );
                        }
                        if (snapshot.hasData) {
                          if (snapshot.data!.isNotEmpty) {
                            return PaginatedDataTable(
                              columnSpacing: 30,
                              horizontalMargin: 15,
                              showCheckboxColumn: false,
                              rowsPerPage: 10,
                              sortColumnIndex: 0,
                              sortAscending: _sortAscending,
                              columns: [
                                DataColumn2(
                                  size: ColumnSize.S,
                                  label: Text(
                                    'COLLECTIONID',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Cairo_SemiBold',
                                    ),
                                  ),
                                  onSort: (index, sortAscending) {
                                    setState(() {
                                      _sortAscending = sortAscending;
                                      if (sortAscending) {
                                        snapshot.data!.sort((a, b) => a
                                            .getCollectionID
                                            .compareTo(b.getCollectionID));
                                      } else {
                                        snapshot.data!.sort((a, b) => b
                                            .getCollectionID
                                            .compareTo(a.getCollectionID));
                                      }
                                    });
                                  },
                                ),
                                DataColumn2(
                                  size: ColumnSize.M,
                                  label: Text(
                                    'AMOUNT PAID',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Cairo_SemiBold',
                                    ),
                                  ),
                                ),
                                DataColumn2(
                                  size: ColumnSize.S,
                                  label: Text(
                                    'DATE',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Cairo_SemiBold',
                                    ),
                                  ),
                                ),
                              ],
                              source: _DataSource(context),
                            );
                          } else {
                            return Container(
                              margin:
                                  const EdgeInsets.only(top: 250, bottom: 250),
                              child: Text(
                                'No Payment History',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontFamily: 'Cairo_SemiBold',
                                  fontSize: 14,
                                ),
                              ),
                            );
                          }
                        }
                        return Container(
                          margin: const EdgeInsets.only(top: 250, bottom: 250),
                          child: Text(
                            'No Payment History for this Borrower',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontFamily: 'Cairo_SemiBold',
                              fontSize: 14,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
    _payHistory = _paymentsHistory();
  }

  final BuildContext context;

  int _selectedCount = 0;
  List<_Row> _payHistory = [];

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _payHistory.length) return null;
    final row = _payHistory[index];
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
  int get rowCount => _payHistory.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  List<_Row> _paymentsHistory() {
    try {
      return List.generate(
        Mapping.paymentList.length,
        (index) {
          return _Row(
            Mapping.paymentList[index].getCollectionID.toString(),
            Mapping.paymentList[index].getCollectionAmount.toString(),
            Mapping.paymentList[index].getGivenDate.toString(),
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
}