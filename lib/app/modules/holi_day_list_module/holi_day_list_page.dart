import 'package:aspinwal/app/modules/holi_day_list_module/holi_day_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../IncludeFiles/_appbar.dart';


class HoliDayListPage extends GetView<HoliDayListController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<HoliDayListController>(builder: (myController) {
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
                child: MyAppBar(screenName: 'Holiday List',),
              ),
              SizedBox(
                height: height/1.2,
                width: width,
                child: ListView.builder(
                  itemCount: myController.secScreenHoliday.length,
                  itemBuilder: (BuildContext context, int index) {
                    return  Card(
                      elevation: 10,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        height: height/10,
                        width: width/3.2,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white,
                              //Colors.white,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: height/15,
                                  width: width/7.3,
                                  alignment: Alignment.center,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.lightBlueAccent,
                                    child: Text((index+1).toString(),style: TextStyle(color: Colors.black),),
                                  ),

                                ),
                                Container(
                                  height: height/25,
                                  width: width/1.8,
                                  alignment: Alignment.centerLeft,
                                  child: Text(myController.secScreenHoliday[index].uRmrks.toString(),style: TextStyle(fontSize: height/80,fontWeight: FontWeight.bold,color: Colors.blueGrey),),
                                ),
                                Container(
                                  height: height/35,
                                  width: width/4.3,
                                  alignment: Alignment.center,
                                  child: Text(myController.secScreenHoliday[index].sTADATE.toString(),style: TextStyle(fontSize: height/80,fontWeight: FontWeight.bold,color: Colors.white),),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(height/50),
                                        bottomRight: Radius.circular(height/50),
                                    )
                                    
                                  ),

                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: height/30,
                                  width: width/7.3,
                                ),
                                Container(
                                  height: height/30,
                                  width: width/1.8,

                                ),
                                Container(
                                  height: height/35,
                                  width: width/4.3,
                                  alignment: Alignment.center,
                                  child: Text(myController.secScreenHoliday[index].eNDDATE.toString(),style: TextStyle(fontSize: height/80,fontWeight: FontWeight.bold,color: Colors.white),),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(height/50),
                                        bottomRight: Radius.circular(height/50),
                                      )

                                  ),

                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },),
              )
            ],
          ),
        ),
      ),
    );
  });
}
