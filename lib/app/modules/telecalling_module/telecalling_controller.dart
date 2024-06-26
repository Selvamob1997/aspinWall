import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/Model/CardCodeMaster.dart';
import '../../data/Model/GetLeaddata.dart';
import '../../data/Model/LeadMasters.dart';
import '../../data/repository/_allAPIList.dart';
import '../../routes/routr_management.dart';
import '../../utils/Utilites.dart';


class TelecallingController extends GetxController{

  var sessionUseId  = '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';

  late CardCodeMaster rawCardCodeMaster;
  RxList secRXCardCode=[].obs;


  bool exitingCustome=false;
  bool newCustomer=false;
  bool officeLocation=false;

  List<String> secCustype=[];
  List<String> secCustype1=[];
  var custypeName='';
  late GetLeaddata rawGetLeaddata;
  RxList secScreendata=[].obs;


  double tolrenaces=500;
  double diff=0;

  var newCardcode =TextEditingController();
  var remarks =TextEditingController();
  var contactPercon =TextEditingController();
  var contactnumber =TextEditingController();
  var desigenation =TextEditingController();
  var email =TextEditingController();
  var orderType =TextEditingController();
  var orderValues = TextEditingController();
  var quatationvalue =TextEditingController();
  var servicePlace =TextEditingController();
  List<String>contactPersonList=[];
  late LeadMasters rawLeadMasters;

  var alterdesigenation ='';


  var cardcode='Tab on choose'.obs;
  var cardname='choose'.obs;
  var  searchvarible='';
  var getDocNo='0';

  var order = false;
  var quatation = false;
  var serviceCeck = false;


  @override
  void onInit() {
    // TODO: implement onInit
    //getintime = DateFormat("hh:mm:ss a").format(DateTime.now());
    secCustype.addAll(['Existing','New']);
    secCustype1.addAll(['General','Order','Quatation']);
    getStringValuesSF();
    super.onInit();
  }

