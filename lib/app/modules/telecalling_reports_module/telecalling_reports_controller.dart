import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/Model/ClientvistiModel.dart';
import '../../data/repository/_allAPIList.dart';
import '../../utils/Utilites.dart';


class TelecallingReportsController extends GetxController{

  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';

  late ClientvistiModel rawClientvistiModel;
  List<ScreenData> secScreenData=[];


  @override
  void onInit() {
    // TODO: implement onInit
    getStringValuesSF();
    super.onInit();
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sessionUseId  =   prefs.getString('UserID').toString();
    sessionName = prefs.getString('FirstName').toString();
    sessionDeptCode = prefs.getString('DeptCode').toString();
    sessionDeptName = prefs.getString('DeptName').toString();

    getCheckingVist();
  }

  getCheckingVist(){
    Allapi.telecallBooking(1, sessionUseId, "cardcode".toString(), "remarks", "D", "",
        '', "desigenation.text","contactPercon.text","contactnumber.text","emai","ordervalue","quavalue","servicePlace",true).then((value) => {
      if(value.statusCode==200){
        log(value.body),
        update(),
        if(jsonDecode(value.body)['status'] ==0){
          Utilities.closeLoader(),
          log(value.body),
          update(),

        }else{
          rawClientvistiModel = ClientvistiModel.fromJson(jsonDecode(value.body)),
          for(int j=0;j<rawClientvistiModel.result!.length;j++){
            secScreenData.add(ScreenData(
                rawClientvistiModel.result![j].cardName,
                rawClientvistiModel.result![j].firstName,
                rawClientvistiModel.result![j].empId,
                rawClientvistiModel.result![j].inTime,
                rawClientvistiModel.result![j].outTime,
                rawClientvistiModel.result![j].fromAdress,
                rawClientvistiModel.result![j].tOAddress,
                rawClientvistiModel.result![j].status,
                rawClientvistiModel.result![j].Remarks,
            ),
            ),
          },
          Utilities.closeLoader(),
          log(value.body),
          update(),
        },



      }
    });
  }
}

class ScreenData {
  String? cardName;
  String? firstName;
  String? empId;
  String? inTime;
  String? outTime;
  String? fromAdress;
  String? tOAddress;
  String? status;
  String? Remarks;

  ScreenData(
      this.cardName,
      this.firstName,
      this.empId,
      this.inTime,
      this.outTime,
      this.fromAdress,
      this.tOAddress,
      this.status,this.Remarks);

}
