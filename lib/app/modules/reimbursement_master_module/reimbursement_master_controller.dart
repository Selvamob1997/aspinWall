// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:developer';

import 'package:aspinwal/app/data/repository/_allAPIList.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/Model/GetReimburesmentModel.dart';
import 'package:path/path.dart';

import '../../utils/Utilites.dart';



class ReimbursementMasterController extends GetxController{

  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

  var sessionUseId  = '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';
  var sessionEmpId = '';

  late GetReimburesmentModel rawGetReimburesmentModel;

  var foodAmt = TextEditingController(text: '0');

  var accAmt = TextEditingController(text: '0');



  var traveltype = TextEditingController();
  var travelfromLocation =TextEditingController();
  var traveltoLocation = TextEditingController();
  var travelTotalAmt= TextEditingController(text: '0');



  var fueltype = TextEditingController();
  var fuelTotalDistance =TextEditingController(text: '0');
  var fuelTotalAmt = TextEditingController(text: '0');
  var fuelremarks= TextEditingController(text: '');



  List<String> secTrnsMode=[];
  List<String> secVichleTye=[];

  var ImagePath = '';
  var AccImagePath = '';
  var TravelImagePath = '';
  var StartinKMImagePath = '';
  var EndingKMImagePath = '';

  late FilePickerResult    result;
  final picker = ImagePicker();


  @override
  void onInit() {
    // TODO: implement onInit
    getStringValuesSF();
    update();
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
    log(sessionName);
    update();
    getScreenType();
  }
  
  getScreenType(){
    Allapi.getAllMaser(4, "docNo", "status", "type", "leadno", true).then((value) => {
      if(value.statusCode==200){
        log(value.body),
        rawGetReimburesmentModel = GetReimburesmentModel.fromJson(jsonDecode(value.body)),
        for(int k=0;k<rawGetReimburesmentModel.result!.length;k++){
          if(rawGetReimburesmentModel.result![k].type=="TM"){
            secTrnsMode.add(rawGetReimburesmentModel.result![k].name.toString()),
          }else if(rawGetReimburesmentModel.result![k].type=="VT"){
            secVichleTye.add(rawGetReimburesmentModel.result![k].name.toString()),
          }
        },
        Utilities.closeLoader(),
        update(),
      }
    });
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);


    if (pickedFile != null) {
      ImagePath='';
      ImagePath=pickedFile.path;
      //file = File(pickedFile.path);
      log(ImagePath);
      update();
    } else {
      log('No image selected.');
    }

  }

  Future getgalary() async {
    result = (await FilePicker.platform.pickFiles(allowMultiple: true, type: FileType.custom, allowedExtensions: ['jpg', 'pdf', 'doc']))!;
    ImagePath='';
    for (int u = 0; u < result.files.length; u++) {
      ImagePath=result.files[u].path!;
      update();
    }
    update();
  }

  Future getAccImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);


    if (pickedFile != null) {
      AccImagePath='';
      AccImagePath=pickedFile.path;
      //file = File(pickedFile.path);
      log(AccImagePath);
      update();
    } else {
      log('No image selected.');
    }

  }

  Future getAccgalary() async {
    result = (await FilePicker.platform.pickFiles(allowMultiple: true, type: FileType.custom, allowedExtensions: ['jpg', 'pdf', 'doc']))!;
    AccImagePath='';
    for (int u = 0; u < result.files.length; u++) {
      AccImagePath=result.files[u].path!;
      update();
    }
    update();
  }

  Future getTravelImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);


    if (pickedFile != null) {
      TravelImagePath='';
      TravelImagePath=pickedFile.path;
      //file = File(pickedFile.path);
      log(TravelImagePath);
      update();
    } else {
      log('No image selected.');
    }

  }

  Future getTravelgalary() async {
    result = (await FilePicker.platform.pickFiles(allowMultiple: true, type: FileType.custom, allowedExtensions: ['jpg', 'pdf', 'doc']))!;
    TravelImagePath='';
    for (int u = 0; u < result.files.length; u++) {
      TravelImagePath=result.files[u].path!;
      update();
    }
    update();
  }

  Future getStaKMImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);


    if (pickedFile != null) {
      StartinKMImagePath='';
      StartinKMImagePath=pickedFile.path;
      //file = File(pickedFile.path);
      log(StartinKMImagePath);
      update();
    } else {
      log('No image selected.');
    }

  }

  Future getStaKMgalary() async {
    result = (await FilePicker.platform.pickFiles(allowMultiple: true, type: FileType.custom, allowedExtensions: ['jpg', 'pdf', 'doc']))!;
    StartinKMImagePath='';
    for (int u = 0; u < result.files.length; u++) {
      StartinKMImagePath=result.files[u].path!;
      update();
    }
    update();
  }

  Future getEndKMImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);


    if (pickedFile != null) {
      EndingKMImagePath='';
      EndingKMImagePath=pickedFile.path;
      //file = File(pickedFile.path);
      log(EndingKMImagePath);
      update();
    } else {
      log('No image selected.');
    }

  }

  Future getEndKMgalary() async {
    result = (await FilePicker.platform.pickFiles(allowMultiple: true, type: FileType.custom, allowedExtensions: ['jpg', 'pdf', 'doc']))!;
    EndingKMImagePath='';
    for (int u = 0; u < result.files.length; u++) {
      EndingKMImagePath=result.files[u].path!;
      update();
    }
    update();
  }

  postSave(int formId){

    Allapi.inserReimbursment(formId, "docNo",
        double.parse(foodAmt.text.toString()), 
        ImagePath.toString(),double.parse(accAmt.text.toString()) ,
        AccImagePath.toString(), traveltype.text, travelfromLocation.text, traveltoLocation.text,
        double.parse(travelTotalAmt.text.toString()),
        TravelImagePath.toString(),
        fueltype.text, StartinKMImagePath.toString(),
        EndingKMImagePath.toString(), fuelTotalDistance.text,double.parse(fuelTotalAmt.text.toString()),
        fuelremarks.text, "vechileAtta",
        sessionUseId, false).then((value) => {
          if(value.statusCode==200){
            log(value.body),
            update(),
            Utilities.closeLoader(),
            Utilities.showDialaogboxSavedMessage(context, jsonDecode(value.body)['result'][0]['StatusMesg'].toString(), 'Saved..')

          }
    });

  }


}
