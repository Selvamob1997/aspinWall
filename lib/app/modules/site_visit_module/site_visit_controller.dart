import 'dart:convert';
import 'dart:developer';
import  'dart:math' as Math;
import  'package:vector_math/vector_math.dart' as Vmath;
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:location/location.dart' as loc;
import 'package:path/path.dart';

import '../../data/Model/CardCodeMaster.dart';
import '../../data/Model/GetLeaddata.dart';
import '../../data/repository/_allAPIList.dart';
import '../../routes/routr_management.dart';
import '../../utils/Utilites.dart';


class SiteVisitController extends GetxController{

  var sessionUseId  = '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';
  loc.Location location = loc.Location();
  late loc.PermissionStatus _permissionGranted;
  LatLng? latlong ;
  RxString insetlat="0".obs;
  var insetlon='0'.obs;
  var insetAddress='0'.obs;
  var cardcode='Tab on choose'.obs;
  var cardname='choose'.obs;
  var getintime='';
  var  searchvarible='';
  var checkStatus;
  late CardCodeMaster rawCardCodeMaster;
  RxList secRXCardCode=[].obs;
  bool checkInsert=false;
  var updateDocNo='0';
  var fromLat='';
  var fromLong='';
  var docType ='';
  bool exitingCustome=false;
  bool newCustomer=false;
  bool showChild=false;
  bool officeLocation=false;

  List<String> secCustype=[];
  var custypeName='';


  late GetLeaddata rawGetLeaddata;
  RxList secScreendata=[].obs;

  double tolrenaces=500;
  double diff=0;

  var newCardcode =TextEditingController();


  @override
  void onInit() {
    // TODO: implement onInit
    getintime = DateFormat("hh:mm:ss a").format(DateTime.now());
    secCustype.addAll(['Existing','New','Office']);
    getStringValuesSF();
    super.onInit();
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sessionUseId  =   prefs.getString('UserID').toString();
    sessionName = prefs.getString('FirstName').toString();
    sessionDeptCode = prefs.getString('DeptCode').toString();
    sessionDeptName = prefs.getString('DeptName').toString();
    log(sessionName);
    permision();
  }

