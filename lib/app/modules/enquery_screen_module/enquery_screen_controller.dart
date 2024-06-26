import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/Model/AuditMasterModel.dart';
import '../../data/Model/ItemMasterModel.dart';
import '../../data/Model/LeadMasters.dart';
import '../../data/Model/MachineNameModel.dart';
import '../../data/Model/MachineSubData.dart';
import '../../data/repository/_allAPIList.dart';
import '../../routes/routr_management.dart';
import '../../utils/Utilites.dart';


class EnqueryScreenController extends GetxController{


  var sessionUseId  = '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';
  var navigationStatus = '0';
  var navigationcardCode = 'v'.obs;
  var navigationCardName = 'v'.obs;

  var alterMacBranName = '';
  var alterModelNo = '';
  var alterMatDetalies = '';


  var contactPercon = TextEditingController();
  var contactnumber = TextEditingController();
  var desigenation = TextEditingController();
  var machineName = TextEditingController();
  var remarks = TextEditingController();
  var machineSubName = TextEditingController();
  var itemName = TextEditingController();
  var email = TextEditingController();
  var orderType = TextEditingController();
  var tabName = TextEditingController();
  var quatationvalue = TextEditingController();
  var Ordervalue = TextEditingController();
  var servicePlace = TextEditingController();

  late MachineNameModel rawMachineNameModel;
  late MachineNameModel rawMachineSubNameModel;
  late ItemMasterModel rawItemMasterModel;
  late AuditMasterModel rawAuditMasterModel;
  late MachineSubData rawMachineSubData;

late LeadMasters rawLeadMasters;

  List<MachineList> secMachineList=[];
  List<MachineList> secMachineSubList=[];
  List<ScreenMachineData> secScreenMachineData=[];
  List<ItemList> secItemList=[];
  List<AdditItemResult> secAdditItemResult=[];
  List<String> secCustype=[];
  List<String>contactPersonList=[];

  var alterdesigenation='';

  var datatbl = false;
  var order = false;
  var quatation = false;
  var serviceCeck = true;
  var getDocNo;

  @override
  void onInit() {
    // TODO: implement onInit
    secCustype.addAll(['General','Order','Quatation']);
    update();
    getStringValuesSF();
    super.onInit();
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sessionUseId  =   prefs.getString('UserID').toString();
    sessionName = prefs.getString('FirstName').toString();
    sessionDeptCode = prefs.getString('DeptCode').toString();
    sessionDeptName = prefs.getString('DeptName').toString();
    navigationStatus = Get.arguments['Status'];
    getDocNo = Get.arguments['DocNo'];
    navigationcardCode=Get.arguments['CardCode'].toString().obs;
    navigationCardName=Get.arguments['CardName'].toString().obs;
    getmachineData();
    if(getDocNo.toString()=="0"){

    }else{
      getMyScreendata();
    }
    update();

    //permision();
  }


  getmachineData() {
    secAdditItemResult.clear();
    var cardCode = navigationcardCode.toString().obs;
    //navigationcardCode.toString().obs;
    update();
    Allapi.getAllMaser(17, sessionUseId, sessionUseId, sessionUseId, cardCode, true).then((value) => {
      if(value.statusCode==200){
        log(value.body),
    //rawAuditMasterModel;  secAdditItemResult
        if(jsonDecode(value.body)['status'].toString() =="0"){

        }else{
        rawAuditMasterModel = AuditMasterModel.fromJson(jsonDecode(value.body)),
        for(int k=0;k<rawAuditMasterModel.result!.length;k++){
          secAdditItemResult.add(
              AdditItemResult(
                  rawAuditMasterModel.result![k].headerDocEntry,
                  rawAuditMasterModel.result![k].docEntry,
                  rawAuditMasterModel.result![k].machBrand,
                  rawAuditMasterModel.result![k].modelNo,
                  rawAuditMasterModel.result![k].matDetail,
                  rawAuditMasterModel.result![k].tab,
                  rawAuditMasterModel.result![k].tabName),
          ),
        },
        },

        Utilities.closeLoader(),
        getSubmachineData(),
        update(),

      }
    });
  }

