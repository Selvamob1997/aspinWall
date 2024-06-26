import 'package:aspinwal/app/modules/dash_board_reports_module/dash_board_reports_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../IncludeFiles/_appbar.dart';

class DashBoardReportsPage extends GetView<DashBoardReportsController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<DashBoardReportsController>(builder: (myController) {
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
                child: MyAppBar(screenName: 'Reports',),
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
                      columns:  <DataColumn>[
                        DataColumn(label: Text('CardCode',style: TextStyle(color:Colors.white),),),
                        DataColumn(label: Text('CardName',style: TextStyle(color:Colors.white),),),
                        DataColumn(label: Text(myController.reportType.toString()=="1"? 'Pending' :'Pending',style: TextStyle(color:Colors.white),),),
                        DataColumn(label: Text(myController.reportType.toString()=="1"?'OverDue':'Completed',style: TextStyle(color:Colors.white),),),
                        DataColumn(label: Text(myController.reportType.toString()=="1"?'Above 60 Days':'Total',style: TextStyle(color:Colors.white),),),

                      ],
                      rows:myController.secScreenData.map((list) =>
                          DataRow(
                            cells: [
                              DataCell(
                                Text("${list.cardCode}", textAlign: TextAlign.left,),
                              ),
                              DataCell(
                                Text("${list.cardName}", textAlign: TextAlign.left,),
                              ),
                              DataCell(
                                Text("${myController.reportType.toString()=="1"?list.totalPending:list.Pending}", textAlign: TextAlign.left,),
                              ),
                              DataCell(
                                Text("${myController.reportType.toString()=="1"?list.overDue:list.Completed}", textAlign: TextAlign.left,),
                              ),
                              DataCell(
                                Text("${myController.reportType.toString()=="1"?list.overDueAbove60Days:list.Total}", textAlign: TextAlign.left,),
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
