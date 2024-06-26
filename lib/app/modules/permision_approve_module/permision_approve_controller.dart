import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import '../../data/Model/PermisionReportModel.dart';
import '../../data/repository/_allAPIList.dart';
import '../../utils/Utilites.dart';

class PermisionApproveController extends GetxController{

  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';

  late PermisionReportModel rawPermisionReportModel;
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
    Allapi.getAllReports(9, "0", status, "type", sessionUseId, "docEntry", true).then((value) => {
      if(value.statusCode==200){
        print(jsonDecode(value.body)['status']),
        log(value.body),
        if(jsonDecode(value.body)['status'].toString()=="1"){

          rawPermisionReportModel = PermisionReportModel.fromJson(jsonDecode(value.body)),
          for(int i=0;i<rawPermisionReportModel.result!.length;i++){
            secScreenData.add(
              ScreenData(
                  rawPermisionReportModel.result![i].docNo,
                  rawPermisionReportModel.result![i].fromDate,
                  rawPermisionReportModel.result![i].fromTime,
                  rawPermisionReportModel.result![i].toTime,
                  rawPermisionReportModel.result![i].totalTime,
                  rawPermisionReportModel.result![i].purposeVisit,
                  rawPermisionReportModel.result![i].status,
                  rawPermisionReportModel.result![i].empId,
                  rawPermisionReportModel.result![i].empName,

              )
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
    Allapi.getAllReports(10, "docNo", status, "type", sessionUseId, docEntry, true).then((value) => {
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
  var docNo;
  String? fromDate;
  String? fromTime;
  String? toTime;
  String? totalTime;
  String? purposeVisit;
  String? status;
  String? empId;
  String? empName;

  ScreenData(this.docNo,
      this.fromDate,
      this.fromTime,
      this.toTime,
      this.totalTime,
      this.purposeVisit,this.status,this.empId,this.empName);
}