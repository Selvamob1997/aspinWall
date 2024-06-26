// ignore_for_file: avoid_types_as_parameter_names, file_names

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import '../IncludeFiles/_sidemenu.dart';


abstract class Utilities{

  static void showLoader() async {
    await Get.dialog(
       WillPopScope(
         onWillPop: ()async=> true,
         child: Center(
          child: SizedBox(
            height: 250,
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Image.asset("assets/icon.png"),
                ],
              ),
            ),
          ),
      ),
       ),
      barrierDismissible: false,
    );
  }

  static void showMapLoader() async {
    await Get.dialog(
      WillPopScope(
        onWillPop: () async=>false,
        child: Scaffold(
          body: Center(
            child: SizedBox(
              height: 250,
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Image.asset("assets/icon.png"),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void closeLoader() {
    closeDialog();
  }

  static void closeDialog() {
    if (Get.isDialogOpen ?? false) Get.back<void>();
  }

  static alertsnackBar(title,msg,int) {
    return Get.snackbar(
        title,
        msg,
        colorText: Colors.white,
        backgroundColor: int==1?Colors.deepOrange:int==2?Colors.red:Colors.green,
        icon: int==1? const Icon(Icons.add_alert):int==2?const Icon(Icons.error):const Icon(Icons.ac_unit_outlined),
        snackPosition: SnackPosition.TOP,
    );
  }

  static showDialaogboxAlert(context, String message,String tittle) {
    return Get.dialog(
      SizedBox(
        height: 250,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Material(
                    child: SizedBox(
                      width: 280,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(tittle, textAlign: TextAlign.center,),
                          const SizedBox(height: 15),
                          Text(message, textAlign: TextAlign.center,),
                          const SizedBox(height: 20),
                          //Buttons
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: const Color(0xFFFFFFFF), backgroundColor: Colors.amber, minimumSize: const Size(0, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                Get.back();
                                Get.back();
                              },
                              child: const Text(
                                'YES',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static showDialaogboxWarning(context, String message,String tittle) {
    return Get.dialog(
      WillPopScope(
        onWillPop: () async=>false,
        child: SizedBox(
          height: 250,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Material(
                      color: Colors.transparent,
                      child: SizedBox(
                        width: 280,
                        child: Column(
                          children: [
                            Text(message, textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 25 ),),
                            const SizedBox(height: 20),
                            //Buttons
                            SizedBox(
                              width: 100,
                              child: IconButton(
                                onPressed: () {
                                  Get.back();
                                  },
                                icon: Icon(Icons.arrow_drop_down_circle,color: Colors.white,size: 30,),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static showDialaogboxBack(context, String message,String tittle) {
    return Get.dialog(
      WillPopScope(
        onWillPop: () async=>false,
        child: SizedBox(
          height: 250,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Material(
                      child: SizedBox(
                        width: 280,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Text(tittle, textAlign: TextAlign.center,),
                            const SizedBox(height: 15),
                            Text(message, textAlign: TextAlign.center,),
                            const SizedBox(height: 20),
                            //Buttons
                            SizedBox(
                              width: 250,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: const Color(0xFFFFFFFF), backgroundColor: Colors.amber, minimumSize: const Size(0, 45),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () {
                                      Get.back();
                                      Get.back();
                                    },
                                    child: const Text(
                                      'Yes',
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: const Color(0xFFFFFFFF), backgroundColor: Colors.amber, minimumSize: const Size(0, 45),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text(
                                      'No',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static logot(){
    //RouteManageMent.goToLogin();
  }

  static alertsidemenu(context){
    showAnimatedDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: const SideMenu(),
          );
        },
        );
      },
      animationType: DialogTransitionType.slideFromBottom,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }

  static showDialaogboxWarningMessage(context, String message,String tittle) {
    return Get.dialog(
      WillPopScope(
        onWillPop: () async=>false,
        child: SizedBox(
          height: 250,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Material(
                      child: SizedBox(
                        width: 280,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Text(tittle, textAlign: TextAlign.center,),
                            const SizedBox(height: 15),
                            Text(message, textAlign: TextAlign.center,),
                            const SizedBox(height: 20),
                            //Buttons
                            SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: const Color(0xFFFFFFFF), backgroundColor: Colors.amber, minimumSize: const Size(0, 45),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text(
                                  'YES',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static showDialaogboxSavedMessage(context, String message,String tittle) {
    return Get.dialog(
      WillPopScope(
        onWillPop: () async=>false,
        child: SizedBox(
          height: 250,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Material(
                      child: SizedBox(
                        width: 280,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Text(tittle, textAlign: TextAlign.center,),
                            const SizedBox(height: 15),
                            Text(message, textAlign: TextAlign.center,),
                            const SizedBox(height: 20),
                            //Buttons
                            SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: const Color(0xFFFFFFFF), backgroundColor: Colors.green, minimumSize: const Size(0, 45),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  Get.back();
                                  Get.back();
                                },
                                child: const Text(
                                  'YES',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}