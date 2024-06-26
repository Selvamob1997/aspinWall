import 'package:aspinwal/app/modules/leavemaster_reports_module/leavemaster_reports_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../IncludeFiles/_appbar.dart';


class LeavemasterReportsPage extends GetView<LeavemasterReportsController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<LeavemasterReportsController>(builder: (controler) {
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
                child: MyAppBar(screenName: 'Leave Report',),
              ),
              SizedBox(height: height/60,),
              SingleChildScrollView(
                padding: EdgeInsets.all(5.0),
                scrollDirection: Axis.horizontal,
                child:  controler.secScreenData.isNotEmpty ?
                DataTable(
                  columnSpacing: 20.0,
                  headingRowColor: MaterialStateProperty.all(Colors.blue),
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text(
                        'LeaveType',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'NoOfDays',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Comments',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Date',
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
                                list.leaveType.toString(),
                                textAlign: TextAlign.center)),
                            DataCell(Text(
                                list.noOfDays.toString(),
                                textAlign: TextAlign.center)),
                            DataCell(Text(
                                list.comments.toString(),
                                textAlign: TextAlign.center)),
                            DataCell(Text(
                                list.docDate.toString(),
                                textAlign: TextAlign.center)),

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
