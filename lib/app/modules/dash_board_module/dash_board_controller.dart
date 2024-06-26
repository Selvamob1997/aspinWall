import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:location/location.dart' as loc;

import '../../data/Model/CardCodeMaster.dart';
import '../../data/Model/DashBoardDatafilter.dart';
import '../../data/Model/DashSalesData.dart';
import '../../data/repository/_allAPIList.dart';
import '../../routes/routr_management.dart';
import '../../utils/Utilites.dart';

class DashBoardController extends GetxController{
  late TooltipBehavior tooltip;


  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';
  loc.Location location = loc.Location();
  late loc.PermissionStatus _permissionGranted;

  late DashBoardDatafilter rawDashBoardDatafilter1;
  List<String> secYear=[];
  late DashBoardDatafilter rawDashBoardDatafilter2;
  List<String> secSalesType=[];
  late DashBoardDatafilter rawDashBoardDatafilter3;
  List<MonthType> secMonthType=[];

  late DashSalesData rawDashSalesData;
  var totalPending = '0';
  var totaloverDue ='0';
  var overDueAbove60Days = '0';


  var totalTarget = '0';
  var totalAchived ='0';
  var totalShartFall = '0';

  var Quatcompleted = '0';
  var Quatpending ='0';
  var Quattotal = '0';


  var alterYear='0';
  var alterSalesType='';
  var alterMonthType='';
  var alterMonthTypeCode="All";

  var alterMonthType1='';
  var alterMonthTypeCode1="All";


  var cardCode='All'.obs;
  var cardName='All'.obs;
  var cardCode1='All'.obs;
  var cardName1='All'.obs;
  var salesitemType='All';
  late CardCodeMaster rawCardCodeMaster;
  RxList secRXCardCode=[].obs;
  var  searchvarible='';
  var checkStatus;

  //List<ScreenBarchat> secScreenBarchat=[];

  @override
  void onInit() {

    tooltip = TooltipBehavior(enable: true);
    getStringValuesSF();
    update();
    // TODO: implement onInit
    super.onInit();
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sessionUseId  =   prefs.getString('UserID').toString();
    sessionName = prefs.getString('FirstName').toString();
    sessionDeptCode = prefs.getString('DeptCode').toString();
    sessionDeptName = prefs.getString('DeptName').toString();
    permision();
    update();
  }

