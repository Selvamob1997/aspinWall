import 'dart:convert';
import 'dart:developer';

import 'package:aspinwal/app/data/Model/OndutyReportModel.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';

import '../../data/repository/_allAPIList.dart';
import '../../utils/Utilites.dart';


class OndutyApproveController extends GetxController{

  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';

  late OndutyReportModel rawOndutyReportModel;
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
    update();
    getApprovelData("P");

  }



  getApprovelData(status){
    secScreenData.clear();
    update();
    Allapi.getAllReports(11, "0", status, "type", sessionUseId, "docEntry", true).then((value) => {
      if(value.statusCode==200){
        print(jsonDecode(value.body)['status']),
        log(value.body),
        if(jsonDecode(value.body)['status'].toString()=="1"){

          rawOndutyReportModel = OndutyReportModel.fromJson(jsonDecode(value.body)),
          for(int i=0;i<rawOndutyReportModel.result!.length;i++){
            secScreenData.add(
                ScreenData(
                    rawOndutyReportModel.result![i].ondutyType,
                    rawOndutyReportModel.result![i].fromDate,
                    rawOndutyReportModel.result![i].toDate,
                    rawOndutyReportModel.result![i].fromLoc,
                    rawOndutyReportModel.result![i].toLocation,
                    rawOndutyReportModel.result![i].fromTime,
                    rawOndutyReportModel.result![i].toTime,
                    rawOndutyReportModel.result![i].purpose,
                    rawOndutyReportModel.result![i].status,
                    rawOndutyReportModel.result![i].empId,
                    rawOndutyReportModel.result![i].empName,
                    rawOndutyReportModel.result![i].docNo
                ))

          }

        },
        Utilities.closeLoader(),
        update(),
      }else {
        Utilities.closeLoader(),
        update(),
      }
    });

  }

  updateScreenStatus(status,docEntry,message,headingMsg){
    Allapi.getAllReports(12, "docNo", status, "type", sessionUseId, docEntry, true).then((value) => {
      if(value.statusCode==200){
        print(value.body),
        Utilities.closeLoader(),
        update(),
        //getApprovelData("P"),
        Utilities.showDialaogboxAlert(context, message.toString(), headingMsg.toString())

      }else{

        Utilities.closeLoader(),
        update(),
        Utilities.showDialaogboxAlert(context, "Server Error", "Error")

      }
    });

  }
}


class ScreenData {
  String? ondutyType;
  String? fromDate;
  String? toDate;
  String? fromLoc;
  String? toLocation;
  String? fromTime;
  String? toTime;
  String? purpose;
  String? status;
  String? empId;
  String? empName;
  var docNo;

  ScreenData(this.ondutyType,
      this.fromDate,
      this.toDate,
      this.fromLoc,
      this.toLocation,
      this.fromTime,
      this.toTime,
      this.purpose,this.status,this.empId,this.empName,this.docNo);
}
