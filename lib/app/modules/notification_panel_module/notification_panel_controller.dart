import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../data/Model/NotificationModel.dart';
import '../../data/repository/_allAPIList.dart';
import '../../utils/Utilites.dart';


class NotificationPanelController extends GetxController{

  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';
  late NotificationModel rawNotificationModel;
  List<ScreenData> secScreenData=[];

  @override
  void onInit() {
    // TODO: implement onInit
    getStringValuesSF();
    update();
    super.onInit();
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sessionUseId  =   prefs.getString('UserID').toString();
    sessionName = prefs.getString('FirstName').toString();
    sessionDeptCode = prefs.getString('DeptCode').toString();
    sessionDeptName = prefs.getString('DeptName').toString();
    getMyFilter();
    update();
  }

  getMyFilter(){
    Allapi.getDashBoardDatafilter(4, sessionUseId,true).then((value) => {
      if(value.statusCode==200){
        log(value.body),
        rawNotificationModel = NotificationModel.fromJson(jsonDecode(value.body)),
        for(int k=0;k<rawNotificationModel.result!.length;k++){
          secScreenData.add(
              ScreenData(
                  rawNotificationModel.result![k].screenName,
                  rawNotificationModel.result![k].docNo,
                  rawNotificationModel.result![k].satus,
                  rawNotificationModel.result![k].position),
          )
        },
        Utilities.closeLoader(),
        update(),
      }else {
        Utilities.closeLoader(),
        update(),
      }
    });
  }



}


class ScreenData {
  String? screenName;
  String? docNo;
  String? satus;
  int? position;

  ScreenData(this.screenName, this.docNo, this.satus, this.position);

}
