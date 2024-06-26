import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/Model/LeaveReportModel.dart';
import '../../data/repository/_allAPIList.dart';
import '../../utils/Utilites.dart';


class LeavemasterReportsController extends GetxController{




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
    getScreenData();
    update();

  }


  getScreenData(){
    Allapi.getAllReports(5, "0", "0", "0", sessionUseId.toString(), "0", true).then((value) => {
      if(value.statusCode==200){
        log(value.body),
        rawLeaveReportModel = LeaveReportModel.fromJson(jsonDecode(value.body)),
        for(int i =0;i<rawLeaveReportModel.result!.length;i++){
          secScreenData.add(ScreenData(
            rawLeaveReportModel.result![i].leaveType,
            rawLeaveReportModel.result![i].leaveCode,
            rawLeaveReportModel.result![i].noOfDays,
            rawLeaveReportModel.result![i].comments,
            rawLeaveReportModel.result![i].docDate,
            rawLeaveReportModel.result![i].status
          ),
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
  String? leaveType;
  String? leaveCode;
  String? noOfDays;
  String? comments;
  String? docDate;
  var status;

  ScreenData(this.leaveType, this.leaveCode, this.noOfDays, this.comments,this.docDate,this.status);
  
}
