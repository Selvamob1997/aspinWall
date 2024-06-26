import 'package:aspinwal/app/modules/leavemater_approval_module/leavemater_approval_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../IncludeFiles/_appbar.dart';


class LeavematerApprovalPage extends GetView<LeavematerApprovalController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<LeavematerApprovalController>(builder: (myController) {
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
                child: MyAppBar(screenName: 'Leave Approval',),
              ),
              Container(
                height: height/1.5,
                width: width,
                //color: Colors.orange,
                child: ListView.builder(
                  itemCount: myController.secScreenData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: myController.secScreenData[index].status=="A"?Colors.greenAccent:
                              myController.secScreenData[index].status=="R"?Colors.red.shade300:Colors.white,
                      child: ListTile(
                        dense: true,
                        leading: Text(myController.secScreenData[index].empId.toString(),style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold),),
                        title: Column(
                          children: [
                            Container(
                              height: height/18,
                              width: width,
                              alignment: Alignment.centerLeft,
                              child: Text(myController.secScreenData[index].empName.toString()),
                            ),

                            Container(
                              height: height/40,
                              width: width,
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width/3.5,
                                    child: Text("Leave Type",style: TextStyle(fontSize: height/60,fontWeight: FontWeight.w500),),
                                  ),
                                  SizedBox(
                                      width: width/3.5,
                                      child: Text(myController.secScreenData[index].leaveType.toString())),
                                ],
                              ),
                            ),

                            Container(
                              height: height/40,
                              width: width,
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width/3.5,
                                    child: Text("No OF Days",style: TextStyle(fontSize: height/60,fontWeight: FontWeight.w500),),
                                  ),
                                  SizedBox(
                                      width: width/3.5,
                                      child: Text(myController.secScreenData[index].noOfDays.toString())),
                                ],
                              ),
                            ),

                            Container(
                              height: height/40,
                              width: width,
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width/3.5,
                                    child: Text("Comments",style: TextStyle(fontSize: height/60,fontWeight: FontWeight.w500),),
                                  ),
                                  SizedBox(
                                      width: width/3.5,
                                      child: Text(myController.secScreenData[index].comments.toString())),
                                ],
                              ),
                            ),

                            Container(
                              height: height/40,
                              width: width,
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width/3.5,
                                    child: Text("Date",style: TextStyle(fontSize: height/60,fontWeight: FontWeight.w500),),
                                  ),
                                  SizedBox(
                                      width: width/3.5,
                                      child: Text(myController.secScreenData[index].docDate.toString())),
                                ],
                              ),
                            ),
                          ],
                        ),
                        subtitle: Container(
                          height: height/40,
                          width: width,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              SizedBox(
                                  width: width/3.5,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                    onPressed: () {
                                      showDialog<void>(
                                        context: context,
                                        barrierDismissible: false,
                                        // user must tap button!
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Column(
                                              children: const [
                                                Text("Do You Want to Approve ?"),
                                                Padding(
                                                  padding: EdgeInsets.all(15),
                                                ),
                                              ],
                                            ),

                                            actions: <Widget>[
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                                child: Text('CANCEL'),
                                                onPressed: () {
                                                  Get.back();
                                                },
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                                child: Text('OK'),
                                                onPressed: () {
                                                  Get.back();
                                                  myController.updateScreenStatus("A", myController.secScreenData[index].docNo,"Approved Successfully","Success");

                                                  // myController.updatePO(
                                                  //     myController.secScreenData[index].docEntry,
                                                  //     myController.secScreenData[index].remarks, "A",
                                                  //     "Approved Successfully..", "Approved");
                                                },
                                              ),

                                            ],
                                          );
                                        },
                                      );

                                    },
                                    child: const Text('Approve'),
                                  )
                              ),
                              SizedBox(
                                width: width/10,
                              ),
                              SizedBox(
                                  width: width/5.5,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                                    onPressed: () {
                                      showDialog<void>(
                                        context: context,
                                        barrierDismissible: false,
                                        // user must tap button!
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Column(
                                              children: const [
                                                Text("Do You Want to Reject ?"),
                                                Padding(
                                                  padding: EdgeInsets.all(15),
                                                ),
                                              ],
                                            ),

                                            actions: <Widget>[
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                                child: Text('CANCEL'),
                                                onPressed: () {
                                                  Get.back();
                                                },
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                                child: Text('OK'),
                                                onPressed: () {

                                                  Get.back();
                                                  myController.updateScreenStatus("R", myController.secScreenData[index].docNo,"Reject Successfully","Success");;
                                                },
                                              ),

                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Text('Reject'),
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    );

                  },
                ),
              ),

            ],
          ),
        ),
        persistentFooterButtons: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                child: Text('Pending'),
                onPressed: () {
                  myController.getApprovelData("P");

                },
              ),
              SizedBox(width: width/50,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Text('Approve'),
                onPressed: () {
                  myController.getApprovelData("A");
                },
              ),
              SizedBox(width: width/50,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: Text('Reject'),
                onPressed: () {

                  myController.getApprovelData("R");
                },
              ),
            ],
          )

        ],
      ),
    );
  });
}