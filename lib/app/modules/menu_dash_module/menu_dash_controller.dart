import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/routr_management.dart';


class MenuDashController extends GetxController{



  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';
  var sessionType = '';
  TabController? tabController;
  int currentindex = 0;

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
    sessionType = prefs.getString('Type').toString();
    log(sessionType);
    update();

  }

  getdashboardNavigation(int i) {

    if(i==1){
      RouteManageMent.goToAttendance();
      update();
    }else if(i==2){
      RouteManageMent.goToSiteVisit();
      update();
    }else if (i==3){
      RouteManageMent.goToLeadPage("0","");
      update();
    }else if (i==4){
      RouteManageMent.goToProductionHeader();
      update();
    }else if(i==5){
      RouteManageMent.goToReportDash();
      update();
    }else if(i==6){
      RouteManageMent.goToReportsPage();
      update();
    }
    else if(i==7){
      RouteManageMent.goToLeaveMaster();
      update();
    }
    else if(i==8){
      RouteManageMent.goToPermisionMaster();
      update();
    }
    else if(i==9){
      RouteManageMent.goToOndutyMaters();
      update();
    }
    else if(i==10){
      RouteManageMent.goToReimbursMaters();
      update();
    }else if(i==11){
      RouteManageMent.goToMenuDashContr();
      update();
    }else if(i==12){
      RouteManageMent.goToHolyDay();
      update();
    }else if(i==13){
      RouteManageMent.goToSalesEntry();
      update();
    }else if(i==14){
      RouteManageMent.goToSiteViteReports();
      update();
    }else if(i==15){ // Attendace Reports
      RouteManageMent.goToAttendanceReports();
    }else if(i==16){ // Client Reports
      RouteManageMent.goToClientReports();
    }else if(i==17){ // Leave Reports
      RouteManageMent.goToLeaveReports();
    }else if(i==18){ // Permision Reports
      RouteManageMent.goToPermisionReports();
    }else if(i==19){ // Onduty Reports
      RouteManageMent.goToOndutyReports();
    }
    else if(i==20){
      RouteManageMent.goToLeaveApproval();
    }
    else if(i==21){
      RouteManageMent.goToPermisionApproval();
    }else if(i==22){
      RouteManageMent.goToOndutyApproval();
    }
    else if(i==23){
      RouteManageMent.goToTelecalling("0");
    }
    else if(i==24){
      RouteManageMent.goToTelecallingReports();
    }
    else if(i==25){
      RouteManageMent.goToTelecallingReports();
    }else if(i==26){
      RouteManageMent.goToActity();
    }

  }

  void appExit() {
    RouteManageMent.goToLogin();
  }


}
