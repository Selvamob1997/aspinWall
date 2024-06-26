import 'package:aspinwal/app/modules/attendance_page_module/attendance_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class AttendancePagePage extends GetView<AttendancePageController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<AttendancePageController>(builder: (controllermain) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
                height: height/1.7,
                width: width/1.1,
                margin: EdgeInsets.only(left: width/20),
                child:GoogleMap(
                  initialCameraPosition:  CameraPosition(target: controllermain.latlong!, zoom: 15.0,),
                  markers: <Marker>{
                    Marker(
                        markerId: const MarkerId('1'),
                        position: controllermain.latlong!,
                        infoWindow: const InfoWindow(
                          title: 'My Position',
                        )
                    ),
                  },
                  onMapCreated: (GoogleMapController controller){
                    controllermain.controller.complete(controller);
                  },
                )),
            SizedBox(height: height/15,),
            Card(
              elevation: 5,
              color: Colors.white.withOpacity(0.8),
              child: Column(
                children: [
                  Container(
                    height: height/25,
                    width: width/1.1,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: width/50),
                    child: Row(
                      children: [
                        SizedBox(width: width/3,child:  const Text("Name",style: TextStyle(color: Colors.black38),)),
                        Text(controllermain.sessionName.toString()),
                      ],
                    ),
                  ),
                  Container(
                    height: height/30,
                    width: width/1.1,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: width/50),
                    child: Row(
                      children: [
                        SizedBox(width: width/3,child:  const Text("Department Name",style: TextStyle(color: Colors.black38),)),
                        Text(controllermain.sessionDeptName.toString()),
                      ],
                    ),
                  ),
                  Container(
                    height: height/30,
                    width: width/1.1,
                    margin: EdgeInsets.only(left: width/50),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        SizedBox(width: width/3,child: const Text("Your Latitude",style: TextStyle(color: Colors.black38),)),
                        Text(controllermain.insetlat.toString()),
                      ],
                    ),
                  ),
                  Container(
                    height: height/30,
                    width: width/1.1,
                    margin: EdgeInsets.only(left: width/50),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        SizedBox(width: width/3,child:  const Text("Your Longitude",style: TextStyle(color: Colors.black38),)),
                        Text(controllermain.insetlon.toString()),
                      ],
                    ),
                  ),
                  Container(
                    height: height/30,
                    width: width/1.1,
                    margin: EdgeInsets.only(left: width/50),
                    alignment: Alignment.centerLeft,
                    child: Text(controllermain.insetAddress.toString()),
                  )
                ],
              ),
            )
          ],
        ),
        persistentFooterButtons: [
          Visibility(
            visible: controllermain.attendancestatus.toString()=="C"?false:true,
            child: InkWell(
              onTap: (){
                if(controllermain.attendancestatus.toString()=="0"){
                  controllermain.startattendance();
                }else{
                  controllermain.stopattendance();
                }

              },
              child: Container(
                height: height/15,
                width: width,
                decoration: BoxDecoration(
                    color: controllermain.attendancestatus.toString()=="0"?Colors.orangeAccent:Colors.pinkAccent,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(width/7),
                      bottomRight: Radius.circular(width/7),
                    )
                ),
                alignment: Alignment.center,
                child: Text( controllermain.attendancestatus.toString()=="0"?'Start Attendance':'Stop Attendance',style: TextStyle(color: Colors.white,fontSize: height/35,fontWeight: FontWeight.bold),),
              ),
            ),
          )
        ],

      ),
    );
  });
}
