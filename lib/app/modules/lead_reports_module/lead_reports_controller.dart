import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../data/Model/GetLeaddata.dart';
import '../../data/repository/_allAPIList.dart';
import '../../utils/Utilites.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class LeadReportsController extends GetxController{

  bool loading = false;
  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';
  late GetLeaddata rawGetLeaddata;

  DateTime dateTime = DateTime.now();
  TimeOfDay picked = TimeOfDay.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  List<Screendata> secScreendata=[];

  @override
  void onInit() {
    // TODO: implement onInit
    getStringValuesSF();
    super.onInit();
  }

  getStringValuesSF() async {
    log("message");
    SharedPreferences prefs =await SharedPreferences.getInstance();
    sessionUseId  =   prefs.getString('UserID').toString();
    sessionName = prefs.getString('FirstName').toString();
    sessionDeptCode = prefs.getString('DeptCode').toString();
    sessionDeptName = prefs.getString('DeptName').toString();
    getallmaster();
    update();

  }






  getallmaster(){
      Allapi.leadMasterScreen(2,
          "cardname.", "mobileno", "contactperson", "contactpersonposition",
          "email","streetname", "landmark","district", "state", "officeno",
          0, sessionUseId, "altercampanygroup", "altertypeofbusiness", "altercurrency", "pan","gstin",
          "alterGSTIN", "bankname","accountno","branch","ifsc","AddressType","ServiceBy","visiterType","orderValue","QuaValue",
          true).then((value) => {

        if(value.statusCode==200){
          Utilities.closeLoader(),
          update(),
          rawGetLeaddata = GetLeaddata.fromJson(jsonDecode(value.body)),
          for (int i = 0 ; i <rawGetLeaddata.result!.length;i++ ){
            secScreendata.add(Screendata(
                rawGetLeaddata.result![i].docNo,
                rawGetLeaddata.result![i].cardName,
                rawGetLeaddata.result![i].mobileNo,
                rawGetLeaddata.result![i].contactPerson,
                rawGetLeaddata.result![i].contactPersonPosition,
                rawGetLeaddata.result![i].email,
                rawGetLeaddata.result![i].streetName,
                rawGetLeaddata.result![i].landMark,
                rawGetLeaddata.result![i].district,
                rawGetLeaddata.result![i].state,
                rawGetLeaddata.result![i].officeNo,
                rawGetLeaddata.result![i].docDate,
                rawGetLeaddata.result![i].createBy)
            ),
          }
        }else{
          Utilities.closeLoader(),
          update(),
        }

      });
    
  }
}

class Screendata {
  int? docNo;
  String? cardName;
  String? mobileNo;
  String? contactPerson;
  String? contactPersonPosition;
  String? email;
  String? streetName;
  String? landMark;
  String? district;
  String? state;
  String? officeNo;
  String? docDate;
  String? createBy;

  Screendata(
      this.docNo,
      this.cardName,
      this.mobileNo,
      this.contactPerson,
      this.contactPersonPosition,
      this.email,
      this.streetName,
      this.landMark,
      this.district,
      this.state,
      this.officeNo,
      this.docDate,
      this.createBy);


}
