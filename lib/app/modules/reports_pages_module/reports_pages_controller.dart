import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../data/Model/SalesQuationModel.dart';
import '../../routes/routr_management.dart';


class ReportsPagesController extends GetxController{

  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';

  late SalesQuationModel rawSalesQuationModel;

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

  }


  navigationController(int index){

    if(index==1){
      RouteManageMent.goToSalesQuationReports();

    }

  }




}