  Future<bool> onWillPop(context) async {
    return (await showDialog(
      context: context,
      builder: (context) =>
       AlertDialog(
        title:  Text('Are you sure?'),
        content:  Text('Do you want to exit an App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          TextButton(
            onPressed: (){
               Get.back();
               Get.back();
            },
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sessionUseId  =   prefs.getString('UserID').toString();
    sessionName = prefs.getString('FirstName').toString();
    sessionDeptCode = prefs.getString('DeptCode').toString();
    sessionDeptName = prefs.getString('DeptName').toString();
    getDocNo = Get.arguments["DocNo"].toString();
    if(Get.arguments["DocNo"].toString()=="0"){

    }else{
      getDataFromTbl("0");
    }
    getCardCodeMaster();
  }


  getCardCodeMaster(){
    Allapi.getcardcode(1,sessionUseId,true).then((value) => {

      //log(value.body),

      if(value.statusCode==200){

        if(jsonDecode(value.body)['status'].toString() == "0"){
          Utilities.alertsnackBar('Error','No Data Loding...',2),
          Utilities.closeLoader(),
          getallmaster(),
          update(),
        }else{
          rawCardCodeMaster = CardCodeMaster.fromJson(jsonDecode(value.body)),
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
          getallmaster(),
          update(),
        }
      }
    });

  }

  getallmaster(){

    Allapi.getAllMaser(1, "", "", "", "", true).then((value) => {
      log(value.body),
      if(value.statusCode==200){
        rawLeadMasters = LeadMasters.fromJson(jsonDecode(value.body)),
        for(int i=0;i<rawLeadMasters.result!.length;i++){
          if(rawLeadMasters.result![i].type=='CP'){
            contactPersonList.add(rawLeadMasters.result![i].name.toString()),
          }
        },
        Utilities.closeLoader(),
      }else{
        Utilities.closeLoader(),
        update(),
      }

    });
  }

  checkType(String name) {
    custypeName =name.toString();
    exitingCustome=false;
    newCustomer=false;
    officeLocation=false;
    cardcode=''.obs;
    cardname=''.obs;

    if(custypeName=='Existing'){
      exitingCustome = true;
      getCardCodeMaster();
    }else if(custypeName=='New'){
      newCustomer = true;
    }

    update();

    //if()

  }

  cusTomerChange(int index, int i) {

    if(i==1){
      cardname.value = secRXCardCode[index].cardName.toString();
      cardcode.value = secRXCardCode[index].cardCode.toString();
    }
    else if(i==2){
      cardname.value = secScreendata[index].cardName.toString();
      cardcode.value = secScreendata[index].docNo.toString();
    }
    update();

  }


  postCheckingIn(formId,status){

    int meatervalidation=0;

    if(cardcode=='Tab on choose'){
      Utilities.showDialaogboxWarningMessage(Get.context, "Choose The Customer", 'Notification');
    }else if(meatervalidation==1){
      Utilities.showDialaogboxWarningMessage(Get.context, "Check Out below the 100 meters", 'Notification');
    }
    else{

      Allapi.telecallBooking(formId, sessionUseId, cardcode.toString(), remarks.text, "D", "",
          newCustomer?'N': officeLocation?'OF':'E', desigenation.text,contactPercon.text,contactnumber.text,
          email.text,orderValues.text,quatationvalue.text,servicePlace.text,
          true).then((value) => {
        if(value.statusCode==200){

          if(jsonDecode(value.body)['status'] ==0){
            Utilities.closeLoader(),
            update(),
            getCardCodeMaster(),
          }else{

            Utilities.closeLoader(),
            contactPercon.text='',
            contactnumber.text='',
            desigenation.text='',
            remarks.text='',
            orderType.text='',
            email.text ='',
            order = false,
            quatation = false,
            serviceCeck = false,
            servicePlace.text = '',
            custypeName ='',
            cardcode =''.obs,
            cardname = ''.obs,
            update(),


            //log(value.body),
            if(jsonDecode(value.body)['result'][0]['Count'].toString()=="1"){
              Utilities.showDialaogboxWarningMessage(Get.context, cardname + "-" + jsonDecode(value.body)['result'][0]['StatusMesg'].toString(), 'Saved..')
            }else
              {
                Utilities.showDialaogboxWarningMessage(Get.context, cardname + "-" + jsonDecode(value.body)['result'][0]['StatusMesg'].toString(), 'Saved..')
              }
          },

        }
      });
    }
  }


  getDataFromTbl(status){


      Allapi.telecallBooking(3, sessionUseId, cardcode.toString(), remarks.text, getDocNo.toString(), "",
          newCustomer?'N': officeLocation?'OF':'E', desigenation.text,contactPercon.text,contactnumber.text,
          email.text,orderValues.text,quatationvalue.text,servicePlace.text,true).then((value) => {
        if(value.statusCode==200){

          if(jsonDecode(value.body)['status'] ==0){
            Utilities.closeLoader(),
            update(),
            //getCardCodeMaster(),
          }else{
            Utilities.closeLoader(),
            update(),
            exitingCustome = false,
            newCustomer = false,

            if(jsonDecode(value.body)['result'][0]['Type'].toString()=="E"){
              exitingCustome = true,
            }else {
             newCustomer = true,
            },
            if(jsonDecode(value.body)['result'][0]['OrderValue'].toString()==""){
              order = false,
              quatation = true,
            }else if(jsonDecode(value.body)['result'][0]['QuaValue'].toString()==""){
              order = true,
              quatation = false,
            },

            cardcode = jsonDecode(value.body)['result'][0]['CardCode'].toString().obs,
            cardname=jsonDecode(value.body)['result'][0]['CardName'].toString().obs,
            remarks.text=jsonDecode(value.body)['result'][0]['Remarks'].toString(),
            desigenation.text=jsonDecode(value.body)['result'][0]['Desi'].toString(),
            contactPercon.text=jsonDecode(value.body)['result'][0]['ContactPer'].toString(),
            contactnumber.text=jsonDecode(value.body)['result'][0]['ContactNo'].toString(),
            email.text=jsonDecode(value.body)['result'][0]['Email'].toString(),
            orderValues.text=jsonDecode(value.body)['result'][0]['OrderValue'].toString(),
            quatationvalue.text=jsonDecode(value.body)['result'][0]['QuaValue'].toString(),
            servicePlace.text=jsonDecode(value.body)['result'][0]['ServicePlace'].toString(),
            log(value.body),
          },

        }
      });
    }

   navgatorCont() {
    Get.back();
    update();
    RouteManageMent.goToSiteVisit();
   }


  screenLayout(String text) {

    //datatable = false;
    order = false;
    quatation = false;
    //secCustype.addAll(['General','Order','Quatation']);
    if(text=="General"){

    }else if(text=="Order"){
      //datatbl = true;
      order = true;
    }else if(text =="Quatation"){
      //datatbl = true;
      quatation = true;

    }
    update();
  }

  serviceChe() {
    if(serviceCeck){
      serviceCeck = false;
    }else {
      serviceCeck = true;
    }
    update();

  }
  }

class RXCardCode {
  var  cardCode;
  String? cardName;

  RXCardCode(this.cardCode, this.cardName);


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
