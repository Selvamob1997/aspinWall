import 'package:aspinwal/app/modules/sales_quation_reports_module/sales_quation_reports_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../IncludeFiles/_appbar.dart';


class SalesQuationReportsPage extends GetView<SalesQuationReportsController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<SalesQuationReportsController>(builder: (myController) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: height/10,
                width: width,
                alignment: Alignment.center,
                child: MyAppBar(screenName: 'Sales Quation ',),
              ),
              Container(
                height: height/1.3,
                width: width,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: myController.secScreenDataList.isNotEmpty ?
                    DataTable(columnSpacing: 30.0,
                      headingRowColor: MaterialStateProperty.all(Colors.pinkAccent),
                      showCheckboxColumn: true,
                      sortColumnIndex: 0,
                      sortAscending: true,
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'S.No',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),

                        DataColumn(
                          label: Center(
                            child: Text(
                              'SeriesName',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Center(
                            child: Text(
                              'DocDate',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Center(
                            child: Text(
                              'CardName',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Center(
                            child: Text(
                              'ItemCode',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Center(
                            child: Text(
                              'Dscription',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Center(
                            child: Text(
                              'Quantity',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Center(
                            child: Text(
                              'Price',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Center(
                            child: Text(
                              'Net Amt',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),

                        DataColumn(
                          label: Center(
                            child: Text(
                              'TaxCode',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Center(
                            child: Text(
                              'TaxAmt',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),

                        DataColumn(
                          label: Center(
                            child: Text(
                              'Total',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),

                      ],
                      rows: myController.secScreenDataList.map((list) =>
                          DataRow(cells: [
                            DataCell(Text(
                                (myController.secScreenDataList.indexOf(list)+1).toString(), textAlign: TextAlign.center),),
                            DataCell(
                              Text(list.seriesName.toString(), textAlign: TextAlign.center),
                            ),
                            DataCell(
                              Text(list.docDate.toString(), textAlign: TextAlign.center),

                            ),
                            DataCell(Text(list.cardName.toString(), textAlign: TextAlign.center),),
                            DataCell(Text(list.itemCode.toString(), textAlign: TextAlign.center),),
                            DataCell(
                              Text(list.dscription.toString(), textAlign: TextAlign.center),
                            ),
                            DataCell(
                              Text(list.quantity.toString(), textAlign: TextAlign.center),
                            ),
                            DataCell(
                              Text(list.price.toString(), textAlign: TextAlign.center),
                            ),
                            DataCell(
                              Text(list.lineTotal.toString(), textAlign: TextAlign.center),
                            ),DataCell(
                              Text(list.taxCode.toString(), textAlign: TextAlign.center),
                            ),
                            DataCell(
                              Text(list.vatSum.toString(), textAlign: TextAlign.center),
                            ),
                            DataCell(
                              Text(list.gTotal.toString(), textAlign: TextAlign.center),
                            ),

                          ]),
                      )
                          .toList(),
                    )
                        : const Center(
                      child: Text('No Data'),
                    )),
              )



            ],
          ),
        ),
        persistentFooterButtons: [
          IconButton(onPressed: (){}, icon: Icon(Icons.cached,color: Colors.deepOrange,size: height/30,))
        ],

      ),
    );
  });
}
