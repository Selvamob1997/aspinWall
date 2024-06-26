import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/Model/ClientVisitModel.dart';
import '../../data/repository/_allAPIList.dart';
import '../../utils/Utilites.dart';


class ClientvisitReportsController extends GetxController{

  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';

  late ClientVisitModel rawClientVisitModel;
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
    Allapi.getAllReports(4, "0", "0", "0", sessionUseId.toString(), "0", true).then((value) => {
      if(value.statusCode==200){
        log(value.body),
        rawClientVisitModel = ClientVisitModel.fromJson(jsonDecode(value.body)),
        for(int i=0;i<rawClientVisitModel.result!.length;i++){
          secScreenData.add(
              ScreenData(
                  rawClientVisitModel.result![i].inTime,
                  rawClientVisitModel.result![i].outTime,
                  rawClientVisitModel.result![i].fromAdd,
                  rawClientVisitModel.result![i].toAdd,
                  rawClientVisitModel.result![i].docDate,
                  rawClientVisitModel.result![i].CardName,
                  rawClientVisitModel.result![i].Type,
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
  String? inTime;
  String? outTime;
  String? fromAdd;
  String? toAdd;
  String? docDate;
  String? CardName;
  String? Type;

  ScreenData(
      this.inTime,
      this.outTime,
      this.fromAdd,
      this.toAdd,
      this.docDate,this.CardName,this.Type);

}
