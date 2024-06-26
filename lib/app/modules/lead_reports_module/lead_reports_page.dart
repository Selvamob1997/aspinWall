import 'package:aspinwal/app/modules/lead_reports_module/lead_reports_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../IncludeFiles/_appbar.dart';


class LeadReportsPage extends GetView<LeadReportsController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<LeadReportsController>(builder: (myColltroler) {
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
                child: MyAppBar(screenName: 'Lead Repors',),
              ),
              SizedBox(height: height/100,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: height/70),
                child: Material(
                  elevation: 2.0,
                  child: SizedBox(
                      height: height/1.1,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            sortColumnIndex: 0,
                            sortAscending: true,
                            headingRowColor: MaterialStateProperty.all(Colors.greenAccent),
                            showCheckboxColumn: false,
                            dataRowHeight: height/ 25,
                            headingRowHeight: height/ 25,
                            border: TableBorder.all(color: Colors.green.shade50),
                            columns: const <DataColumn>[
                              DataColumn(label: Text('Lead No', style: TextStyle(color: Colors.black45),),),
                              DataColumn(label: Text('CardName', style: TextStyle(color: Colors.black45),),),
                              DataColumn(label: Text('mobileNo', style: TextStyle(color: Colors.black45),),),
                              DataColumn(label: Text('ContactPerson', style: TextStyle(color: Colors.black45),),),
                              DataColumn(label: Text('Email', style: TextStyle(color: Colors.black45),),),
                              DataColumn(label: Text('StreetName', style: TextStyle(color: Colors.black45),),),
                              DataColumn(label: Text('OfficeNo', style: TextStyle(color: Colors.black45),),),
                              DataColumn(label: Text('DocDate', style: TextStyle(color: Colors.black45),),),
                              DataColumn(label: Text('State', style: TextStyle(color: Colors.black45),),),

                            ],
                            rows: myColltroler.secScreendata .map((list) =>
                                DataRow(cells: [
                                  DataCell(
                                      Text(list.docNo.toString(),),
                                      showEditIcon: true,
                                      onTap: (){

                                      }

                                  ),
                                  DataCell(
                                    Text(list. cardName.toString(),),

                                  ),
                                  DataCell(
                                    Text(list.mobileNo.toString(),),
                                  ),
                                  DataCell(
                                    Text(list.contactPerson.toString(),),
                                  ),
                                  DataCell(
                                    Text(list.email.toString(),),
                                  ),
                                  DataCell(
                                    Text(
                                      list.streetName.toString(),
                                    ),
                                  ),
                                  DataCell(
                                    Text(list.officeNo.toString(),),
                                  ),
                                  DataCell(
                                    Text(list.docDate.toString(),),
                                  ),
                                  DataCell(
                                    Text(list.state.toString(),),
                                  ),
                                ],
                                ),
                            ).toList(),
                          ),
                        ),
                      )
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
