import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../data/Model/MyActivityModel.dart';
import '../../data/repository/_allAPIList.dart';
import '../../routes/routr_management.dart';
import '../../utils/Utilites.dart';


class MyActityController extends GetxController{




  var sessionUseId  = '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';
  late MyActivityModel rawMyActivityModel;

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
    getmyData();
  }

   getmyData() {
    Allapi.getAllMaser(13, sessionUseId, sessionUseId, sessionUseId, sessionUseId, true).then((value) => {
      if(value.statusCode==200){
        log(value.body),
        if(jsonDecode(value.body)['status'].toString()=="0"){
          Utilities.closeLoader(),
          update(),
        }else{
        rawMyActivityModel = MyActivityModel.fromJson(jsonDecode(value.body)),
        for(int i=0;i<rawMyActivityModel.result!.length;i++){
          secScreenData.add(ScreenData(
              rawMyActivityModel.result![i].screenName,
              rawMyActivityModel.result![i].type,
              rawMyActivityModel.result![i].docNo,
              rawMyActivityModel.result![i].cardName,
              rawMyActivityModel.result![i].contactPerson,
              rawMyActivityModel.result![i].contactNo,
              rawMyActivityModel.result![i].remarks)
          ),
          Utilities.closeLoader(),
          update(),
        },
        }
      }
    });
   }

   navigationCnt(String values,DocNo) {
    if(values=="TELE"){
      RouteManageMent.goToTelecalling(DocNo);
    }else if(values=="LEAD"){
      RouteManageMent.goToLeadPage(DocNo,"");
    }else if(values=="MACHINE ENQUERY"){
      RouteManageMent.goToEnquery("0", "", "",DocNo);
    }
   }
  
  
}



class ScreenData {
  String? screenName;
  String? type;
  var docNo;
  String? cardName;
  String? contactPerson;
  String? contactNo;
  String? remarks;

  ScreenData(this.screenName,
      this.type,
      this.docNo,
      this.cardName,
      this.contactPerson,
      this.contactNo,
      this.remarks);

}