import 'package:aspinwal/app/modules/telecalling_reports_module/telecalling_reports_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../IncludeFiles/_appbar.dart';


class TelecallingReportsPage extends GetView<TelecallingReportsController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<TelecallingReportsController>(builder: (myController) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: height/10,
                width: width,
                child: MyAppBar(screenName: 'TeleCall  Reports',),
              ),
              SizedBox(
                height: height/1.2,
                width: width,
                //color: Colors.deepOrange,
                child: SingleChildScrollView(
                  scrollDirection:
                  Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection:
                    Axis.horizontal,
                    child: myController.secScreenData.isEmpty ?
                    const Center(child: Text('No Data Add!'),) :
                    DataTable(
                      sortColumnIndex: 0,
                      sortAscending: true,
                      showCheckboxColumn: false,
                      headingRowHeight: height/20,
                      headingRowColor: MaterialStateProperty.all(Colors.blue),
                      columns: const <DataColumn>[
                        DataColumn(label: Text('CardName',style: TextStyle(color:Colors.white),),),
                        DataColumn(label: Text('Remarks',style: TextStyle(color:Colors.white),),),

                      ],
                      rows:myController.secScreenData.map((list) =>
                          DataRow(
                            cells: [
                              DataCell(
                                Text("${list.cardName}", textAlign: TextAlign.left,),
                              ),
                              DataCell(
                                Text("${list.Remarks}", textAlign: TextAlign.left,),
                              ),
                            ],
                          ),)
                          .toList(),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  });
}
