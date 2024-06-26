import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repository/_allAPIList.dart';
import '../../routes/routr_management.dart';
import '../../utils/Utilites.dart';


class LoginPagesController extends GetxController{

  var userName =  TextEditingController();
  var password =  TextEditingController();
  var  login;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }


  logincheck(){
    if(userName.text==''){
      Utilities.showDialaogboxWarning(context, "Enter User Name", "Warning");
    }else if(password.text==''){
      Utilities.showDialaogboxWarning(context, "Enter Password", "Warning");
    }else{

        Allapi.postRequest1(userName.text, password.text,true).then((value) => {
          log(value.body),
          if(value.statusCode==200){
            login = jsonDecode(value.body)['status'] = 0,
            if(login==false){
              log('false'),
            }else{
              log('true'),
              setSession(
                jsonDecode(value.body)['result'][0]['empID'].toString(),
                jsonDecode(value.body)['result'][0]['firstName'].toString(),
                jsonDecode(value.body)['result'][0]['dept'].toString(),
                jsonDecode(value.body)['result'][0]['Name'].toString(),
                jsonDecode(value.body)['result'][0]['Sex'].toString(),
                jsonDecode(value.body)['result'][0]['OffTel'].toString(),
                jsonDecode(value.body)['result'][0]['Mobile'].toString(),
                jsonDecode(value.body)['result'][0]['Email'].toString(),
                jsonDecode(value.body)['result'][0]['BankAc'].toString(),
                jsonDecode(value.body)['result'][0]['HomeSt'].toString(),
                jsonDecode(value.body)['result'][0]['HomeCity'].toString(),
                jsonDecode(value.body)['result'][0]['DOB'].toString(),
                jsonDecode(value.body)['result'][0]['MaStatus'].toString(),
                jsonDecode(value.body)['result'][0]['EmpType'].toString(),
                jsonDecode(value.body)['result'][0]['ExtEmpNo'].toString(),
                jsonDecode(value.body)['result'][0]['DOJ'].toString(),
                jsonDecode(value.body)['result'][0]['Type'].toString(),
              )

            }
          }
        });

    }

  }


  setSession(
      userID,firstName,
      deptCode,deptName,sex,
      offtell,mobile,
      email,bankac,homest,homecity,bob,marstatus,
      emptype,exempno, DOJ,Type) async {

    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setString("UserID", userID.toString());
    prefs.setString("FirstName", firstName.toString());
    prefs.setString("DeptCode", deptCode.toString());
    prefs.setString("DeptName", deptName.toString());
    prefs.setString("Sex",sex.toString());
    prefs.setString("OffTel",offtell.toString());
    prefs.setString("Mobile",mobile.toString());
    prefs.setString("Email",email.toString());
    prefs.setString("BankAc",bankac.toString());
    prefs.setString("HomeSt",homest.toString());
    prefs.setString("HomeCity",homecity.toString());
    prefs.setString("DOB",bob.toString());
    prefs.setString("MaStatus",marstatus.toString());
    prefs.setString("EmpType",emptype.toString());
    prefs.setString("ExtEmpNo",exempno.toString());
    prefs.setString("DOJ",DOJ.toString());
    prefs.setString("Type",Type.toString());

    prefs.setString("Status", "Login");
    RouteManageMent.goToMenuDashContr();
  }
}
