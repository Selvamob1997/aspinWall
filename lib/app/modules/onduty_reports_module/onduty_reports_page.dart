import 'package:aspinwal/app/modules/onduty_reports_module/onduty_reports_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../IncludeFiles/_appbar.dart';



class OndutyReportsPage extends GetView<OndutyReportsController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<OndutyReportsController>(builder: (controler) {
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
                child: MyAppBar(screenName: 'Onduty',),
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
                        'Onduty Type',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'From Date',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'ToDate',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'FromLoc',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'To Location',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'From Time',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'To Time',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                  rows: controler.secScreenData.map((list) =>
                      DataRow(
                          color: list.status=="A"?MaterialStateProperty.all(Colors.greenAccent):
                          list.status=="R"?MaterialStateProperty.all(Colors.red.shade300):
                          MaterialStateProperty.all(Colors.white),
                          cells: [
                            DataCell(Text(
                                list.ondutyType.toString(),
                                textAlign: TextAlign.center)),
                            DataCell(Text(
                                list.fromDate.toString(),
                                textAlign: TextAlign.center)),
                            DataCell(Text(
                                list.toDate.toString(),
                                textAlign: TextAlign.center)),
                            DataCell(Text(
                                list.fromLoc.toString(),
                                textAlign: TextAlign.center)),
                            DataCell(Text(
                                list.toLocation.toString(),
                                textAlign:
                                TextAlign.center)),
                            DataCell(Text(
                                list.fromTime.toString(),
                                textAlign: TextAlign.center)),
                            DataCell(Text(list.toTime.toString(),
                                textAlign:
                                TextAlign.start)),
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
