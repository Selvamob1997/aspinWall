import 'dart:io';
import 'package:aspinwal/app/modules/reimbursement_master_module/reimbursement_master_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../IncludeFiles/_appbar.dart';

class ReimbursementMasterPage extends GetView<ReimbursementMasterController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<ReimbursementMasterController>(builder: (myController) {
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
                child: MyAppBar(screenName: 'Reimbursement',),
              ),
              Container(
                height: height/7,
                width: width,
                child: Row(
                  children: [
                    Container(
                      height: height/7,
                      width: width/2,
                      child: Column(
                        children: [
                          Container(
                            height: height/20,
                            width: width/2,
                           // color: Colors.black12,
                            alignment: Alignment.center,
                            child: Text("FOOD",style: TextStyle(fontWeight: FontWeight.w700,fontSize: height/50,color: Colors.blueGrey),),

                          ),
                          Container(
                            height: height/14,
                            width: width/2,
                            //color: Colors.green,
                            child: Material(
                              elevation: 2.0,
                              borderRadius: BorderRadius.all(Radius.circular(height/10)),
                              child: TextField(
                                controller: myController.foodAmt,
                                cursorColor: Colors.blue,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    //hintText: "Total Amt",
                                    label: Text('Total Amt'),
                                    prefixIcon: Material(
                                      elevation: 0,
                                      borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                      child: const Icon(
                                        Icons.currency_rupee,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                              ),
                            ),

                          )
                        ],
                      ),

                    ),
                    Container(
                      height: height/7,
                      width: width/2,
                      child: Column(
                        children: [
                          Container(
                            height: height/20,
                            width: width/2,
                            // color: Colors.black12,
                            alignment: Alignment.center,
                            child: IconButton(
                              onPressed: () {

                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title:
                                              const Text("Gallery"),
                                              onTap: () async {

                                                myController.getgalary();
                                                Get.back();
                                              },
                                              leading:
                                              const Icon(Icons.image),
                                            ),
                                            ListTile(
                                              leading: const Icon(Icons.camera_alt),
                                              title: const Text("Camera"),
                                              onTap: () {
                                                Get.back();
                                                myController.getImage();
                                              },
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                );
                              },
                              icon: Icon(Icons.camera_alt),
                            ),

                          ),
                          Container(
                            height: height/14,
                            width: width/2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(File(myController.ImagePath)),
                                  fit: BoxFit.fill,
                                )
                            ),

                          )
                        ],
                      ),

                    ),
                  ],
                ),
              ),


              Container(
                height: height/7,
                width: width,
                child: Row(
                  children: [
                    Container(
                      height: height/7,
                      width: width/2,
                      child: Column(
                        children: [
                          Container(
                            height: height/20,
                            width: width/2,
                            // color: Colors.black12,
                            alignment: Alignment.center,
                            child: Text("ACCOMMODATIONS",style: TextStyle(fontWeight: FontWeight.w700,fontSize: height/50,color: Colors.blueGrey),),

                          ),
                          Container(
                            height: height/14,
                            width: width/2,
                            //color: Colors.green,
                            child: Material(
                              elevation: 2.0,
                              borderRadius: BorderRadius.all(Radius.circular(height/10)),
                              child: TextField(
                                controller: myController.accAmt,
                                cursorColor: Colors.blue,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    //hintText: "Total Amt",
                                    label: Text('Total Amt'),
                                    prefixIcon: Material(
                                      elevation: 0,
                                      borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                      child: const Icon(
                                        Icons.currency_rupee,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                              ),
                            ),

                          )
                        ],
                      ),

                    ),
                    Container(
                      height: height/7,
                      width: width/2,
                      child: Column(
                        children: [
                          Container(
                            height: height/20,
                            width: width/2,
                            // color: Colors.black12,
                            alignment: Alignment.center,
                            child: IconButton(
                              onPressed: () {

                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title:
                                              const Text("Gallery"),
                                              onTap: () async {

                                                myController.getAccgalary();
                                                Get.back();
                                              },
                                              leading:
                                              const Icon(Icons.image),
                                            ),
                                            ListTile(
                                              leading: const Icon(Icons.camera_alt),
                                              title: const Text("Camera"),
                                              onTap: () {
                                                Get.back();
                                                myController.getAccImage();
                                              },
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                );
                              },
                              icon: Icon(Icons.camera_alt),
                            ),

                          ),
                          Container(
                            height: height/14,
                            width: width/2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(File(myController.AccImagePath)),
                                  fit: BoxFit.fill,
                                )
                            ),

                          )
                        ],
                      ),

                    ),
                  ],
                ),
              ),

              Container(
                height: height/2.5,
                width: width,
                child: Row(
                  children: [
                    Container(
                      height: height/2,
                      width: width/2,
                      child: Column(
                        children: [
                          Container(
                            height: height/30,
                            width: width/2,
                            //color: Colors.deepOrange,
                            alignment: Alignment.center,
                            child: Text("TRAVELS",style: TextStyle(fontWeight: FontWeight.w700,fontSize: height/70,color: Colors.blueGrey),),

                          ),
                          SizedBox(height: height/80,),
                          Container(
                            height: height/14,
                            width: width/2,
                            child: Material(
                              elevation: 2.0,
                              borderRadius: BorderRadius.all(Radius.circular(height/10)),
                              child: TextField(
                                controller: myController.traveltype,
                                cursorColor: Colors.blue,
                                keyboardType: TextInputType.text,
                                readOnly: true,
                                onTap: (){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Choose Leave Type'),
                                        content: SizedBox(
                                          width: double.minPositive,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: myController.secTrnsMode.length,
                                            itemBuilder: (BuildContext context, int index) {
                                              return ListTile(
                                                title: Text(myController.secTrnsMode[index].toString()),
                                                onTap: () {

                                                  myController.traveltype.text = myController.secTrnsMode[index].toString();
                                                  //myController.leaveCode = myController.secLeaveTypeList[index].code;
                                                  Navigator.pop(context,);

                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                decoration: InputDecoration(
                                   // hintText: "Type",
                                    label: Text('Travel Type'),
                                    prefixIcon: Material(
                                      elevation: 0,
                                      borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                      child: const Icon(
                                        Icons.emoji_transportation,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                              ),
                            ),

                          ),
                          SizedBox(height: height/80,),
                          Container(
                            height: height/14,
                            width: width/2,
                            //color: Colors.green,
                            child: Material(
                              elevation: 2.0,
                              borderRadius: BorderRadius.all(Radius.circular(height/10)),
                              child: TextField(
                                controller: myController.travelfromLocation,
                                cursorColor: Colors.blue,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: "From Location",
                                    prefixIcon: Material(
                                      elevation: 0,
                                      borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                      child: const Icon(
                                        Icons.location_on_rounded,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                              ),
                            ),

                          ),
                          SizedBox(height: height/80,),
                          Container(
                            height: height/14,
                            width: width/2,
                            //color: Colors.green,
                            child: Material(
                              elevation: 2.0,
                              borderRadius: BorderRadius.all(Radius.circular(height/10)),
                              child: TextField(
                                controller: myController.traveltoLocation,
                                cursorColor: Colors.blue,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: "Destination",
                                    prefixIcon: Material(
                                      elevation: 0,
                                      borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                      child: const Icon(
                                        Icons.location_on_rounded,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                              ),
                            ),

                          ),
                          SizedBox(height: height/80,),
                          Container(
                            height: height/14,
                            width: width/2,
                            //color: Colors.green,
                            child: Material(
                              elevation: 2.0,
                              borderRadius: BorderRadius.all(Radius.circular(height/10)),
                              child: TextField(
                                controller: myController.travelTotalAmt,
                                cursorColor: Colors.blue,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: "Total Amt",
                                    prefixIcon: Material(
                                      elevation: 0,
                                      borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                      child: const Icon(
                                        Icons.currency_rupee,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                              ),
                            ),

                          )
                        ],
                      ),

                    ),
                    Container(
                      height: height/2,
                      width: width/2,
                      child: Column(
                        children: [
                          Container(
                            height: height/20,
                            width: width/2,
                            // color: Colors.black12,
                            alignment: Alignment.center,
                            child: IconButton(
                              onPressed: () {

                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title:
                                              const Text("Gallery"),
                                              onTap: () async {

                                                myController.getTravelgalary();
                                                Get.back();
                                              },
                                              leading:
                                              const Icon(Icons.image),
                                            ),
                                            ListTile(
                                              leading: const Icon(Icons.camera_alt),
                                              title: const Text("Camera"),
                                              onTap: () {
                                                Get.back();
                                                myController.getTravelImage();
                                              },
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                );
                              },
                              icon: Icon(Icons.camera_alt),
                            ),

                          ),
                          Container(
                            height: height/3,
                            width: width/2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(File(myController.TravelImagePath)),
                                  fit: BoxFit.fill,
                                )
                            ),

                          )
                        ],
                      ),

                    ),
                  ],
                ),
              ),


              Container(
                height: height/2.5,
                width: width,
                child: Row(
                  children: [
                    Container(
                      height: height/2,
                      width: width/2,
                      child: Column(
                        children: [
                          Container(
                            height: height/30,
                            width: width/2,
                            //color: Colors.deepOrange,
                            alignment: Alignment.center,
                            child: Text("ADD FUEL EXPENSE ",style: TextStyle(fontWeight: FontWeight.w700,fontSize: height/70,color: Colors.blueGrey),),

                          ),
                          SizedBox(height: height/80,),
                          Container(
                            height: height/14,
                            width: width/2,
                            //color: Colors.green,
                            child: Material(
                              elevation: 2.0,
                              borderRadius: BorderRadius.all(Radius.circular(height/10)),
                              child: TextField(
                                controller: myController.fueltype,
                                cursorColor: Colors.blue,
                                keyboardType: TextInputType.text,
                                readOnly: true,
                                onTap: (){

                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Choose Leave Type'),
                                        content: SizedBox(
                                          width: double.minPositive,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: myController.secVichleTye.length,
                                            itemBuilder: (BuildContext context, int index) {
                                              return ListTile(
                                                title: Text(myController.secVichleTye[index].toString()),
                                                onTap: () {

                                                  myController.fueltype.text = myController.secVichleTye[index].toString();
                                                  //myController.leaveCode = myController.secLeaveTypeList[index].code;
                                                  Navigator.pop(context,);

                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  );


                                },
                                decoration: InputDecoration(
                                    hintText: "Type",
                                    prefixIcon: Material(
                                      elevation: 0,
                                      borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                      child: const Icon(
                                        Icons.emoji_transportation,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                              ),
                            ),

                          ),
                          SizedBox(height: height/80,),
                          Container(
                            height: height/14,
                            width: width/2,
                            //color: Colors.green,
                            child: Material(
                              elevation: 2.0,
                              borderRadius: BorderRadius.all(Radius.circular(height/10)),
                              child: TextField(
                                controller: myController.fuelTotalDistance,
                                cursorColor: Colors.blue,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  label: Text('Total Dis'),
                                    prefixIcon: Material(
                                      elevation: 0,
                                      borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                      child: const Icon(
                                        Icons.location_on_rounded,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                              ),
                            ),

                          ),
                          SizedBox(height: height/80,),
                          Container(
                            height: height/14,
                            width: width/2,
                            //color: Colors.green,
                            child: Material(
                              elevation: 2.0,
                              borderRadius: BorderRadius.all(Radius.circular(height/10)),
                              child: TextField(
                                controller: myController.fuelTotalAmt,
                                cursorColor: Colors.blue,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    //hintText: "Total Amt",
                                    label: Text('Total Amt'),
                                    prefixIcon: Material(
                                      elevation: 0,
                                      borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                      child: const Icon(
                                        Icons.currency_rupee_outlined,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                              ),
                            ),

                          ),
                          SizedBox(height: height/80,),
                          Container(
                            height: height/14,
                            width: width/2,
                            //color: Colors.green,
                            child: Material(
                              elevation: 2.0,
                              borderRadius: BorderRadius.all(Radius.circular(height/10)),
                              child: TextField(
                                controller: myController.fuelremarks,
                                cursorColor: Colors.blue,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    //hintText: "Remarks",
                                    label: Text('Remarks'),
                                    prefixIcon: Material(
                                      elevation: 0,
                                      borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                              ),
                            ),

                          )
                        ],
                      ),

                    ),
                    Container(
                      height: height/2,
                      width: width/2,
                      child: Column(
                        children: [
                          Container(
                            height: height/20,
                            width: width/2,
                            // color: Colors.black12,
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Text("Starting KM"),
                                IconButton(
                                  onPressed: () {

                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  title:
                                                  const Text("Gallery"),
                                                  onTap: () async {

                                                    myController.getStaKMgalary();
                                                    Get.back();
                                                  },
                                                  leading:
                                                  const Icon(Icons.image),
                                                ),
                                                ListTile(
                                                  leading: const Icon(Icons.camera_alt),
                                                  title: const Text("Camera"),
                                                  onTap: () {
                                                    Get.back();
                                                    myController.getStaKMImage();
                                                  },
                                                )
                                              ],
                                            ),
                                          );
                                        }
                                    );
                                  },
                                  icon: Icon(Icons.camera_alt),
                                ),
                              ],
                            ),

                          ),
                          Container(
                            height: height/10,
                            width: width/2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(File(myController.StartinKMImagePath)),
                                  fit: BoxFit.fill,
                                )
                            ),

                          ),
                          Container(
                            height: height/20,
                            width: width/2,
                            // color: Colors.black12,
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Text("Ending KM"),
                                IconButton(
                                  onPressed: () {

                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  title:
                                                  const Text("Gallery"),
                                                  onTap: () async {

                                                    myController.getEndKMgalary();
                                                    Get.back();
                                                  },
                                                  leading:
                                                  const Icon(Icons.image),
                                                ),
                                                ListTile(
                                                  leading: const Icon(Icons.camera_alt),
                                                  title: const Text("Camera"),
                                                  onTap: () {
                                                    Get.back();
                                                    myController.getEndKMImage();
                                                  },
                                                )
                                              ],
                                            ),
                                          );
                                        }
                                    );
                                  },
                                  icon: Icon(Icons.camera_alt),
                                ),
                              ],
                            ),

                          ),
                          Container(
                            height: height/10,
                            width: width/2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(File(myController.EndingKMImagePath)),
                                  fit: BoxFit.fill,
                                )
                            ),

                          )
                        ],
                      ),

                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
        persistentFooterButtons: [
          InkWell(
            onTap: (){

              myController.postSave(2);
            },
            child: Container(
              height: height/15,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(width/7),
                    bottomRight: Radius.circular(width/7),
                  )
              ),
              alignment: Alignment.center,
              child: Text('Send Request',style: TextStyle(color: Colors.white,fontSize: height/35,fontWeight: FontWeight.bold),),

            ),
          )
        ],
      ),
    );
  });
}