  permision() async {
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == loc.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }
    //getCardCodeMaster();
    update();
  }


  getCardCodeMaster(){

    update();
    Allapi.getcardcode(1,sessionUseId,true).then((value) => {

      log(value.body),

      if(value.statusCode==200){
        checkStatus = jsonDecode(value.body)['status'] = 0,
        if(checkStatus==false){
          Utilities.alertsnackBar('Error','No Data Loding...',2),
          Utilities.closeLoader(),
          update(),
        }else{
          rawCardCodeMaster = CardCodeMaster.fromJson(jsonDecode(value.body)),
          secRXCardCode.add(RXCardCode("All","All")),
          for(int i = 0 ; i < rawCardCodeMaster.result!.length;i++){
            secRXCardCode.add(
              RXCardCode(
                  rawCardCodeMaster.result![i].cardCode,
                  rawCardCodeMaster.result![i].cardName
              ),
            ),
          },
          Utilities.closeLoader(),
          log("Close...."),
          getMyFilter(),

          update(),

        }

      }
    });

  }

  getMyFilter(){
    Allapi.getDashBoardDatafilter(1, sessionUseId,true).then((value) => {
      if(value.statusCode==200){

        rawDashBoardDatafilter1 = DashBoardDatafilter.fromJson(jsonDecode(value.body)),
        alterYear = rawDashBoardDatafilter1.result![0].code.toString(),
        for(int i=0;i<rawDashBoardDatafilter1.result!.length;i++){
          secYear.add(rawDashBoardDatafilter1.result![i].code.toString())
        },

        Allapi.getDashBoardDatafilter(2, sessionUseId,false).then((value) => {
          if(value.statusCode==200){

            rawDashBoardDatafilter2 = DashBoardDatafilter.fromJson(jsonDecode(value.body)),
            alterSalesType = rawDashBoardDatafilter2.result![0].code.toString(),
            for(int i=0;i<rawDashBoardDatafilter2.result!.length;i++){
              secSalesType.add(rawDashBoardDatafilter2.result![i].code.toString())
            },
            Allapi.getDashBoardDatafilter(3, sessionUseId,false).then((value) => {

              if(value.statusCode==200){
                rawDashBoardDatafilter3 = DashBoardDatafilter.fromJson(jsonDecode(value.body)),
                alterMonthType = rawDashBoardDatafilter3.result![0].code.toString(),
                for(int i=0;i<rawDashBoardDatafilter3.result!.length;i++){
                  secMonthType.add(
                      MonthType(
                          rawDashBoardDatafilter3.result![i].code.toString(),
                          rawDashBoardDatafilter3.result![i].position.toString()),
                  )
                },
                Utilities.closeLoader(),
                getSalesData(salesitemType, int.parse(alterYear.toString()),alterMonthTypeCode.toString() ),
                getMFGData(salesitemType, int.parse(alterYear.toString()), alterMonthTypeCode.toString()),
                getQuaData(salesitemType, int.parse(alterYear.toString()), alterMonthTypeCode1.toString()),
                update(),
                },
            }),
          }
        }),
      }else {
        Utilities.closeLoader(),
        update(),
      }
    });
  }

  getSalesData(itemType,year,mn){
    double tPending=0;
    double overDue=0;
    double overDueAbove=0;
    //rawDashSalesData.result=[];
    var cardCodemain =cardCode.toString().obs;
    update();
    Allapi.getDashBoardData(1, int.parse(sessionUseId.toString()), cardCodemain, itemType, year, mn, true).then((value) => {
      if(value.statusCode==200){
        if(jsonDecode(value.body)['status']==0){
          totalPending = tPending.round().toString(),
          totaloverDue = overDue.round().toString(),
          overDueAbove60Days = overDueAbove.round().toString(),
          Utilities.closeLoader(),
          update(),
        }else {
          rawDashSalesData = DashSalesData.fromJson(jsonDecode(value.body)),
          for(int i=0;i<rawDashSalesData.result!.length;i++){
            tPending += double.parse(rawDashSalesData.result![i].totalPending.toString()),
            overDue += double.parse(rawDashSalesData.result![i].overDue.toString()),
            overDueAbove += double.parse(rawDashSalesData.result![i].overDueAbove60Days.toString()),
          },
          totalPending = tPending.round().toString(),
          totaloverDue = overDue.round().toString(),
          overDueAbove60Days = overDueAbove.round().toString(),
          Utilities.closeLoader(),
          update(),
        },
        //log(value.body),

      }
    });
  }



  getMFGData(itemType,year,mn){
    double Target = 0;
    double Achived =0;
    double ShartFall = 0;
    //rawDashSalesData.result=[];
    var cardCodemain =cardCode1.toString().obs;
    print("object"+cardCodemain.toString());
    update();
    Allapi.getDashBoardData(2, int.parse(sessionUseId.toString()), cardCodemain, itemType, year, mn, true).then((value) => {
      if(value.statusCode==200){
        //print(value.body),
        if(jsonDecode(value.body)['status']==0){
          totalTarget = Target.round().toString(),
          totalAchived = Achived.round().toString(),
          totalShartFall = ShartFall.round().toString(),
          Utilities.closeLoader(),
          update(),
        }else {
          rawDashSalesData = DashSalesData.fromJson(jsonDecode(value.body)),
          for(int i=0;i<rawDashSalesData.result!.length;i++){
            Target += double.parse(rawDashSalesData.result![i].Target.toString()),
            Achived += double.parse(rawDashSalesData.result![i].Achived.toString()),
            ShartFall += double.parse(rawDashSalesData.result![i].ShortFall.toString()),
          },

          totalTarget = Target.round().toString(),
          totalAchived = Achived.round().toString(),
          totalShartFall = ShartFall.round().toString(),
          Utilities.closeLoader(),
          update(),
        },
        log(value.body),

      }
    });
  }


  getQuaData(itemType,year,mn){

    //rawDashSalesData.result=[];
    double completed = 0;
    double pending =0;
    double total = 0;
    var cardCodemain =cardCode1.toString().obs;
    print("object"+cardCodemain.toString());
    update();
    Allapi.getDashBoardData(3, int.parse(sessionUseId.toString()), cardCodemain, itemType, year, mn, true).then((value) => {
      if(value.statusCode==200){
        //print(value.body),
        if(jsonDecode(value.body)['status']==0){
          Quatcompleted = completed.round().toString(),
          Quatpending = pending.round().toString(),
          Quattotal = total.round().toString(),
          Utilities.closeLoader(),
          update(),
        }else {
          rawDashSalesData = DashSalesData.fromJson(jsonDecode(value.body)),
          for(int i=0;i<rawDashSalesData.result!.length;i++){
            completed += double.parse(rawDashSalesData.result![i].Completed.toString()),
            pending += double.parse(rawDashSalesData.result![i].Pending.toString()),
            total += double.parse(rawDashSalesData.result![i].Total.toString()),
          },

          Quatcompleted = completed.round().toString(),
          Quatpending = pending.round().toString(),
          Quattotal = total.round().toString(),


          Utilities.closeLoader(),
          update(),
        },
        log(value.body),

      }
    });
  }


  getSideMenu(context){
    Utilities.alertsidemenu(context);
  }

  getdashboardNavigation(int i)  {

    if(i==1){
      Get.back();
      RouteManageMent.goToAttendance();
      update();
    }else if(i==2){
      Get.back();
      RouteManageMent.goToSiteVisit();
      update();
    }else if (i==3){
      Get.back();
      RouteManageMent.goToLeadPage("0","");
      update();
    }else if (i==4){
      Get.back();
      RouteManageMent.goToProductionHeader();
      update();
    }else if(i==5){
      Get.back();
      RouteManageMent.goToReportDash();
      update();
    }else if(i==6){
      Get.back();
      RouteManageMent.goToReportsPage();
      update();
    }
    else if(i==7){
      Get.back();
      RouteManageMent.goToLeaveMaster();
      update();
    }
    else if(i==8){
      Get.back();
      RouteManageMent.goToPermisionMaster();
      update();
    }
    else if(i==9){
      Get.back();
      RouteManageMent.goToOndutyMaters();
      update();
    }
    else if(i==10){
      Get.back();
      RouteManageMent.goToReimbursMaters();
      update();
    }else if(i==11){
      Get.back();
      RouteManageMent.goToMenuDashContr();
      update();
    }else if(i==12){
      Get.back();
      RouteManageMent.goToProfile();
      update();
    }else if(i==13){
      logout();
    }

  }


  getSubNavigation(int j,reportType,cardCodemanin,mn){
    if(j==1){
      RouteManageMent.goToDashBoard(
          reportType,
          int.parse(sessionUseId.toString()),
          cardCodemanin,
          salesitemType,
          int.parse(alterYear.toString()),
          mn);
    }else if(j==2) {
      RouteManageMent.goToNotifi();
    }
  }



  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('UserID', "");
    prefs.setString('FirstName', "");
    prefs.setString('DeptCode', "");
    prefs.setString('DeptName', "");
    prefs.setString("Status", "LoginOut");
    RouteManageMent.goToLogin();
    update();
  }

   valueSetstate(int i, int index,int service) {
      if(i==1){
        alterYear = secYear[index].toString();
        Get.back();
        getMFGData(salesitemType, int.parse(alterYear.toString()), alterMonthTypeCode.toString());
        getQuaData(salesitemType, int.parse(alterYear.toString()), alterMonthTypeCode1.toString());

      }else if(i==2){
        alterMonthType= secMonthType[index].code.toString();
        alterMonthTypeCode= secMonthType[index].position.toString();
        Get.back();
      }else if(i==3){
        cardCode = secRXCardCode[index].cardCode.toString().obs;
        cardName = secRXCardCode[index].cardName.toString().obs;
        Get.back();
      }else if(i==4){
        salesitemType = secSalesType[index].toString();
        Get.back();
      }else if(i==5){
        cardCode1 = secRXCardCode[index].cardCode.toString().obs;
        cardName1 = secRXCardCode[index].cardName.toString().obs;
        Get.back();
      }else if(i==6){
        alterMonthType1= secMonthType[index].code.toString();
        alterMonthTypeCode1= secMonthType[index].position.toString();
        Get.back();
      }
      print(cardCode);
      print(cardCode1);

      if(service==1){
      getSalesData(salesitemType, int.parse(alterYear.toString()), alterMonthTypeCode.toString());
      }else if(service==2){
        getMFGData(salesitemType, int.parse(alterYear.toString()), alterMonthTypeCode.toString());
      }else if(service==4){
        getQuaData(salesitemType, int.parse(alterYear.toString()), alterMonthTypeCode1.toString());
      }else{}
      update();
   }
}

class MonthType {
var code;
var position;
MonthType(this.code,this.position);
}

class TradingList {
  TradingList(this.x, this.y);

  final String x;
  final double y;
}

class MfgList {
  MfgList(this.x, this.y);

  final String x;
  final double y;
}

class ServiceList {
  ServiceList(this.x, this.y);

  final String x;
  final double y;
}
class RXCardCode {
  var  cardCode;
  String? cardName;

  RXCardCode(this.cardCode, this.cardName);


}
