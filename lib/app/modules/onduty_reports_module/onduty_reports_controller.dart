import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/Model/OndutyReportModel.dart';
import '../../data/repository/_allAPIList.dart';
import '../../utils/Utilites.dart';


class OndutyReportsController extends GetxController{

  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

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
    getScreenData();
    update();

  }


  getScreenData(){
    Allapi.getAllReports(6, "0", "0", "0", sessionUseId.toString(), "0", true).then((value) => {
      if(value.statusCode==200){
        log(value.body),
        rawOndutyReportModel = OndutyReportModel.fromJson(jsonDecode(value.body)),
        for(int k=0;k<rawOndutyReportModel.result!.length;k++){

          secScreenData.add(
              ScreenData(
                  rawOndutyReportModel.result![k].ondutyType,
                  rawOndutyReportModel.result![k].fromDate,
                  rawOndutyReportModel.result![k].toDate,
                  rawOndutyReportModel.result![k].fromLoc,
                  rawOndutyReportModel.result![k].toLocation,
                  rawOndutyReportModel.result![k].fromTime,
                  rawOndutyReportModel.result![k].toTime,
                  rawOndutyReportModel.result![k].purpose,
                  rawOndutyReportModel.result![k].status
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
  String? ondutyType;
  String? fromDate;
  String? toDate;
  String? fromLoc;
  String? toLocation;
  String? fromTime;
  String? toTime;
  String? purpose;
  String? status;

  ScreenData(
      this.ondutyType,
        this.fromDate,
        this.toDate,
        this.fromLoc,
        this.toLocation,
        this.fromTime,
        this.toTime,
        this.purpose,this.status);

}










