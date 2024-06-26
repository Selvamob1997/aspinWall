import 'dart:convert';
import 'package:aspinwal/app/data/repository/_allAPIList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/Model/EmpDataModel.dart';
import '../../data/Model/EnqdataModel.dart';
import '../../utils/Utilites.dart';


class ProductionEntryController extends GetxController{

  TabController? tabController;
  int currentindex = 0;
  bool singlespindle = false;
  bool multiSingle = false;
  bool portable = false;
  bool pinType = false;
  bool cnc = false;
  bool withBore = false;
  bool solidWood =false;
  bool plainWood =false;
  bool uPvc =false;
  bool aluminium =false;
  bool acp =false;
  bool manual =false;
  bool tCP =false;
  bool singleBoringMC =false;
  bool multiBoringMC =false;
  bool multiDrillingMC =false;
  bool mortizingMC =false;
  bool copyshaper =false;
  bool cornercleaningMC =false;
  bool prelamBoard =false;
  bool postLamPlywood =false;
  bool mdf =false;
  bool particalBoard =false;
  bool compactLaminate =false;
  bool mechanical =false;
  bool both =false;
  bool pcd =false;

  var BoreDia = TextEditingController();
  var RPMSpeed = TextEditingController();
  var EnqNo = TextEditingController();
  var EnqDate = TextEditingController();
  var cardCode = TextEditingController();

  var CardName = TextEditingController();
  var ContactPerson = TextEditingController();
  var MobileNo = TextEditingController();
  var MaxDia = TextEditingController();
  var HP = TextEditingController();
  var Tool1 = TextEditingController();
  var Machine = TextEditingController();
  var DirRotation = TextEditingController();
  var MaxDiaCutter = TextEditingController();
  var Material = TextEditingController();
  var PowerOfMotor = TextEditingController();
  var RPM = TextEditingController();
  var MinDiaofCutter = TextEditingController();
  var CreateBy = TextEditingController();
  var Email = TextEditingController();
  var CreateByCode = TextEditingController();
  late EnqdataModel rawEnqdataModel;
  List<EnqData> secEnqData=[];
  late EmpDataModel rawEmpDataModel;
  List<EmpData> secEmpData=[];
  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';

  @override
  void onInit() {
    // TODO: implement onInit
    getStringValuesSF();
    update();
    super.onInit();
  }

  Future<void> getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    sessionUseId  =   prefs.getString('UserID').toString();
    sessionName = prefs.getString('FirstName').toString();
    sessionDeptCode = prefs.getString('DeptCode').toString();
    sessionDeptName = prefs.getString('DeptName').toString();
    getEnqData();
    update();


  }


  void statusChage(bool? value, int i) {
    if(i==1){
      singlespindle = value!;
      update();
    }
    else if(i==2){
      multiSingle = value!;
      update();
    }else if(i==3){
      portable = value!;
      update();
    }
    else if(i==4){
      pinType = value!;
      update();
    }
    else if(i==5){
      cnc = value!;
      update();
    }
    else if(i==6){
      withBore = value!;
      update();
    }else if (i==7){
      solidWood = value!;
      update();
    }else if(i==8){
      plainWood = value!;
      update();
    }else if(i==9){
      uPvc = value!;
      update();
    }else if (i==10){
      aluminium = value!;
      update();
    }else if(i==11){
      acp = value!;
      update();
    }else if(i==12){
      manual = value!;
      update();
    }
    else if(i==13){
      tCP = value!;
      update();
    }else if(i==14){
      singleBoringMC = value!;
      update();
    }else if(i==15){
      multiBoringMC = value!;
      update();
    }else if(i==16){
      multiDrillingMC = value!;
      update();
    }else if(i==17){
      mortizingMC=value!;
      update();
    }else if(i==18){
      copyshaper = value!;
      update();
    }else if(i==19){
      cornercleaningMC = value!;
      update();
    }else if(i==20){
      prelamBoard = value!;
      update();
    }else if(i==21){
      postLamPlywood = value!;
      update();
    }else if(i==22){
      mdf = value!;
      update();
    }else if(i==23){
      particalBoard = value!;
      update();
    }else if(i==24){
      compactLaminate = value!;
      update();
    }else if(i==25){
      mechanical = value!;
      update();
    }else if(i==26){
      both = value!;
      update();
    }else if(i==27){
      pcd = value!;
      update();
    }
  }

  void getEnqData(){
    secEnqData.clear();
    update();
    Allapi.getAllMaser(2, "0", "", "", "", true).then((value) => {
      if(value.statusCode==200){
        Utilities.closeLoader(),
        update(),
        rawEnqdataModel = EnqdataModel.fromJson(jsonDecode(value.body)),
        for(int i=0;i<rawEnqdataModel.result!.length;i++){
          secEnqData.add(
              EnqData(
                  rawEnqdataModel.result![i].enqNo,
                  rawEnqdataModel.result![i].cardCode,
                  rawEnqdataModel.result![i].cardName,
                  rawEnqdataModel.result![i].contactPerson,
                  rawEnqdataModel.result![i].enqDate)),
        },
        getEmpData(),
        update(),

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

  void showEnqNo(){
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
                    itemCount: secEnqData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(secEnqData[index].enqNo.toString()),
                          onTap: () {
                            EnqNo.text = secEnqData[index].enqNo.toString();
                            cardCode.text = secEnqData[index].cardCode.toString();
                            CardName.text = secEnqData[index].cardName.toString();
                            EnqDate.text = secEnqData[index].enqDate.toString();
                            ContactPerson.text = secEnqData[index].contactPerson.toString();
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

  void showEmpData(){
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
                            CreateBy.text = secEmpData[index].empName.toString();
                            CreateByCode.text = secEmpData[index].empCode.toString();

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

  void postSave() {


  }
}

class EmpData {
  var empCode;
  var empName;
  EmpData(this.empCode, this.empName);
}

class EnqData {
  var enqNo;
  var cardCode;
  var cardName;
  var contactPerson;
  var enqDate;

  EnqData(
      this.enqNo,
        this.cardCode,
        this.cardName,
        this.contactPerson,
        this.enqDate);


}

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}
