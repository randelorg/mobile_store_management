import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:mobile_store_management/Backend/Operations/History_operation.dart';
import 'package:mobile_store_management/Backend/Utility/Mapping.dart';

class PaymentHistory extends StatefulWidget {
  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  var history = HistoryOperation();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            // Display Page Title
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

            // Display Data Table
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(10),
                  children: [
                    FutureBuilder(
                      future: history.viewPaymentHistory(
                        Mapping.borrowerList.last.getBorrowerId.toString(),
                      ),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasData) {
                          return PaginatedDataTable(
                            columnSpacing: 30,
                            horizontalMargin: 15,
                            showCheckboxColumn: false,
                            rowsPerPage: 8,
                            columns: [
                              DataColumn2(
                                size: ColumnSize.S,
                                label: Text(
                                  'LOANID',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Cairo_SemiBold'),
                                ),
                              ),
                              DataColumn2(
                                size: ColumnSize.M,
                                label: Text(
                                  'AMOUNT PAID',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Cairo_SemiBold'),
                                ),
                              ),
                              DataColumn2(
                                size: ColumnSize.S,
                                label: Text(
                                  'DATE',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Cairo_SemiBold'),
                                ),
                              ),
                            ],
                            source: _DataSource(context),
                          );
                        }
                        return Center(child: Text('No Data For this Borrower'));
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
  List<_Row> _paymentsHistory;

  try {
    return _paymentsHistory = List.generate(
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
    return _paymentsHistory = List.generate(
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
