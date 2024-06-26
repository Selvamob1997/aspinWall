import 'package:aspinwal/app/modules/site_visit_reports_module/site_visit_reports_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../IncludeFiles/_appbar.dart';


class SiteVisitReportsPage extends GetView<SiteVisitReportsController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<SiteVisitReportsController>(builder: (myController) {
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
                child: MyAppBar(screenName: 'Client Reports',),
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
                        DataColumn(label: Text('FirstName',style: TextStyle(color:Colors.white),),),
                        DataColumn(label: Text('InTime',style: TextStyle(color:Colors.white),),),
                        DataColumn( label: Text('OutTime',style: TextStyle(color:Colors.white),),),
                        DataColumn(label: Text('FromAdress',style: TextStyle(color:Colors.white),),),
                        DataColumn(label: Text('To Adress',style: TextStyle(color:Colors.white),),),

                      ],
                      rows:myController.secScreenData.map((list) =>
                          DataRow(
                            cells: [
                              DataCell(
                                Text("${list.cardName}", textAlign: TextAlign.left,),
                              ),
                              DataCell(
                                Text("${list.firstName}", textAlign: TextAlign.left,),
                              ),
                              DataCell(
                                Text("${list.inTime}", textAlign: TextAlign.left,),
                              ),
                              DataCell(
                                Text(list.outTime.toString(), textAlign: TextAlign.center,),
                              ),
                              DataCell(
                                Text(list.fromAdress.toString(), textAlign: TextAlign.center,),
                              ),
                              DataCell(
                                Text(list.tOAddress.toString(),
                                  textAlign: TextAlign.center,
                                ),
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
