import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart' as loc;
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/repository/_allAPIList.dart';
import '../../utils/Utilites.dart';

class AttendancePageController extends GetxController{

  static AttendancePageController instance = Get.find();
  late Position position;
  loc.Location location = loc.Location();
  late bool _serviceEnabled;
  late loc.PermissionStatus _permissionGranted;

  LatLng? latlong ;

  RxString insetlat="0".obs;
  var insetlon='0'.obs;
  var insetAddress='0'.obs;
  var insetlocation='0'.obs;
  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';
  var sessionEmpId = '';
  late final CameraPosition kGoogle;
  Completer<GoogleMapController> controller = Completer();
  var checkStatus;
  var attendancestatus=''.obs;
  var getintime='';
  var getcurrendate='';
  var attendanceCloseDocNo="0".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getintime = DateFormat("hh:mm:ss a").format(DateTime.now());
    getcurrendate = DateFormat("dd-MM-yyyy").format(DateTime.now());
    log(getcurrendate+" "+getintime);
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
    sessionEmpId = prefs.getString('ExtEmpNo').toString();
    log(sessionEmpId);
    update();
    main();
  }

  main() async {
    log('Main');
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    update();
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
    insetlat=position.latitude.toString().obs;
    insetlon=position.longitude.toString().obs;
    log(position.latitude.toString());
    log(position.longitude.toString());
    update();
    _getAddressFromLatLng(position.latitude, position.longitude, position);
  }

  Future<void> _getAddressFromLatLng(lat, lang, Position position) async {
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      insetAddress =
          '${place.street}, ${place.subLocality}, ${place.locality},${place.administrativeArea}, ${place.postalCode}'.obs;
      insetlocation = place.subLocality.toString().obs;

      log(insetAddress.toString());


      checkattendance();
      update();
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  checkattendance(){
    Allapi.postattendance(false,//isloading,
      3,// formid,
      sessionName,//name,
      sessionEmpId,//empId,
      getcurrendate,//date,
      getcurrendate+" "+getintime,//day,
      insetlat.toString()+","+insetlon.toString(),//frmlatlong,
      insetAddress.toString(),//fromplace,
      '',//tolatlng,
      '',//toplace,
      '',//totaldistance,
      '',//month,
      '',//remarks,
      sessionUseId,//createby,
      '',//modifiedBy,
      '0',//approvestatus,
      insetlocation.toString(),//locationtype,
      '',//locationnanme,
      '',//description,
      getintime,//fromtime,
      '',//totime,
      'HalfDay',//finalstatus
      '' // maxDocNo
    ).then((value) => {

      if(value.statusCode==200){
        Utilities.closeLoader(),
        attendancestatus = jsonDecode(value.body)['status'].toString().obs,
        if(jsonDecode(value.body)['status'] == 0){
          log(value.body),
          update(),
        }else{
          attendancestatus = jsonDecode(value.body)['result'][0]['AttendanceStatus'].toString().obs,
          attendanceCloseDocNo = jsonDecode(value.body)['result'][0]['DOCNO'].toString().obs,
          if(attendancestatus.toString()=="O"){
            //Utilities.alertsnackBar('Warning','Kindly Stop your attendance',2),
          }else if(attendancestatus.toString()=="C"){
            //Utilities.alertsnackBar('Warning','Attendance completed',2),
          },


          log(value.body),
          update(),
        }

      }
    });

  }

  startattendance(){
    getintime = DateFormat("hh:mm:ss a").format(DateTime.now());
    update();
    Allapi.postattendance(true,//isloading,
      1,// formid,
      sessionName,//name,
      sessionEmpId,//empId,
      getcurrendate+" "+getintime,//date,
      getcurrendate+" "+getintime,//day,
      insetlat.toString()+","+insetlon.toString(),//frmlatlong,
      insetAddress.toString(),//fromplace,
      '',//tolatlng,
      '',//toplace,
      '',//totaldistance,
      '',//month,
      '',//remarks,
      sessionUseId,//createby,
      '',//modifiedBy,
      '0',//approvestatus,
      insetlocation.toString(),//locationtype,
      '',//locationnanme,
      '',//description,
      getintime,//fromtime,
      '',//totime,
      'HalfDay',//finalstatus
        '' // maxDocNo
    ).then((value) => {
      log(value.body),
      if(value.statusCode==200){
        Utilities.closeLoader(),
        checkStatus = jsonDecode(value.body)['status'] = 0,
        if(checkStatus==false){
          Utilities.alertsnackBar('Error','Somthing went wrong...',2),
          update(),
        }else{
          Utilities.alertsnackBar('Success',jsonDecode(value.body)['result'][0]['STATUSNAME'].toString(),3),
          log(jsonDecode(value.body)['result'][0]['STATUSNAME'].toString()),
          checkattendance(),
          log("Close...."),
          update(),
          //Utilities.closeLoader(),
        }
      }
    });
  }

  stopattendance(){
    getintime = DateFormat("hh:mm:ss a").format(DateTime.now());
    update();
    Allapi.postattendance(true,//isloading,
      2,// formid,
      sessionName,//name,
      sessionEmpId,//empId,
      getcurrendate,//date,
      getcurrendate+" "+getintime,//day,
      insetlat.toString()+","+insetlon.toString(),//frmlatlong,
      insetAddress.toString(),//fromplace,
      insetlat.toString()+","+insetlon.toString(),//tolatlng,
      insetAddress.toString(),//toplace,
      '',//totaldistance,
      '',//month,
      '',//remarks,
      sessionUseId,//createby,
      '',//modifiedBy,
      '0',//approvestatus,
      insetlocation.toString(),//locationtype,
      insetlocation.toString(),//locationnanme,
      '',//description,
      getintime,//fromtime,
      getintime,//totime,
      'Present',//finalstatus
       attendanceCloseDocNo.toString() // maxDocNo
    ).then((value) => {
      log(value.body),
      if(value.statusCode==200){
        Utilities.closeLoader(),
        checkStatus = jsonDecode(value.body)['status'] = 0,
        if(checkStatus==false){
          Utilities.alertsnackBar('Error','Somthing went wrong...',2),
          //Utilities.closeLoader(),
          update(),
        }else{
          // Utilities.alertsnackBar('Success',jsonDecode(value.body)['result'][0]['STATUSNAME'].toString(),3),
          log(jsonDecode(value.body)['result'][0]['STATUSNAME'].toString()),
          Get.back(),
          log("Close...."),
          //Utilities.closeLoader(),
          update(),
        }
      }
    });
  }
}