  getSubmachineData() {
    secMachineSubList.clear();
    update();
    Allapi.getAllMaser(15, sessionUseId, sessionUseId, sessionUseId, sessionUseId, true).then((value) => {
      if(value.statusCode==200){
        log(value.body),
        rawMachineSubNameModel = MachineNameModel.fromJson(jsonDecode(value.body)),
        for(int i=0;i<rawMachineSubNameModel.result!.length;i++){
          secMachineSubList.add(MachineList(
              rawMachineSubNameModel.result![i].machineCode,
              rawMachineSubNameModel.result![i].machineName),
          )
        },
        Utilities.closeLoader(),
        getallmaster(),
        update(),
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


  getAllmachineData() {
    secItemList.clear();
    update();
    Allapi.getAllMaser(16, sessionUseId, sessionUseId, machineName.text, machineSubName.text, true).then((value) => {
      if(value.statusCode==200){
        log(value.body),
        rawItemMasterModel  = ItemMasterModel.fromJson(jsonDecode(value.body)),
        for(int j=0;j<rawItemMasterModel.result!.length;j++){
          secItemList.add(
              ItemList(
                  rawItemMasterModel.result![j].itemCode,
                  rawItemMasterModel.result![j].itemName,
                  rawItemMasterModel.result![j].forigenName,
                  rawItemMasterModel.result![j].stock),
          )
        },
        Utilities.closeLoader(),
        showMyItemList(),
        update(),
      }
    });
  }


  getMyScreendata(){
    Allapi.getAllReports(13, getDocNo, "status", "type", sessionUseId, "docEntry", true).then((value) => {
      if(value.statusCode==200){
        //log(value.body),
        navigationcardCode = jsonDecode(value.body)['result'][0]['CardCode'].toString().obs,
        navigationCardName=jsonDecode(value.body)['result'][0]['CardName'].toString().obs,
        contactPercon.text=jsonDecode(value.body)['result'][0]['ContactPerson'].toString(),
        contactnumber.text=jsonDecode(value.body)['result'][0]['ContactNo'].toString(),
        desigenation.text=jsonDecode(value.body)['result'][0]['Desiganation'].toString(),
        email.text=jsonDecode(value.body)['result'][0]['Email'].toString(),
        remarks.text = jsonDecode(value.body)['result'][0]['REMARKS'].toString(),
        orderType.text = jsonDecode(value.body)['result'][0]['VISTERTYPE'].toString(),
        Ordervalue.text= jsonDecode(value.body)['result'][0]['ORDERVALUE'].toString(),
        quatationvalue.text = jsonDecode(value.body)['result'][0]['QUAVALUE'].toString(),
        servicePlace.text = jsonDecode(value.body)['result'][0]['SERVICEPLACE'].toString(),
         print(jsonDecode(value.body)['result'][0]['DocNo'].toString()),
        //General','Order','Quatation
        if(orderType.text=="General"){

        }else if(orderType.text=="Order"){
          order = true,
          datatbl = true,
        }else if(orderType.text=="Quatation"){
          quatation = true,
          datatbl = true,
        },

        if(servicePlace.text.isEmpty){
          serviceCeck = false,
        }else {
          serviceCeck = true,
        },
        
        Allapi.getAllReports(
            14,
            jsonDecode(value.body)['result'][0]['DocNo'].toString(), "status", "type", sessionUseId, "docEntry", false).then((value) => {
              if(value.statusCode==200){
                log(value.body),
                if(jsonDecode(value.body)['status'].toString()=="0"){

                }else {
                  rawMachineSubData = MachineSubData.fromJson(jsonDecode(value.body)),
                  for(int k=0;k<rawMachineSubData.result!.length;k++){
                    secScreenMachineData.add(
                        ScreenMachineData(
                            rawMachineSubData.result![k].cardCode,//cardcode,
                            rawMachineSubData.result![k].tANNAME,//TabType,
                            rawMachineSubData.result![k].bRANNAME,//brand,
                            rawMachineSubData.result![k].mADELNO,//ModelNo,
                            rawMachineSubData.result![k].mRTDETALIES,//MatDetail,
                            rawMachineSubData.result![k].iTEMCODE,//ItemCode,
                            rawMachineSubData.result![k].iTEMNAME,//ItemName,
                            rawMachineSubData.result![k].qTY,//qty,
                            rawMachineSubData.result![k].sTOCK,//stock,
                            "Y"),
                    )
                  }
                }
              }
            }),

        Utilities.closeLoader(),
        update(),

      }else{
        Utilities.closeLoader(),
        update(),
      },



    });
  }



 showMyMachine() {
     var serchcall = TextEditingController();
     Get.dialog(
       Dialog(
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(50),
         ),
         elevation: 0,
         backgroundColor: Colors.transparent,
         child: Stack(
           children: <Widget>[
             Container(
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
                         controller: serchcall,
                         enabled: true,
                         style: const TextStyle(fontSize: 12),
                         onChanged: (vvv){

                         },
                         decoration: InputDecoration(
                             contentPadding: const EdgeInsets.only(top: 3, bottom: 2, left: 10, right: 10),
                             hintText: 'Search Here..',
                             labelText: 'Search Here..',
                             labelStyle: TextStyle(color: Colors.grey.shade600),
                             prefixIcon: const Icon(Icons.search_rounded,color: Colors.deepOrange,)
                           //border: const OutlineInputBorder(),
                         ),
                       ),
                     ),
                     SizedBox(
                       width: 350,
                       height: 450,
                       child: ListView.builder(
                         shrinkWrap: true,
                         itemCount: secAdditItemResult.length,
                         itemBuilder: (BuildContext context, int index) {
                           return Card(
                             child: ListTile(
                               title: Column(
                                 children: [
                                   SizedBox(
                                     width: double.infinity,
                                     child: Row(
                                       children: [
                                         Text("Model Brand : ",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.deepOrange),),
                                         Text(secAdditItemResult[index].machBrand.toString()),
                                       ],
                                     ),
                                   ),
                                   SizedBox(height: 2,),
                                   SizedBox(
                                     width: double.infinity,
                                     child: Row(
                                       children: [
                                         Text("Model No : ",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.pinkAccent),),
                                         Text(secAdditItemResult[index].modelNo.toString()),
                                       ],
                                     ),
                                   ),
                                   SizedBox(height: 2,),
                                   SizedBox(
                                     width: double.infinity,
                                     child: Text(secAdditItemResult[index].matDetail.toString()),
                                   ),
                                 ],
                               ),
                               onTap: () {
                                 Get.back();
                                 tabName.text = secAdditItemResult[index].tabName.toString();
                                 alterMacBranName = secAdditItemResult[index].machBrand.toString();
                                 alterModelNo = secAdditItemResult[index].modelNo.toString();
                                 alterMatDetalies = secAdditItemResult[index].matDetail.toString();
                                 //machineName.text = secAdditItemResult[index].machineCode.toString();

                                 update();
                               },
                             ),
                           );
                         },
                       ),
                     ),
                     Align(
                       alignment: Alignment.bottomRight,
                       child: TextButton(
                         onPressed: () {
                           Get.back();
                           update();
                         },
                         child: const Text("Cancel", style: TextStyle(fontSize: 18, color: Colors.black),),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ],
         ),
       ),
     );
   }

 showMySubMachine() {
    var serchcall = TextEditingController();
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Container(
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
                        controller: serchcall,
                        enabled: true,
                        style: const TextStyle(fontSize: 12),
                        onChanged: (vvv){

                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(top: 3, bottom: 2, left: 10, right: 10),
                            hintText: 'Search Here..',
                            labelText: 'Search Here..',
                            labelStyle: TextStyle(color: Colors.grey.shade600),
                            prefixIcon: const Icon(Icons.search_rounded,color: Colors.deepOrange,)
                          //border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 350,
                      height: 450,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: secMachineSubList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              title: Column(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(secMachineSubList[index].machineCode.toString()),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(secMachineSubList[index].machineName.toString()),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Get.back();
                                machineSubName.text = secMachineSubList[index].machineCode.toString();
                                update();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                          update();
                        },
                        child: const Text("Cancel", style: TextStyle(fontSize: 18, color: Colors.black),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showMyItemList() {
    var serchcall = TextEditingController();
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Container(
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
                        controller: serchcall,
                        enabled: true,
                        style: const TextStyle(fontSize: 12),
                        onChanged: (vvv){

                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(top: 3, bottom: 2, left: 10, right: 10),
                            hintText: 'Search Here..',
                            labelText: 'Search Here..',
                            labelStyle: TextStyle(color: Colors.grey.shade600),
                            prefixIcon: const Icon(Icons.search_rounded,color: Colors.deepOrange,)
                          //border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 350,
                      height: 450,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: secItemList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              title: Column(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(secItemList[index].itemCode.toString()),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(secItemList[index].itemName.toString()),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(secItemList[index].forigenName.toString()),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(secItemList[index].stock.toString()),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Get.back();
                                //machineSubName.text = secItemList[index].itemCode.toString();
                                addMyscreendata(
                                    navigationcardCode,
                                    tabName.text,
                                    secItemList[index].itemCode.toString(),
                                    secItemList[index].itemName.toString(),
                                    secItemList[index].stock.toString());

                                update();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                          update();
                        },
                        child: const Text("Cancel", style: TextStyle(fontSize: 18, color: Colors.black),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<bool> onWillPop(context) async {
    return (await showDialog(
      context: context,
      builder: (context) =>
      new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
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


   addMyscreendata(cardcode,TabType,ItemCode,ItemName,stock) {
    int count =0;
    for(int k=0;k<secScreenMachineData.length;k++){
      if(secScreenMachineData[k].ItemCode.toString()==ItemCode){
        count++;
      }
    }
    if(count==0){
      secScreenMachineData.add(
        ScreenMachineData(
            cardcode,
            TabType,
            alterMacBranName,
            alterModelNo,
            alterMatDetalies,
            ItemCode,
            ItemName,
            "0",
            stock,
            "Y"),
      );
    }else {
      Fluttertoast.showToast(msg: "This Machine Already added..");
    }


   }

   removeData(int indexOf,int fromId) {
     var typeController = TextEditingController();
    if(fromId==1){
    secScreenMachineData.removeAt(indexOf);
    }else if(fromId==2){
      if(secScreenMachineData[indexOf].status=="Y"){
        secScreenMachineData[indexOf].status='N';
      }else {
        secScreenMachineData[indexOf].status='Y';
      }
    }else if(fromId==3){
      Get.dialog(
        AlertDialog(
          title:  Text("Enter The Qty"),
          content: SizedBox(
              width: double.minPositive,
              height: 100,
              child: Column(
                children: [
                  TextField(
                    controller: typeController,
                    decoration: const InputDecoration(
                      hintText: "Enter Here..",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.edit,color: Colors.black38,),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: (){
                        secScreenMachineData[indexOf].qty=typeController.text.toString();
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
    update();
   }

   postSave(){
     if(contactnumber.text.length<10){

       Utilities.showDialaogboxWarningMessage(Get.context, "Mobile Number Should more then 10 or Ten...", "Warning");

     }else if(email.text.isEmpty){
       Utilities.showDialaogboxWarningMessage(Get.context, "Enter The Email..", "Warning");
     }else if(contactPercon.text.isEmpty){
       Utilities.showDialaogboxWarningMessage(Get.context, "Enter The Contact Person..", "Warning");
     }else {
       var cardCode = navigationcardCode.toString().obs;
       Allapi.inserEnquery(1, sessionUseId, cardCode, contactPercon.text, contactnumber.text,
           desigenation.text, "O", remarks.text,orderType.text,Ordervalue.text,quatationvalue.text,servicePlace.text,
           email.text, true).then((value) => {
             if(value.statusCode==200){
               log(value.body),
               log(jsonDecode(value.body)['result'][0]['DocNo'].toString()),
               for(int j=0;j<secScreenMachineData.length;j++){
                 Allapi.insertMachine(1, sessionUseId, cardCode, secScreenMachineData[j].TabType,
                  secScreenMachineData[j].brand, //brandName,
                  secScreenMachineData[j].ModelNo,//modelNo,
                  secScreenMachineData[j].MatDetail,//mtrDetalies,
                  secScreenMachineData[j].ItemCode,//itemcode,
                  secScreenMachineData[j].ItemName, //itemName,
                  secScreenMachineData[j].stock,
                  secScreenMachineData[j].qty,
                  secScreenMachineData[j].status,
                  jsonDecode(value.body)['result'][0]['DocNo'].toString(),
                  "O", false)
        },
        Utilities.closeLoader(),
        Get.back(),
        RouteManageMent.goToSiteVisit(),

      }
    });
     }
   }

  void clearDropdown() {
    machineName.text='';
    machineSubName.text='';
    update();
  }

   screenLayout(String text) {

    datatbl = false;
    order = false;
    quatation = false;
     //secCustype.addAll(['General','Order','Quatation']);
    if(text=="General"){
      secScreenMachineData.clear();
      datatbl = false;
    }else if(text=="Order"){
      datatbl = true;
      order = true;
    }else if(text =="Quatation"){
      datatbl = true;
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

class MachineList {
  String? machineCode;
  String? machineName;
  MachineList(this.machineCode, this.machineName);
}

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}

class ScreenMachineData{
var cardcode;
var TabType;
var brand;
var ModelNo;
var MatDetail;
var ItemCode;
var ItemName;
var qty;
var stock;
var status;

  ScreenMachineData(this.cardcode,this.TabType,this.brand,
      this.ModelNo,
      this.MatDetail,
      this.ItemCode,
      this.ItemName,
      this.qty,
      this.stock,
      this.status);
}


class ItemList {
  String? itemCode;
  String? itemName;
  String? forigenName;
  String? stock;

  ItemList(this.itemCode, this.itemName, this.forigenName, this.stock);


}


class AdditItemResult {
  int? headerDocEntry;
  int? docEntry;
  String? machBrand;
  String? modelNo;
  String? matDetail;
  String? tab;
  String? tabName;

  AdditItemResult(
      this.headerDocEntry,
        this.docEntry,
        this.machBrand,
        this.modelNo,
        this.matDetail,
        this.tab,
        this.tabName);
}



