import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../data/Model/CardCodeMaster.dart';
import 'package:path/path.dart';

import '../../data/Model/EmpDataModel.dart';
import '../../data/Model/ItemDetaliesModel.dart';
import '../../data/repository/_allAPIList.dart';
import '../../utils/Utilites.dart';


class SalesEnqueryController extends GetxController{

  final pagecontroller = PageController(initialPage: 0,);
  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';

  List<String> secopportunityType=[];
  List<String> secType=[];

  late CardCodeMaster rawCardCodeMaster;
  RxList secRXCardCode=[].obs;

  late EmpDataModel rawEmpDataModel;
  List<EmpData> secEmpData=[];
  List<String> secmanufacturing=[];
  List<String> secpoStage=[];

  var opportunityType = TextEditingController();
  var salesType = TextEditingController();
  var opportunityName = TextEditingController();
  var opportunityNo = TextEditingController();
  var cradCode = TextEditingController();
  var cardName = TextEditingController();
  var contactPerson = TextEditingController();
  var saleStatus = TextEditingController(text: 'Open');
  var empCode = TextEditingController();
  var empName = TextEditingController();
  var startDate = TextEditingController();
  var manufacturing = TextEditingController();
  var postartDate = TextEditingController();
  var poClosingDate = TextEditingController();

  var salescode = TextEditingController();
  var salespesBy = TextEditingController();
  var poStage = TextEditingController();
  var poSclosing = TextEditingController();
  var poammount = TextEditingController();
  var powigAmt = TextEditingController();

  late ItemDetaliesModel rawItemDetaliesModel;
  List<ResultList> secResultList=[];
  List<ScreenData> secScreendata=[];




