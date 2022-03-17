import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:mobile_store_management/Backend/Operations/History_operation.dart';
import 'package:mobile_store_management/Backend/Utility/Mapping.dart';
import '../../Models/LoanedProductHistory_model.dart';

class LoanedProduct extends StatefulWidget {
  @override
  _LoanedProductState createState() => _LoanedProductState();
}

class _LoanedProductState extends State<LoanedProduct> {
  var history = HistoryOperation();
  late Future<List<LoanedProductHistoryModel>> _productHistory;
  var _sortAscending = true;

  @override
  void initState() {
    super.initState();
    this._productHistory = history.viewLoanHistory(getId());
  }

  String getId() {
    if (Mapping.borrowerList.isEmpty) {
      return "";
    } else {
      return Mapping.borrowerList.last.getBorrowerId.toString();
    }
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
                "Loaned Product History",
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
                    FutureBuilder<List<LoanedProductHistoryModel>>(
                      future: this._productHistory,
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
                              columnSpacing: 20,
                              horizontalMargin: 8,
                              showCheckboxColumn: false,
                              rowsPerPage: 10,
                              sortColumnIndex: 0,
                              sortAscending: _sortAscending,
                              columns: [
                                DataColumn2(
                                  size: ColumnSize.L,
                                  label: Text(
                                    'PRODUCT NAME',
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
                                            .getProductName
                                            .compareTo(b.getProductName));
                                      } else {
                                        snapshot.data!.sort((a, b) => b
                                            .getProductName
                                            .compareTo(a.getProductName));
                                      }
                                    });
                                  },
                                ),
                                DataColumn2(
                                  size: ColumnSize.S,
                                  label: Text(
                                    'DATEADDED',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Cairo_SemiBold'),
                                  ),
                                ),
                                DataColumn2(
                                  size: ColumnSize.S,
                                  label: Text(
                                    'PAYMENT PLAN',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Cairo_SemiBold'),
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
                                'No Loan History',
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
                            'No Loan History for this Borrower',
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
    _loanHistory = _productsHistory();
  }

  final BuildContext context;
  int _selectedCount = 0;
  List<_Row> _loanHistory = [];

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _loanHistory.length) return null;
    final row = _loanHistory[index];
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
  int get rowCount => _loanHistory.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  List<_Row> _productsHistory() {
    try {
      return List.generate(
        Mapping.productHistoryList.length,
        (index) {
          return _Row(
            Mapping.productHistoryList[index].getProductName.toString(),
            Mapping.productHistoryList[index].getDateAdded.toString(),
            Mapping.productHistoryList[index].getPaymentPlan.toString(),
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
