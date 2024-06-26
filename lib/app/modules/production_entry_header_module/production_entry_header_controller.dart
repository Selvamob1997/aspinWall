import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';

import '../../data/Model/EmpDataModel.dart';
import '../../data/Model/EnqdataModel.dart';
import '../../data/repository/_allAPIList.dart';
import '../../utils/Utilites.dart';


class ProductionEntryHeaderController extends GetxController{


  final pagecontroller = PageController(initialPage: 0,);
  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';



  var docNo = TextEditingController(text: '1450');
  var docDate = TextEditingController();
  var enqNo = TextEditingController();
  var cardcode = TextEditingController();
  var cardName = TextEditingController();
  var enqDate = TextEditingController();
  var contactPerson = TextEditingController();
  var mobileNo = TextEditingController();
  var preparedBy = TextEditingController();
  var preparedBycode = TextEditingController();
  var emailId = TextEditingController();
  var status =TextEditingController();
  String statusCode='';
  var tool = TextEditingController();
  String toolCode='';


  var machinetype = TextEditingController();
  String machinetypeCode='';


  var spindleMouldertype = TextEditingController();
  String spindleMoulderCode='';


  late EnqdataModel rawEnqdataModel;
  List<EnqData> secEnqData=[];
  late EmpDataModel rawEmpDataModel;
  List<EmpData> secEmpData=[];

  List<ScreenStatus> secscreenStatus=[];
  List<ScreenTool> secscreenTool=[];

  List<ScreenMachineType> secScreenMachineType=[];
  List<ScreenSpindleMoulderType> secScreenSpindleMoulderType=[];

  bool spindleMoulderlayout = false;
  List<String> MachineManufacturer =[];
  List<String> spindleType =[];
  List<String> Rotationspindle =[];
  List<String> YesNo =[];
  List<String> Feed =[];

  List<String> Materialbeingmachined =[];
  List<String> TipRequired =[];
  List<String> Movement =[];

// Page 1 single
  var MachineManufacturerctr =TextEditingController();
  var MachineModelCtr =TextEditingController();
  var spindleCtr =TextEditingController();
  var  RotationspindleCtr =TextEditingController();
  var  verticalisfeedCtr  =TextEditingController();
  var  AutofeedfacilityCtr   =TextEditingController();
  var  BoreDiameterCtr   =TextEditingController();
  var  MotorpowerCtr   =TextEditingController();
  var  RPMRangeCtr   =TextEditingController();
  var  FeedCtr   =TextEditingController();
  var  HeightspindleCtr    =TextEditingController();
  var  MaximumDiameterCtr    =TextEditingController();
  var  MinimumDiameterCtr    =TextEditingController();
  var  materialbeingmachinedCtr    =TextEditingController();
  var  MaterialThicknessCtr    =TextEditingController();
  var  ProductsmanufaturedCtr    =TextEditingController();
  var  dustextractoCtr    =TextEditingController();
  var  Brandoftools     =TextEditingController();
  var  toolsserviced     =TextEditingController();
  var  ToolsRequired     =TextEditingController();
  var  tipRequiredCtr     =TextEditingController();
  var  feedRate     =TextEditingController();
  var  service     =TextEditingController();
  var  rotationRate     =TextEditingController();

// End page 1

  // Page 2



  var page2MachineManufacturerctr =TextEditingController(); //1
  var page2MachineModelCtr =TextEditingController(); // 2

  List<String> secNumberofSpindleavailable=[]; //3
  var page2Spindleavailable = TextEditingController(); //3

  var page2spindlemachine = TextEditingController(); //4

  // here List
  List<Thelayoutofthespindles>  secThelayoutofthespindles=[]; //5
  List<Powerofthemotors>  secPowerofthemotors=[]; //6
  List<RPMoftheSpindles> secRPMoftheSpindles=[]; //7
  List<Diameterofthecutter> secDiameterofthecutter=[]; //8

  var page2BoreDiameter = TextEditingController(); //9
  var page2MaterialsBeingmachined = TextEditingController(); // 10

