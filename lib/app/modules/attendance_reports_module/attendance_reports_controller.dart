import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/Model/AttendanceReportModel.dart';
import '../../data/repository/_allAPIList.dart';
import '../../utils/Utilites.dart';


class AttendanceReportsController extends GetxController{

  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';

  late AttendanceReportModel rawAttendanceReportModel;
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
    Allapi.getAllReports(3, "0", "0", "0", sessionUseId.toString(), "0", true).then((value) => {
      if(value.statusCode==200){
        log(value.body),
        rawAttendanceReportModel = AttendanceReportModel.fromJson(jsonDecode(value.body)),
        for(int i=0;i<rawAttendanceReportModel.result!.length;i++){
          secScreenData.add(ScreenData(
              rawAttendanceReportModel.result![i].empId,
              rawAttendanceReportModel.result![i].fromPlace,
              rawAttendanceReportModel.result![i].toPlace,
              rawAttendanceReportModel.result![i].locType,
              rawAttendanceReportModel.result![i].fromTime,
              rawAttendanceReportModel.result![i].toTime,
              rawAttendanceReportModel.result![i].finalStatus,
              rawAttendanceReportModel.result![i].docDate),
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
  String? empId;
  String? fromPlace;
  String? toPlace;
  String? locType;
  String? fromTime;
  String? toTime;
  String? finalStatus;
  String? docDate;

  ScreenData(
      this.empId,
        this.fromPlace,
        this.toPlace,
        this.locType,
        this.fromTime,
        this.toTime,
        this.finalStatus,
        this.docDate);

}
