import 'package:aspinwal/app/modules/my_actity_module/my_actity_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../IncludeFiles/_appbar.dart';


class MyActityPage extends GetView<MyActityController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<MyActityController>(builder: (myController) {
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
                child: MyAppBar(screenName: 'My Activity',),
              ),
              SizedBox(height: height/60,),
              SingleChildScrollView(
                padding: EdgeInsets.all(5.0),
                scrollDirection: Axis.horizontal,
                child:  myController.secScreenData.isNotEmpty ?
                DataTable(
                  columnSpacing: 20.0,
                  headingRowColor:
                  MaterialStateProperty.all(Colors.blue),
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Edit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'ScreenName',
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
                        'DocNo',
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
                        'Contact Person',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'MobileNo',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Remarks',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                  rows: myController.secScreenData.map((list) =>
                      DataRow(
                          cells: [
                            DataCell(
                                IconButton(
                                  onPressed: () {
                                    myController.navigationCnt(
                                        list.screenName.toString(),
                                        list.docNo.toString());
                                  },
                                  icon: Icon(Icons.edit),)),
                            DataCell(Text(
                                list.screenName.toString(),
                                textAlign: TextAlign.center)),
                            DataCell(Text(
                                list.type.toString(),
                                textAlign: TextAlign.center)),
                            DataCell(Text(
                                list.docNo.toString(),
                                textAlign: TextAlign.center)),
                            DataCell(Text(
                                list.cardName.toString(),
                                textAlign: TextAlign.center)),
                            DataCell(Text(
                                list.contactPerson.toString(),
                                textAlign: TextAlign.center)),
                            DataCell(Text(
                                list.contactNo.toString(),
                                textAlign: TextAlign.center)),
                            DataCell(Text(
                                list.remarks.toString(),
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
