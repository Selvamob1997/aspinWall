import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';

import '../../data/Model/LeaveReportModel.dart';
import '../../data/repository/_allAPIList.dart';
import '../../utils/Utilites.dart';


class LeavematerApprovalController extends GetxController{

  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';

  late LeaveReportModel rawLeaveReportModel;
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
    Allapi.getAllReports(7, "0", status, "type", sessionUseId, "docEntry", true).then((value) => {
      if(value.statusCode==200){
        print(jsonDecode(value.body)['status']),
        log(value.body),
        if(jsonDecode(value.body)['status'].toString()=="1"){

          rawLeaveReportModel = LeaveReportModel.fromJson(jsonDecode(value.body)),
          for(int i=0;i<rawLeaveReportModel.result!.length;i++){
            secScreenData.add(
                ScreenData(
                    rawLeaveReportModel.result![i].leaveType,
                    rawLeaveReportModel.result![i].leaveCode,
                    rawLeaveReportModel.result![i].noOfDays,
                    rawLeaveReportModel.result![i].comments,
                    rawLeaveReportModel.result![i].docDate,
                    rawLeaveReportModel.result![i].approval,
                    rawLeaveReportModel.result![i].empName,
                    rawLeaveReportModel.result![i].empId,
                    rawLeaveReportModel.result![i].docNo,
                    rawLeaveReportModel.result![i].status,
                ),
            )
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
    Allapi.getAllReports(8, "docNo", status, "type", sessionUseId, docEntry, true).then((value) => {
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
  String? leaveType;
  String? leaveCode;
  String? noOfDays;
  String? comments;
  String? docDate;
  String? approval;
  String? empId;
  String? empName;
  var docNo;
  var status;

  ScreenData(this.leaveType, this.leaveCode, this.noOfDays, this.comments,this.docDate,this.approval,this.empName,this.empId,this.docNo,this.status);
}