  permision() async {
    log('permision');
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == loc.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }
    update();
    Utilities.showMapLoader();
    getLocation();
  }

  getLocation() async {
    log('getLocation');
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    latlong = LatLng(position.latitude, position.longitude);
    log(position.latitude.toString());
    log(position.longitude.toString());
    insetlat=position.latitude.toString().obs;
    insetlon=position.longitude.toString().obs;
    update();
    _getAddressFromLatLng(position.latitude, position.longitude, position);
  }


  Future<void> _getAddressFromLatLng(lat, lang, Position position) async {

    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      insetAddress =
          '${place.street}, ${place.subLocality}, ${place.locality},${place.administrativeArea}, ${place.postalCode}'.obs;
      log(insetAddress.toLowerCase());
      Utilities.closeLoader();
      update();
      getCheckingVist();
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  getCardCodeMaster(){
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


  getBrachMaster(){
    Allapi.getcardcode(2,sessionUseId,true).then((value) => {

      log(value.body),

      if(value.statusCode==200){
        checkStatus = jsonDecode(value.body)['status'] = 0,
        if(checkStatus==false){
          Utilities.alertsnackBar('Error','No Data Loding...',2),
          Utilities.closeLoader(),
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


    Allapi.leadMasterScreen(2,
        "cardname.", "mobileno", "contactperson", "contactpersonposition",
        "email","streetname", "landmark","district", "state", "officeno",
        0, sessionUseId, "altercampanygroup", "altertypeofbusiness", "altercurrency", "pan","gstin",
        "alterGSTIN", "bankname","accountno","branch","ifsc","AddressType","ServiceBy","visiterType","orderValue","QuaValue",
        true).then((value) => {

      if(value.statusCode==200){
        log(value.body),
        Utilities.closeLoader(),
        update(),
        if(jsonDecode(value.body)['status'] ==0){

        }else {
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
        }
      }else{
        Utilities.closeLoader(),
        update(),
      }

    });

  }


  getCheckingVist(){
    Allapi.visitChecking(1, sessionUseId, cardcode.toString(),
        'intTime', 'outTime', insetlat.toString(), insetlon.toString(), insetAddress.toString(), insetlat.toString(),
        insetlon.toString(), insetAddress.toString(), 'O', updateDocNo, true).then((value) => {
      if(value.statusCode==200){
        log(value.body),
        update(),
        if(jsonDecode(value.body)['status'] ==0){
          checkInsert=false,
          Utilities.closeLoader(),
          update(),
          getCardCodeMaster(),
        }else{
          Utilities.closeLoader(),
          checkInsert=true,
          newCustomer = true,
          showChild = true,
          print(value.body),
          cardcode=jsonDecode(value.body)['result'][0]['CardCode'].toString().obs,
          cardname=jsonDecode(value.body)['result'][0]['CardName'].toString().obs,
          updateDocNo=jsonDecode(value.body)['result'][0]['DocNo'].toString(),
          fromLat=jsonDecode(value.body)['result'][0]['FromLat'].toString(),
          fromLong=jsonDecode(value.body)['result'][0]['FromLog'].toString(),
          docType=jsonDecode(value.body)['result'][0]['Type'].toString(),
          print(insetlat.toString()),
          print(insetlon.toString()),
          log(value.body),
          update(),
        },



      }
    });
  }

  postCheckingIn(formId,status){

    int meatervalidation=0;

    if(formId==2){

    }else {
      double earthRadius = 6371000; //meters
      double dLat = Vmath.radians(double.parse(insetlat.toString())-double.parse(fromLat.toString()));
      double dLng = Vmath.radians(double.parse(insetlon.toString())-double.parse(fromLong.toString()));
      double a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(Vmath.radians(double.parse(insetlat.toString()))) *Math. cos(Vmath.radians(double.parse(fromLat.toString()))) * Math.sin(dLng/2) * Math.sin(dLng/2);
      double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
      double dist =  (earthRadius * c);
      print(dist.toString());
      diff=(earthRadius * c);
      double dd= tolrenaces;
      print("Distances - "+dist.toString());
      print("Total - "+dd.toString());
      if (dist>dd){
        print(meatervalidation=1);
      }else{
        print(meatervalidation=0);
      }
    }

    if(cardcode=='Tab on choose'){
      Utilities.showDialaogboxWarningMessage(context, "Choose The Customer", 'Notification');
    }else if(meatervalidation==1){
      Utilities.showDialaogboxWarningMessage(context, "Check Out below the 100 meters", 'Notification');
    }
    else{
      Allapi.visitChecking(formId, sessionUseId, cardcode.toString(),
          newCustomer?'N':
          officeLocation?'OF':'E',
          'outTime',
          insetlat.toString(),
          insetlon.toString(), insetAddress.toString(), insetlat.toString(), insetlon.toString(), insetAddress.toString(), status, updateDocNo, true).then((value) => {
        if(value.statusCode==200){

          if(jsonDecode(value.body)['status'] ==0){
            Utilities.closeLoader(),
            update(),
            getCardCodeMaster(),
          }else{

            Utilities.closeLoader(),
            update(),
            log(value.body),
            if(jsonDecode(value.body)['result'][0]['Count'].toString()=="1"){
              if(newCustomer){
                Get.back(),
                //RouteManageMent.goToLeadPage("0",cardname),
                update(),
              }else if(officeLocation){
                Get.back(),
                //RouteManageMent.goToTelecalling("0"),
                update(),
                //Utilities.showDialaogboxSavedMessage(context, cardname + "-" + jsonDecode(value.body)['result'][0]['StatusMesg'].toString(), 'Saved..')
              } else {
                Get.back(),
                //RouteManageMent.goToEnquery("1",cardcode.toString(),cardname,"0"),
                update(),
              },
            }else {
                Utilities.showDialaogboxSavedMessage(context, cardname + "-" + jsonDecode(value.body)['result'][0]['StatusMesg'].toString(), 'Saved..')
              }
          },

        }
      });
    }
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

     }else if(custypeName =='Office'){
       //exitingCustome = true;
       officeLocation = true;
       getBrachMaster();
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

   childNavigator() {
     Get.back();
     if(docType=="OF"){
       RouteManageMent.goToTelecalling("0");
     } else if(docType=="N"){
       RouteManageMent.goToLeadPage("0",cardname);
     } else{
     RouteManageMent.goToEnquery("1",cardcode.toString(),cardname,"0");
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