  var page2RawMaterialSize = TextEditingController(); //11
  var page2RawMaterialSizeL = TextEditingController(); // 11
  var page2RawMaterialSizeB = TextEditingController(); //
  var page2RawMaterialSizeThickness = TextEditingController(); // 11

  var page2FinishedMaterialSize = TextEditingController(); //12
  var page2FinishedMaterialSizeL = TextEditingController(); //12
  var page2FinishedMaterialSizeB = TextEditingController(); //12
  var page2FinishedMaterialSizeThickness = TextEditingController(); //12

  var page2Productsmanufactured  = TextEditingController(); //13
  var page2Brandoftoolspresentlyused  = TextEditingController(); //14
  var page2Toolsserviced  = TextEditingController(); // 15
  var page2DirectionofRotationoftool  = TextEditingController();// 16
  var page2TipGrade  = TextEditingController(); // 17
  var page2Directionoffeedofconveyor  = TextEditingController(); // 18

  // Page 3

  var page3MachineManufacturer = TextEditingController();
  var page3MachineModelNo = TextEditingController();
  var page3spindle = TextEditingController();
  var page3Rotationspindle = TextEditingController();
  var page3MaximumDiaAbo  = TextEditingController();
  var page3MaximumDiaBel  = TextEditingController();
  var page3MinimumDia   = TextEditingController();
  var page3BoreDiameter   = TextEditingController();
  var page3MotorPower   = TextEditingController();
  var page3RPMRanges   = TextEditingController();
  var page3usefulheightofthespindle   = TextEditingController();
  var page3Tablemovement   = TextEditingController();
  var page3Cuttermovement   = TextEditingController();
  var page3MaterialsbeingMachined   = TextEditingController();
  var page3MaterialwallThickness   = TextEditingController();
  var page3Prodmanmachine   = TextEditingController();
  var page3Dexavailable   = TextEditingController();
  var page3BrandTools   = TextEditingController();
  var page3Tooser   = TextEditingController();
  var page3Cooavai   = TextEditingController();
  var page3TipGrade   = TextEditingController();
  var  toolsservicedWhere   = TextEditingController();

  // Page 4
  var page4MachineManufacturer = TextEditingController();
  var page4MachineMake = TextEditingController();
  var page4MachineModelNo = TextEditingController();
  var page4spindle = TextEditingController();
  var page4Rotationspindle = TextEditingController();
  var page4RighttoLeft  = TextEditingController();
  var page4ffaavai   = TextEditingController();
  var page4BoreDiameter   = TextEditingController();
  var page4MotorPower   = TextEditingController();
  var page4RPMRanges   = TextEditingController();
  var page4Feed   = TextEditingController();
  var page4usefulheightofthespindle   = TextEditingController();
  var page4MaximumDiaAbo   = TextEditingController();
  var page4MinimumAbo   = TextEditingController();
  var page4MaterialsbeingMachined   = TextEditingController();
  var page4MaterialwallThickness   = TextEditingController();
  var page4Prodmanmachine   = TextEditingController();
  var page4Dexavailable   = TextEditingController();
  var page4BrandTools   = TextEditingController();
  var page4Tooser   = TextEditingController();
  var page4TipGrade   = TextEditingController();
  var page4toolsservicedwhere   = TextEditingController();

  // Page 5
  var page5MachineManufacturer = TextEditingController();
  var page5MachineModelNo = TextEditingController();
  var page5toolpositions = TextEditingController();
  var page5Typeofchuckused = TextEditingController();
  var page5Typeofcolletused = TextEditingController();
  var page5ToDiareq  = TextEditingController();
  var page5ToshaSiReq   = TextEditingController();
  var page5MaxDia  = TextEditingController();
  var page5ToCulengNL  = TextEditingController();
  var page5ToToLengGL  = TextEditingController();
  var page5DirRotTool  = TextEditingController();
  var page5NoFluTip  = TextEditingController();
  var page5Fltwides  = TextEditingController();
  var page5Material  = TextEditingController();
  var page5MateThick = TextEditingController();
  var page5SpiRPM = TextEditingController();
  var page5MotorPower = TextEditingController();
  var page5Radius = TextEditingController();
  var page5Chamangle = TextEditingController();
  var page5Tipgrade = TextEditingController();
  var page5PortableRouter = TextEditingController();

