import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'my_profile_page_controller.dart';
import 'package:lottie/lottie.dart';


class MyProfilePagePage extends GetView<MyProfilePageController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<MyProfilePageController>(builder: (controllermain) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: height/3,
                    width: width,
                    color: Colors.blue.shade900,
                  ),
                  Container(
                    height: height/4,
                    width: width,
                    margin: EdgeInsets.only(top: height/10),
                    child: Column(
                      children: [
                        Container(
                          height: height/7,
                          width: width/2,
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: (){
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

                                              controllermain.getgalary();
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
                                              controllermain.getImage();
                                            },
                                          )
                                        ],
                                      ),
                                    );
                                  }
                              );
                            },
                            child: controllermain.ImagePath==''?
                            CircleAvatar(
                              minRadius: 20,
                              backgroundColor: Colors.white,
                              child: Lottie.asset("assets/user.json"),
                            ) :
                            CircleAvatar(
                              minRadius: 20,
                              //radius: 20,
                              backgroundColor: Colors.white,
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(height/5)),
                                      image: DecorationImage(
                                        image: FileImage(File(controllermain.ImagePath)),
                                        fit: BoxFit.fill,
                                      )
                                  )
                              ),
                            ),
                          )
                        ),
                        SizedBox(height: height/80,),
                        Container(
                          height: height/50,
                          width: width/2,
                          alignment: Alignment.center,
                          child: Text(controllermain.sessionName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(height: height/80,),
                        Container(
                          height: height/50,
                          width: width/2,
                          alignment: Alignment.center,
                          child: Text(controllermain.sessionDeptName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: height/50),),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height/50,),
              Container(
                height: height/1.9,
                width: width,
                child: Column(
                  children: [
                    Container(
                      height: height/15,
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: height/15,
                            width: width/6,
                            child: Icon(Icons.location_on_rounded,color: Colors.pink,),
                          ),
                          Container(
                            height: height/15,
                            width: width/3,
                            alignment: Alignment.centerLeft,
                            child: Text(controllermain.sessionHomeCity,style: TextStyle(fontSize: height/60,fontWeight: FontWeight.w700,color: Colors.grey),),
                          ),
                          Container(
                            height: height/15,
                            width: width/6,
                            child: Icon(Icons.call,color: Colors.pink,),
                          ),
                          Container(
                            height: height/15,
                            width: width/3,
                            alignment: Alignment.centerLeft,
                            child: Text(controllermain.sessionMobile,style: TextStyle(fontSize: height/60,fontWeight: FontWeight.w700,color: Colors.grey),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height/80,),
                    Container(
                      height: height/20,
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: height/15,
                            width: width/6,
                            child: Icon(Icons.mail,color: Colors.pink,),
                          ),
                          Container(
                            height: height/15,
                            width: width/1.3,
                            alignment: Alignment.centerLeft,
                            child: Text(controllermain.sessionEmail,style: TextStyle(fontSize: height/60,fontWeight: FontWeight.w700,color: Colors.grey),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height/80,),
                    Container(
                      height: height/20,
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: height/15,
                            width: width/6,
                            child: Icon(Icons.account_balance,color: Colors.pink,),
                          ),
                          Container(
                            height: height/15,
                            width: width/1.3,
                            alignment: Alignment.centerLeft,
                            child: Text(controllermain.sessionBankAc,style: TextStyle(fontSize: height/60,fontWeight: FontWeight.w700,color: Colors.grey),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height/80,),
                    Container(
                      height: height/20,
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: height/15,
                            width: width/6,
                            child: Icon(Icons.streetview,color: Colors.pink,),
                          ),
                          Container(
                            height: height/15,
                            width: width/1.3,
                            alignment: Alignment.centerLeft,
                            child: Text(controllermain.sessionHomeSt,style: TextStyle(fontSize: height/60,fontWeight: FontWeight.w700,color: Colors.grey),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height/80,),
                    Container(
                      height: height/20,
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: height/15,
                            width: width/6,
                            child: Icon(Icons.phone_android_rounded,color: Colors.pink,),
                          ),
                          Container(
                            height: height/15,
                            width: width/1.3,
                            alignment: Alignment.centerLeft,
                            child: Text(controllermain.sessionOffTel,style: TextStyle(fontSize: height/60,fontWeight: FontWeight.w700,color: Colors.grey),),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  });
}
