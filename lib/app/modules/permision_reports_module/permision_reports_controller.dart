import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/Model/PermisionReportModel.dart';
import '../../data/repository/_allAPIList.dart';
import '../../utils/Utilites.dart';


class PermisionReportsController extends GetxController{

  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;


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
    getScreenData();
    update();

  }


  getScreenData(){
    Allapi.getAllReports(2, "0", "0", "0", sessionUseId.toString(), "0", true).then((value) => {
      if(value.statusCode==200){
        log(value.body),
        rawPermisionReportModel = PermisionReportModel.fromJson(jsonDecode(value.body)),
        for(int j=0;j<rawPermisionReportModel.result!.length;j++){
          secScreenData.add(ScreenData(
              rawPermisionReportModel.result![j].docNo,
              rawPermisionReportModel.result![j].fromDate,
              rawPermisionReportModel.result![j].fromTime,
              rawPermisionReportModel.result![j].toTime,
              rawPermisionReportModel.result![j].totalTime,
              rawPermisionReportModel.result![j].purposeVisit,
              rawPermisionReportModel.result![j].status
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
  int? docNo;
  String? fromDate;
  String? fromTime;
  String? toTime;
  String? totalTime;
  String? purposeVisit;
  String? status;

  ScreenData(
      this.docNo,
        this.fromDate,
        this.fromTime,
        this.toTime,
        this.totalTime,
        this.purposeVisit,this.status);
}