  // page 6
  var page6MachineManufacturer = TextEditingController();
  var page6MachineModelNo = TextEditingController();
  var page6CNCControlle = TextEditingController();
  var page6NuofHe = TextEditingController();
  var page6TonuVer  = TextEditingController();
  var page6TonuHar  = TextEditingController();
  var page6Drillbit  = TextEditingController();
  var page6DbitDiameter  = TextEditingController();
  var page6DbitCutdepNL  = TextEditingController();
  var page6DbitLenGL  = TextEditingController();
  var page6DrillbitSD   = TextEditingController();
  var page6TipGrade  = TextEditingController();
  var page6DrillbitRota  = TextEditingController();
  var page6Materialsbeingbored = TextEditingController();
  var page6MaterialThickness = TextEditingController();
  var page6Diameter  = TextEditingController();
  var page6TipThickness  = TextEditingController();
  var page6Bore  = TextEditingController();
  var page6NLA  = TextEditingController();
  var page6bitserviced  = TextEditingController();


  @override
  void onInit() {
    // TODO: implement onInit
    docDate.text = DateFormat('dd-MM-yyyy').format(DateTime.now());
    statusCode = "O";
    status.text="Open";
    secscreenStatus.addAll([
      ScreenStatus("Open", "O"),
      ScreenStatus("Close", "C"),
    ]);
    secscreenTool.addAll([
      ScreenTool("Cutter", "C"),
      ScreenTool("Router Bit", "RB"),
      ScreenTool("Drill Bit", "DB"),
    ]);
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
    preparedBy.text = sessionName.toString();
    preparedBycode.text = sessionUseId.toString();
    getEnqData();
    update();
  }

