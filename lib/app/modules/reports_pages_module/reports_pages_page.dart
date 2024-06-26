import 'package:aspinwal/app/modules/reports_pages_module/reports_pages_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../IncludeFiles/_appbar.dart';


class ReportsPagesPage extends GetView<ReportsPagesController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<ReportsPagesController>(builder: (myController) {
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
                child: MyAppBar(screenName: 'Reports',),
              ),
              InkWell(
                onTap: (){
                  myController.navigationController(1);
                },
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(height/50),
                  ),
                  child: Container(
                    height: height/15,
                    width: width,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          width: width/5,
                            child: Icon(Icons.chevron_right_outlined,color: Colors.pinkAccent,size: height/30,),
                        ),
                        Container(
                          width: width/2,
                          child: Text("Sales Quatation"),
                        ),
                      ],
                    ),

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
