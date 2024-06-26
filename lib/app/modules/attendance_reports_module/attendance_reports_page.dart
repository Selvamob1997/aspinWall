import 'package:aspinwal/app/modules/attendance_reports_module/attendance_reports_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../IncludeFiles/_appbar.dart';



class AttendanceReportsPage extends GetView<AttendanceReportsController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<AttendanceReportsController>(builder: (controler) {
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
                child: MyAppBar(screenName: 'Attendance',),
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
                        'From Place',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'To Place',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Loc Type',
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
                    DataColumn(
                      label: Text(
                        'Final Status',
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
                          DataCell(Text(
                              list.fromPlace.toString(),
                              textAlign: TextAlign.center)),
                          DataCell(Text(
                              list.toPlace.toString(),
                              textAlign: TextAlign.center)),
                          DataCell(Text(
                              list.locType.toString(),
                              textAlign: TextAlign.center)),
                          DataCell(Text(
                              list.fromTime.toString(),
                              textAlign: TextAlign.center)),
                          DataCell(Text(
                              list.toTime.toString(),
                              textAlign:
                              TextAlign.center)),
                          DataCell(Text(
                              list.finalStatus.toString(),
                              textAlign: TextAlign.center)),
                          DataCell(Text(list.docDate.toString(),
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
