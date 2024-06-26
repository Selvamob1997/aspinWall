import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../data/Model/DashSalesData.dart';
import '../../data/repository/_allAPIList.dart';
import '../../utils/Utilites.dart';


class DashBoardReportsController extends GetxController{

  late DashSalesData rawDashSalesData;

  var cardCode=''.obs;
  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';
  var reportType;
  var itemType;
  var year;
  var mn;
  var saleslayout = false;
  List<ScreenData> secScreenData=[];


  @override
  void onInit() {
    // TODO: implement onInit
    print(Get.arguments['reportType']);
    print(Get.arguments['empId']);
    print(Get.arguments['cardCode']);
    print(Get.arguments['itemType']);
    print(Get.arguments['year']);
    print(Get.arguments['mn']);
    getStringValuesSF();
    super.onInit();
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sessionUseId  =   prefs.getString('UserID').toString();
    sessionName = prefs.getString('FirstName').toString();
    sessionDeptCode = prefs.getString('DeptCode').toString();
    sessionDeptName = prefs.getString('DeptName').toString();
    reportType= Get.arguments['reportType'];
    itemType= Get.arguments['itemType'];
    year= Get.arguments['year'];
    mn= Get.arguments['mn'];
    cardCode = Get.arguments['cardCode'].toString().obs;
    saleslayout =
    getSalesData();
    update();
  }


  getSalesData(){
    secScreenData.clear();
    if(int.parse(reportType.toString())==1){
      saleslayout = true;
    } else {
      saleslayout = false;
    }
    var cardCodemain =cardCode.toString().obs;

    update();
    Allapi.getDashBoardData(
        int.parse(reportType.toString()),
        int.parse(sessionUseId.toString()), cardCodemain, itemType, int.parse(year.toString()), mn, true).then((value) => {
      if(value.statusCode==200){
        if(jsonDecode(value.body)['status']==0){

          Utilities.closeLoader(),
          update(),
        }else {
          rawDashSalesData = DashSalesData.fromJson(jsonDecode(value.body)),
          for(int k=0;k<rawDashSalesData.result!.length;k++){
            secScreenData.add(
                ScreenData(
                    rawDashSalesData.result![k].cardCode,
                    rawDashSalesData.result![k].cardName,
                    rawDashSalesData.result![k].totalPending,
                    rawDashSalesData.result![k].overDue,
                    rawDashSalesData.result![k].overDueAbove60Days,
                    rawDashSalesData.result![k].Target,
                    rawDashSalesData.result![k].Achived,
                    rawDashSalesData.result![k].ShortFall,
                    rawDashSalesData.result![k].Completed,
                    rawDashSalesData.result![k].Pending,
                    rawDashSalesData.result![k].Total)),

          },
          Utilities.closeLoader(),

          update(),
        },
        log(value.body),

      }
    });
  }




}


class ScreenData {
  String? cardCode;
  String? cardName;
  String? totalPending;
  String? overDue;
  String? overDueAbove60Days;
  var Target;
  var Achived;
  var ShortFall;
  var Completed;
  var Pending;
  var Total;

  ScreenData(
      this.cardCode,
      this.cardName,
      this.totalPending,
      this.overDue,
      this.overDueAbove60Days,this.Target,this.Achived,this.ShortFall,this.Completed,this.Pending,this.Total);
}











