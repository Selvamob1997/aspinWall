import 'package:aspinwal/app/modules/clientvisit_reports_module/clientvisit_reports_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../IncludeFiles/_appbar.dart';



class ClientvisitReportsPage extends GetView<ClientvisitReportsController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<ClientvisitReportsController>(builder: (controler) {
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
                child: MyAppBar(screenName: 'Visit Reports',),
              ),
              SizedBox(height: height/60,),
              SingleChildScrollView(
                padding: EdgeInsets.all(5.0),
                scrollDirection: Axis.horizontal,
                child:  controler.secScreenData.isNotEmpty ?
                DataTable(
                  columnSpacing: 20.0,
                  headingRowColor:
                  MaterialStateProperty.all(Colors.blue),
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text(
                        'View',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Type',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'CardName',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'In Time',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Out Time',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'From Address',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'To Address',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'DocDate',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                  ],
                  rows: controler.secScreenData.map((list) =>
                      DataRow(
                          cells: [
                            DataCell(
                                IconButton(
                                  onPressed: () {

                                  },
                                  icon: Icon(Icons.remove_red_eye),
                                ),
                            ),
                            DataCell(Text(
                                list.Type.toString(),
                                textAlign: TextAlign.center)),
                            DataCell(Text(
                                list.CardName.toString(),
                                textAlign: TextAlign.center)),
                            DataCell(Text(
                                list.inTime.toString(),
                                textAlign: TextAlign.center)),
                            DataCell(Text(
                                list.outTime.toString(),
                                textAlign: TextAlign.center)),
                            DataCell(Text(
                                list.fromAdd.toString(),
                                textAlign: TextAlign.center)),
                            DataCell(Text(
                                list.toAdd.toString(),
                                textAlign: TextAlign.center)),
                            DataCell(Text(
                                list.docDate.toString(),
                                textAlign:
                                TextAlign.center)),

                          ]),
                  )
                      .toList(),
                )
                    : Container(
                  child: Center(
                    child: Text('No Data'),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  });
}