  pageNavigation(controller){
    MachineManufacturer =[];
    spindleType =[];
    Rotationspindle =[];
    YesNo =[];
    Materialbeingmachined =[];
    TipRequired =[];
    Feed=[];
    // Page Multiple//
    secNumberofSpindleavailable=[];
    Movement=[];

    if(controller==1){
      MachineManufacturer.addAll(["Homag","Biesse","Jai","SCM","Fedler","Etc"]);
      spindleType.addAll(["Vertical","Horizontal"]);
      Rotationspindle.addAll(["Along the Feed","Against the Feed"]);
      YesNo.addAll(["Yes","No"]);
      Feed.addAll(["Manual","Mechanical"]);
      Materialbeingmachined.addAll(["Solid Wood","Plain Wood","Prelam Board","Post Lam Plywood","Prelam MDF",
        "Prelam Particle Board","Compact Laminate","Acrylic laminated board","Postlam HDHMR"]);
      TipRequired.addAll(["TCT brazed","Solid","DP","Brazed Carbide"]);
      update();
    }
    else if(controller==2){
      MachineManufacturer.addAll(["Homag","Biesse","Jai","SCM","Fedler","Etc"]);
      YesNo.addAll(["Yes","No"]);
      Materialbeingmachined.addAll(["Solid Wood","Plain Wood","Prelam Board","Post Lam Plywood","Prelam MDF", "Prelam Particle Board","Compact Laminate","Acrylic laminated board","Postlam HDHMR"]);
      Rotationspindle.addAll(["Along the Feed","Against the Feed"]);
      TipRequired.addAll(["TCT brazed","Solid","DP"]);
      Feed.addAll(["Left to Right","Right to Left"]);
      secNumberofSpindleavailable.addAll(["2","3","4","5","6","7","8"]);
      update();

    }
    else if(controller==3){
      MachineManufacturer.addAll(["Homag","Biesse","Jai","SCM","Fedler","Etc"]);
      spindleType.addAll(["Vertical","Horizontal"]);
      Rotationspindle.addAll(["Along the Feed","Against the Feed"]);
      Movement.addAll(["Right to Left","Left to Right","Stationary"]);
      Feed.addAll(["uPvc","Aluminium","ACP"]);
      YesNo.addAll(["Yes","No"]);
      TipRequired.addAll(["TCT brazed","Solid","DP"]);
      update();
    }
    else if(controller==4){ // Ending
      MachineManufacturer.addAll(["Homag","Biesse","Jai","SCM","Fedler","Etc"]);
      spindleType.addAll(["Vertical","Horizontal"]);
      Rotationspindle.addAll(["Along the Feed","Against the Feed"]);
      YesNo.addAll(["Yes","No"]);
      Feed.addAll(["Manual","Mechanical"]);
      Materialbeingmachined.addAll(["Solid Wood","Plain Wood","Prelam Board","Post Lam Plywood","Prelam MDF",
        "Prelam Particle Board","Compact Laminate","Acrylic laminated board","Postlam HDHMR"]);
      TipRequired.addAll(["TCT brazed","Solid","DP"]);
      update();
    }
    else if(controller==5){
      MachineManufacturer.addAll(["Homag","Biesse","Jai","SCM","Fedler","Etc"]);
      spindleType.addAll(["HSK-F63 ","ISO30"]);
      Rotationspindle.addAll(["ER32","ER40","ER25","Type462E","ER16","ER20"]);
      Movement.addAll(["LH","RH"]);
      Feed.addAll(["RD"," LD"]);
      Materialbeingmachined.addAll(["Solid Wood","Plain Wood","Prelam Board","Post Lam Plywood","Prelam MDF",
        "Prelam Particle Board","Compact Laminate","Acrylic laminated board","Postlam HDHMR"]);
      TipRequired.addAll(["TCT brazed","Solid","DP"]);
      secNumberofSpindleavailable.addAll(["With Bearing"," Without Bearing"]);
      update();
    }
    else if(controller==6){
      MachineManufacturer.addAll(["Homag","Biesse","Jai","SCM","Fedler","Etc"]);
      YesNo.addAll(["Yes","No"]);
      Rotationspindle.addAll(["Dowel Drill-bit","Through Hole Drill-bit","Hinge boring bit","Twist Drill","Step Drill","Countersunk Drill"]);
      TipRequired.addAll(["TCT brazed","Solid","DP"]);
      Movement.addAll(["LH","RH"]);
      Materialbeingmachined.addAll(["Solid Wood","Plain Wood","Prelam Board","Post Lam Plywood","Prelam MDF",
        "Prelam Particle Board","Compact Laminate","Acrylic laminated board","Postlam HDHMR"]);
      update();
    }
    pagecontroller.jumpToPage(controller);
    update();
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
                            enqNo.text = secEnqData[index].enqNo.toString();
                            cardcode.text = secEnqData[index].cardCode.toString();
                            cardName.text = secEnqData[index].cardName.toString();
                            enqDate.text = secEnqData[index].enqDate.toString();
                            contactPerson.text = secEnqData[index].contactPerson.toString();
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
                            preparedBy.text = secEmpData[index].empName.toString();
                            preparedBycode.text = secEmpData[index].empCode.toString();
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

  void showMechineType(type) {
    machinetype.text='';
    machinetypeCode='';
    secScreenMachineType.clear();
    spindleMoulderlayout=false;
    secScreenSpindleMoulderType.clear();
    spindleMouldertype.text='';
    spindleMoulderCode='';
    update();
    if(type=="C"){
    secScreenMachineType.addAll([
      ScreenMachineType("Spindle Moulder", "SM"),
      ScreenMachineType("End Milling", "EM"),
      ScreenMachineType("Other Machine", "OM"),
    ]);

    update();
    }

    else if(type=="RB"){
      secScreenMachineType.addAll([
        ScreenMachineType("CNC Router", "CR"),
        ScreenMachineType("Pin Router", "PR"),
        ScreenMachineType("Portable Router", "POR"),
      ]);
      pageNavigation(5);

      update();
    }
    else if(type=="DB"){
      secScreenMachineType.addAll([
        ScreenMachineType("Multi-Boring", "MB"),
        ScreenMachineType("CNC Boring", "CB"),
        ScreenMachineType("CNC Router", "CR"),
      ]);
      pageNavigation(6);
      update();
    }

  }

  void showSpindleMoulder(type) {
    spindleMoulderlayout=false;
    secScreenSpindleMoulderType.clear();
    spindleMouldertype.text='';
    spindleMoulderCode='';
    update();

    if(type=="SM"){
    secScreenSpindleMoulderType.addAll([
      ScreenSpindleMoulderType("Single spindle moulder", "SSM",1),
      ScreenSpindleMoulderType("Multi-spindle moulder", "SEM",2),
      ]);
    spindleMoulderlayout=true;
      update();
    }else if(type=="EM"){
      pageNavigation(3);
    }else if(type=="OM"){
      pageNavigation(4);
    }
  }

  postSave(){

    Allapi.insertProductEntry(enqNo.text, cardcode.text, enqDate.text, cardName.text, contactPerson.text, mobileNo.text,
        preparedBycode.text,
        emailId.text, statusCode, tool.text, toolCode, machinetype.text, machinetypeCode,
        spindleMouldertype.text, spindleMoulderCode, "CreatedDate",
        "0", 1, true).then((value) => {
          if(value.statusCode==200){
            print(value.body),
            //log(jsonDecode(value.body)['result'][0]['DocNo'].toString()),
            if(toolCode=="C"){
              if(machinetypeCode=="SM"){
                if(spindleMoulderCode=="SSM"){
                  Allapi.insertProductSingleModule(jsonDecode(value.body)['result'][0]['DocNo'].toString(),
                      MachineManufacturerctr.text, MachineModelCtr.text, spindleCtr.text, RotationspindleCtr.text,
                      verticalisfeedCtr.text, AutofeedfacilityCtr.text, BoreDiameterCtr.text, MotorpowerCtr.text, RPMRangeCtr.text,
                      FeedCtr.text, HeightspindleCtr.text, MaximumDiameterCtr.text, MinimumDiameterCtr.text, materialbeingmachinedCtr.text,
                      MaterialThicknessCtr.text, ProductsmanufaturedCtr.text, dustextractoCtr.text, Brandoftools.text, toolsserviced.text,
                      ToolsRequired.text, tipRequiredCtr.text, sessionUseId, "0", false,feedRate.text,service.text).then((value) => {
                        if(value.statusCode==200){
                          Utilities.closeLoader(),
                          update(),
                          print(value.body),
                          Utilities.showDialaogboxSavedMessage(context, jsonDecode(value.body)['result'][0]['STATUSNAME'].toString(), "Saved..")

                        }
                  }),

                }
                else if(spindleMoulderCode=="SEM"){

                  Allapi.insertProductMultiModule(jsonDecode(value.body)['result'][0]['DocNo'].toString(),
                      page2MachineManufacturerctr.text,
                      page2MachineModelCtr.text, page2Spindleavailable.text, page2spindlemachine.text,
                      page2BoreDiameter.text, page2MaterialsBeingmachined.text,
                      page2RawMaterialSizeL.text+" X "+page2RawMaterialSizeB.text+" X "+page2RawMaterialSizeThickness.text,// page2RawMaterialSize.text,
                      page2FinishedMaterialSizeL.text+" X "+page2FinishedMaterialSizeB.text+" X "+page2FinishedMaterialSizeThickness.text,// page2FinishedMaterialSize                                                                                                    //page2FinishedMaterialSize.text,
                      page2Productsmanufactured.text, page2Brandoftoolspresentlyused.text,
                      page2Toolsserviced.text, page2DirectionofRotationoftool.text, page2TipGrade.text,
                      page2Directionoffeedofconveyor.text, sessionUseId, "0", false).then((value) => {
                        if(value.statusCode==200){
                          for(int k=0;k<secThelayoutofthespindles.length;k++){
                            Allapi.insertProductSubModule(1, jsonDecode(value.body)['result'][0]['DocNo'].toString(),
                                secThelayoutofthespindles[k].Name,
                                secThelayoutofthespindles[k].position,
                                secThelayoutofthespindles[k].orientation, "varbile3", sessionUseId, "0", false),
                          },
                          for(int j=0;j<secPowerofthemotors.length;j++){
                            Allapi.insertProductSubModule(2,
                                jsonDecode(value.body)['result'][0]['DocNo'].toString(),
                                secPowerofthemotors[j].name,
                                secPowerofthemotors[j].km, secPowerofthemotors[j].hp, "varbile3", sessionUseId, "0", false),
                          },
                          for(int l=0;l<secRPMoftheSpindles.length;l++){
                            Allapi.insertProductSubModule(3, jsonDecode(value.body)['result'][0]['DocNo'].toString(),
                                secRPMoftheSpindles[l].Name, secRPMoftheSpindles[l].min, "varbile2",
                                "varbile3", sessionUseId, "0", false),
                          },
                          for(int m=0;m<secDiameterofthecutter.length;m++){
                            Allapi.insertProductSubModule(4, jsonDecode(value.body)['result'][0]['DocNo'].toString(),
                                "Name", secDiameterofthecutter[m].to, secDiameterofthecutter[m].mm, "varbile3", sessionUseId, "0", false),
                          },

                          Utilities.closeLoader(),

                          print(value.body),
                          update(),
                          Utilities.showDialaogboxSavedMessage(context, jsonDecode(value.body)['result'][0]['STATUSNAME'].toString(), "Saved..")

                        }
                  }),

                }

              }
              else if(machinetypeCode=="EM"){

                Allapi.insertProducEnding(jsonDecode(value.body)['result'][0]['DocNo'].toString(),
                    page3MachineManufacturer.text,
                    page3MachineModelNo.text, page3spindle.text,
                    page3Rotationspindle.text, page3MaximumDiaAbo.text, page3MaximumDiaBel.text, page3MinimumDia.text,page3BoreDiameter.text,
                    page3MotorPower.text, page3RPMRanges.text, page3usefulheightofthespindle.text, page3Tablemovement.text, page3Cuttermovement.text,
                    page3MaterialsbeingMachined.text, page3MaterialwallThickness.text, page3Prodmanmachine.text, page3Dexavailable.text, page3BrandTools.text,
                    page3Tooser.text, page3Cooavai.text, page3TipGrade.text, sessionUseId, "0", false).then((value) => {
                      if(value.statusCode==200){
                        print(value.body),
                        Utilities.closeLoader(),
                        update(),
                        Utilities.showDialaogboxSavedMessage(context, jsonDecode(value.body)['result'][0]['STATUSNAME'].toString(), "Saved..")

                      }

                }),



              }
              else if(machinetypeCode=="OM"){

                Allapi.insertProducEntryOthers(jsonDecode(value.body)['result'][0]['DocNo'].toString(),
                    page4MachineManufacturer.text, page4MachineMake.text, page4MachineModelNo.text, page4spindle.text,
                    page4Rotationspindle.text, page4RighttoLeft.text, page4ffaavai.text, page4BoreDiameter.text, page4MotorPower.text, page4RPMRanges.text,
                    page4Feed.text, page4usefulheightofthespindle.text, page4MaximumDiaAbo.text, page4MinimumAbo.text, page4MaterialsbeingMachined.text,
                    page4MaterialwallThickness.text, page4Prodmanmachine.text, page4Dexavailable.text, page4BrandTools.text, page4Tooser.text, page4TipGrade.text,
                    page4toolsservicedwhere.text, sessionUseId, "0", false).then((value) => {
                      if(value.statusCode==200){
                        print(value.body),
                        log(jsonDecode(value.body)['result'][0]['STATUSNAME'].toString()),
                        Utilities.closeLoader(),
                        update(),
                        Utilities.showDialaogboxSavedMessage(context, jsonDecode(value.body)['result'][0]['STATUSNAME'].toString(), "Saved..")
                      }
                    }),
              }

            }
            else if(toolCode=="RB"){

              Allapi.insertProducEntryRouterBit(jsonDecode(value.body)['result'][0]['DocNo'].toString(),
                  page5MachineManufacturer.text, page5MachineModelNo.text,
                  page5toolpositions.text, page5Typeofchuckused.text, page5Typeofcolletused.text, page5ToDiareq.text, page5ToshaSiReq.text,
                  page5MaxDia.text, page5ToCulengNL.text, page5ToToLengGL.text, page5DirRotTool.text, page5NoFluTip.text, page5Fltwides.text,
                  page5Material.text, page5MateThick.text, page5SpiRPM.text, page5MotorPower.text, page5Radius.text,
                  page5Chamangle.text, page5Tipgrade.text,
                  page5PortableRouter.text, sessionUseId, "0", false).then((value) => {
                    if(value.statusCode==200){
                      print(value.body),
                      log(jsonDecode(value.body)['result'][0]['STATUSNAME'].toString()),
                      Utilities.closeLoader(),
                      update(),
                      Utilities.showDialaogboxSavedMessage(context, jsonDecode(value.body)['result'][0]['STATUSNAME'].toString(), "Saved..")
                    }
              }),


            }
            else if(toolCode=="DB"){

              Allapi.insertProducEntryDrilBit(jsonDecode(value.body)['result'][0]['DocNo'].toString(),
                  page6MachineManufacturer.text, page6MachineModelNo.text, page6CNCControlle.text, page6NuofHe.text, page6TonuVer.text,
                  page6TonuHar.text, page6Drillbit.text, page6DbitDiameter.text, page6DbitCutdepNL.text, page6DbitLenGL.text, page6DrillbitSD.text, page6TipGrade.text, page6DrillbitRota.text,
                  page6Materialsbeingbored.text, page6MaterialThickness.text, page6Diameter.text, page6TipThickness.text, page6Bore.text, page6NLA.text,
                  page6bitserviced.text, "page6Place", sessionUseId, "0", false).then((value) => {
                    if(value.statusCode==200){
                      print(value.body),
                      log(jsonDecode(value.body)['result'][0]['STATUSNAME'].toString()),
                      Utilities.closeLoader(),
                      update(),
                      Utilities.showDialaogboxSavedMessage(context, jsonDecode(value.body)['result'][0]['STATUSNAME'].toString(), "Saved..")
                    }
              }),

            },
            update(),
          }
    });
  }

  addListPage2(int parse) {
      secThelayoutofthespindles=[];
      secPowerofthemotors=[];
      secRPMoftheSpindles=[];
      secDiameterofthecutter=[];
      update();
      
      for(int i=0;i<parse;i++){
        secThelayoutofthespindles.add(
            Thelayoutofthespindles("Spindle "+(i+1).toString(), "position", "Oriantation"),
        );
      }
      update();
      for(int i=0;i<parse;i++){
        secPowerofthemotors.add(
            Powerofthemotors("Motor "+(i+1).toString(), "KM", "HP"),
        );
      }
      update();
      for(int i=0;i<parse;i++){
        secRPMoftheSpindles.add(
            RPMoftheSpindles("Spindle "+(i+1).toString(), "min"),
        );
      }
      update();
      for(int i=0;i<parse;i++){
        secDiameterofthecutter.add(
            Diameterofthecutter("to", "mm"),
        );
      }
      update();
    
    
    
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

class ScreenStatus {
  var desc;
  var code;

  ScreenStatus(
      this.desc,
      this.code,
      );


}

class ScreenTool {
  var desc;
  var code;

  ScreenTool(
      this.desc,
      this.code,
      );


}

class ScreenMachineType {
  var desc;
  var code;
  ScreenMachineType(
      this.desc,
      this.code,
      );


}

class ScreenSpindleMoulderType {
  var desc;
  var code;
  int? pageCont;
  ScreenSpindleMoulderType(
      this.desc,
      this.code,
      this.pageCont
      );
}

class Thelayoutofthespindles{
  var Name;
  var position;
  var orientation;
  Thelayoutofthespindles(this.Name,this.position,this.orientation);
}

class Powerofthemotors{
  var name;
  var km;
  var hp;
  Powerofthemotors(this.name,this.km,this.hp);
}

class RPMoftheSpindles {
  var Name;
  var min;
  RPMoftheSpindles(this.Name,this.min);

}

class Diameterofthecutter {
var to;
var mm;
Diameterofthecutter(this.to,this.mm);
}

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}