  @override
  void onInit() {
    // TODO: implement onInit
    getStringValuesSF();
    secopportunityType.addAll(["Sales","Purchase"]);
    secType.addAll(["Trade","Service","Manufacturing"]);
    secmanufacturing.addAll(["Special Production ","Quick Production"]);
    secpoStage.addAll(["SALES ENQUIRY","SALES QUOTATION","SALES ORDER"," AR DOWN PAYMENT","A/R INVOICE","INCOMMING PAYMENT"]);
    startDate.text = DateFormat('dd-MM-yyyy').format(DateTime.now());
    update();
    super.onInit();
  }
  Future<void> getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sessionUseId  =   prefs.getString('UserID').toString();
    sessionName = prefs.getString('FirstName').toString();
    sessionDeptCode = prefs.getString('DeptCode').toString();
    sessionDeptName = prefs.getString('DeptName').toString();
    getCardCodeMaster();
    update();
  }

  void showOpptype(){
    update();
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(children: <Widget>[Container(
          padding: const EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: const EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: 250,
                  height: 50,
                  child: TextField(
                    enabled: true, style: const TextStyle(fontSize: 12),
                    decoration: InputDecoration(contentPadding: const EdgeInsets.only(top: 3, bottom: 2, left: 10, right: 10),
                      hintText: 'Search Data..',
                      labelText: 'Search Data..',
                      labelStyle: TextStyle(color: Colors.grey.shade600),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ), SizedBox(
                  width: 350,
                  height: 450,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: secopportunityType.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(secopportunityType[index].toString()),
                          onTap: () {
                            opportunityType.text = secopportunityType[index].toString();
                            Get.back();
                            update();
                          },
                        ),
                      );
                    },
                  ),
                ), Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                      update();
                    },
                    child: const Text("Cancel", style: TextStyle(fontSize: 18, color: Colors.black),),
                  ),),],),),),],),),);
  }

  void showSalestype(){
    update();
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(children: <Widget>[Container(
          padding: const EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: const EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: 250,
                  height: 50,
                  child: TextField(
                    enabled: true, style: const TextStyle(fontSize: 12),
                    decoration: InputDecoration(contentPadding: const EdgeInsets.only(top: 3, bottom: 2, left: 10, right: 10),
                      hintText: 'Search Data..',
                      labelText: 'Search Data..',
                      labelStyle: TextStyle(color: Colors.grey.shade600),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ), SizedBox(
                  width: 350,
                  height: 450,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: secType.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(secType[index].toString()),
                          onTap: () {
                            salesType.text = secType[index].toString();
                            Get.back();
                            update();
                          },
                        ),
                      );
                    },
                  ),
                ), Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                      update();
                    },
                    child: const Text("Cancel", style: TextStyle(fontSize: 18, color: Colors.black),),
                  ),),],),),),],),),);
  }

  void showManiype(){
    update();
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(children: <Widget>[Container(
          padding: const EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: const EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: 250,
                  height: 50,
                  child: TextField(
                    enabled: true, style: const TextStyle(fontSize: 12),
                    decoration: InputDecoration(contentPadding: const EdgeInsets.only(top: 3, bottom: 2, left: 10, right: 10),
                      hintText: 'Search Data..',
                      labelText: 'Search Data..',
                      labelStyle: TextStyle(color: Colors.grey.shade600),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ), SizedBox(
                  width: 350,
                  height: 450,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: secmanufacturing.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(secmanufacturing[index].toString()),
                          onTap: () {
                            manufacturing.text = secmanufacturing[index].toString();
                            Get.back();
                            update();
                          },
                        ),
                      );
                    },
                  ),
                ), Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                      update();
                    },
                    child: const Text("Cancel", style: TextStyle(fontSize: 18, color: Colors.black),),
                  ),),],),),),],),),);
  }

  void showStage(){
    update();
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(children: <Widget>[Container(
          padding: const EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: const EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: 250,
                  height: 50,
                  child: TextField(
                    enabled: true, style: const TextStyle(fontSize: 12),
                    decoration: InputDecoration(contentPadding: const EdgeInsets.only(top: 3, bottom: 2, left: 10, right: 10),
                      hintText: 'Search Data..',
                      labelText: 'Search Data..',
                      labelStyle: TextStyle(color: Colors.grey.shade600),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ), SizedBox(
                  width: 350,
                  height: 450,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: secpoStage.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(secpoStage[index].toString()),
                          onTap: () {
                            poStage.text = secpoStage[index].toString();
                            Get.back();
                            update();
                          },
                        ),
                      );
                    },
                  ),
                ), Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                      update();
                    },
                    child: const Text("Cancel", style: TextStyle(fontSize: 18, color: Colors.black),),
                  ),),],),),),],),),);
  }

  selectToDate(fromid,BuildContext context)async {
    var picked = await  showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));
    if (picked != null) {
      if (fromid == 1) {
        postartDate.text = DateFormat('dd-MM-yyyy').format(picked);

      } else if (fromid == 2) {

        poClosingDate.text = DateFormat('dd-MM-yyyy').format(picked);
      }
    }
  }


  void showCustomer(){
    update();
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(children: <Widget>[Container(
          padding: const EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: const EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: 250,
                  height: 50,
                  child: TextField(
                    enabled: true, style: const TextStyle(fontSize: 12),
                    decoration: InputDecoration(contentPadding: const EdgeInsets.only(top: 3, bottom: 2, left: 10, right: 10),
                      hintText: 'Search Data..',
                      labelText: 'Search Data..',
                      labelStyle: TextStyle(color: Colors.grey.shade600),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ), SizedBox(
                  width: 350,
                  height: 450,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: secRXCardCode.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(secRXCardCode[index].cardName.toString()),
                          onTap: () {
                            cradCode.text = secRXCardCode[index].cardCode.toString();
                            cardName.text = secRXCardCode[index].cardName.toString();
                            Get.back();
                            update();
                          },
                        ),
                      );
                    },
                  ),
                ), Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                      update();
                    },
                    child: const Text("Cancel", style: TextStyle(fontSize: 18, color: Colors.black),),
                  ),),],),),),],),),);
  }

  void showEmpData(int fromId){
    update();
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(children: <Widget>[Container(
          padding: const EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: const EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: 250,
                  height: 50,
                  child: TextField(
                    enabled: true, style: const TextStyle(fontSize: 12),
                    decoration: InputDecoration(contentPadding: const EdgeInsets.only(top: 3, bottom: 2, left: 10, right: 10),
                      hintText: 'Search Data..',
                      labelText: 'Search Data..',
                      labelStyle: TextStyle(color: Colors.grey.shade600),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ), SizedBox(
                  width: 350,
                  height: 450,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: secEmpData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(secEmpData[index].empName.toString()),
                          onTap: () {
                            if(fromId==1){
                            empCode.text = secEmpData[index].empCode.toString();
                            empName.text = secEmpData[index].empName.toString();
                            }else if(fromId==2){
                              salescode.text = secEmpData[index].empCode.toString();
                              salespesBy.text = secEmpData[index].empName.toString();
                            }
                            Get.back();
                            update();
                          },
                        ),
                      );
                    },
                  ),
                ), Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                      update();
                    },
                    child: const Text("Cancel", style: TextStyle(fontSize: 18, color: Colors.black),),
                  ),),],),),),],),),);
  }


  void showItemName(int position){
    update();
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(children: <Widget>[Container(
          padding: const EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: const EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: 250,
                  height: 50,
                  child: TextField(
                    enabled: true, style: const TextStyle(fontSize: 12),
                    decoration: InputDecoration(contentPadding: const EdgeInsets.only(top: 3, bottom: 2, left: 10, right: 10),
                      hintText: 'Search Data..',
                      labelText: 'Search Data..',
                      labelStyle: TextStyle(color: Colors.grey.shade600),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ), SizedBox(
                  width: 350,
                  height: 450,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: secResultList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(secResultList[index].itemName.toString()),
                          onTap: () {

                              secScreendata[position].itamname = secResultList[index].itemName.toString();
                              secScreendata[position].itemcode = secResultList[index].itemCode.toString();

                            Get.back();
                            update();
                          },
                        ),
                      );
                    },
                  ),
                ), Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                      update();
                    },
                    child: const Text("Cancel", style: TextStyle(fontSize: 18, color: Colors.black),),
                  ),),],),),),],),),);
  }


  showEnterRemarks(int index,int fromId){
    var typeController = TextEditingController();
    Get.dialog(
      AlertDialog(
        title:  Text("Enter Remarks..".toString()),
        content: SizedBox(
            width: double.minPositive,
            height: 100,
            child: Column(
              children: [
                TextField(
                  controller: typeController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    hintText: "Enter Qty..",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.input,color: Colors.black38,),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: (){
                      if(fromId==1){
                        secScreendata[index].remarks=typeController.text;
                      }
                      update();
                      Get.back();
                    }, child: const Text("Ok")),
                    const SizedBox(width: 5,),
                    TextButton(
                        onPressed: (){
                          Get.back();
                          update();
                        },
                        child: const Text("Cancel")),
                  ],
                )
              ],
            )
        ),
      ),
    );

  }

  pageNavigation(controller){
    secScreendata.clear();
    update();
    if(controller==1){
      addNewItem();
      Itemdetailes();
      update();
    }
    pagecontroller.jumpToPage(controller);
    update();
  }

  getCardCodeMaster(){
    Allapi.getcardcode(1,sessionUseId,true).then((value) => {

      log(value.body),

      if(value.statusCode==200){

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
          update(),
        getEmpData(),

      }
    });

  }

  void getEmpData(){
    secEmpData.clear();
    update();
    Allapi.getAllMaser(3, "0", "", "", "", true).then((value) => {
      if(value.statusCode==200){
        Utilities.closeLoader(),
        update(),
        rawEmpDataModel = EmpDataModel.fromJson(jsonDecode(value.body)),
        for(int i=0;i<rawEmpDataModel.result!.length;i++){
          secEmpData.add(
              EmpData(
                rawEmpDataModel.result![i].empCode.toString(),
                rawEmpDataModel.result![i].empName.toString(),
              )),
        },

      }

    });
  }

  void Itemdetailes(){
    Allapi.getAllMaser(12, "docNo", "status", "type", "leadno", true).then((value) => {
      if(value.statusCode==200){
        print(value.body),
        rawItemDetaliesModel = ItemDetaliesModel.fromJson(jsonDecode(value.body)),
        for(int l=0;l<rawItemDetaliesModel.result!.length;l++){
          secResultList.add(
              ResultList(
                rawItemDetaliesModel.result![l].itemCode,
                rawItemDetaliesModel.result![l].itemName,
              ),
          )
        },
        Utilities.closeLoader(),
        update(),

      }
    });

  }

  void activityRemove(int indexOf) {
    secScreendata.removeAt(indexOf);
    update();
  }

  void addNewItem() {
    secScreendata.add(ScreenData("Choose", "", "", ""));
    update();
  }



  postSave(){
    Allapi.insertSalesEnqHeader(opportunityType.text, salesType.text, cradCode.text, opportunityName.text,
        cardName.text, opportunityNo.text, contactPerson.text, saleStatus.text, empName.text, empCode.text, startDate.text, manufacturing.text,
        postartDate.text, poClosingDate.text, salespesBy.text, salescode.text, poStage.text, poSclosing.text, poammount.text, powigAmt.text,
        sessionUseId, 1, true).then((value) => {
          if(value.statusCode==200){
            log(value.body),
            log(jsonDecode(value.body)['result'][0]['DocNo'].toString()),
            for(int k=0;k<secScreendata.length;k++){

              Allapi.insertSalesEnqItemDetalies(
                  jsonDecode(value.body)['result'][0]['DocNo'].toString(),
                  secScreendata[k].itemcode,
                  secScreendata[k].itamname,
                  secScreendata[k].remarks,
                  sessionUseId, 1, false),
            
            },
            Utilities.closeLoader(),
            Utilities.showDialaogboxSavedMessage(context, jsonDecode(value.body)['result'][0]['STATUSNAME'].toString(), "Saved.."),
            update(),
          }

    });
  }


}

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}

class RXCardCode {
  String? cardCode;
  String? cardName;

  RXCardCode(this.cardCode, this.cardName);


}

class EmpData {
  var empCode;
  var empName;
  EmpData(this.empCode, this.empName);
}


class ResultList {
  String? itemCode;
  String? itemName;

  ResultList(this.itemCode, this.itemName);


}


class ScreenData{
  var itemcode;
  var itamname;
  var remarks;
  var type;
  ScreenData(this.itemcode,this.itamname,this.remarks,this.type);
}
