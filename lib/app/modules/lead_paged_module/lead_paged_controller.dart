import 'dart:convert';
import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/Model/AuditMasterModel.dart';
import '../../data/Model/DistrictModel.dart';
import '../../data/Model/ItemMasterModel.dart';
import '../../data/Model/LeadMasters.dart';
import '../../data/Model/MachineNameModel.dart';
import '../../data/Model/MachineSubData.dart';
import '../../data/repository/_allAPIList.dart';
import '../../routes/routr_management.dart';
import '../../utils/Utilites.dart';


class LeadPagedController extends GetxController{

  var cardname = TextEditingController(text: '');
  var mobileno = TextEditingController(text: '');
  var contactperson = TextEditingController(text: '');
  var contactpersonposition = TextEditingController(text: '');
  var email = TextEditingController(text: '');
  var streetname = TextEditingController(text: '');
  var landmark = TextEditingController(text: '');
  var district = TextEditingController(text: '');
  var state = TextEditingController(text: '');
  var officeno = TextEditingController(text: '');
  var pan = TextEditingController(text: '');
  var gstin = TextEditingController(text: '');
  var bankname = TextEditingController(text: '');
  var accountno = TextEditingController(text: '');
  var branch = TextEditingController(text: '');
  var ifsc = TextEditingController(text: '');
  var orderType = TextEditingController(text: '');
  var addressType = TextEditingController(text: '');
  var orderValues = TextEditingController();
  var quatationvalue =TextEditingController();
  var servicePlace =TextEditingController();
  var tabName = TextEditingController();

  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';

  late LeadMasters rawLeadMasters;
  String? altercampanygroup='';
  String? altercontactpersonposition='';
  List<String>campanygroup=[];

  String? altertypeofbusiness='';
  String? alterState='';
  String? getalterState='';

  String? alterdistrict = '';
  String? getalterdistrict = '';

  List<String>typeofbusiness=[];
  List<String>contactPersonList=[];
  List<String>stateList=[];

  String? alterGSTIN='';
  List<String>gsttype=[];

  String? altercurrency='';
  List<String>currencytype=[];
  List<String>secCustype=[];
  List<String>secAddressType=[];
  List<String>secDistrict=[];


  var getDocNo="0";
  var order = false;
  var quatation = false;
  var serviceCeck = true;
  var datatbl = false;
  var ImagePath = '';
  late FilePickerResult    result;
  final picker = ImagePicker();

  late MachineNameModel rawMachineNameModel;
  late MachineNameModel rawMachineSubNameModel;
  late ItemMasterModel rawItemMasterModel;
  late AuditMasterModel rawAuditMasterModel;
  late MachineSubData rawMachineSubData;
  late DistrictModel rawDistrictModel;




  List<MachineList> secMachineList=[];
  List<MachineList> secMachineSubList=[];
  List<ScreenMachineData> secScreenMachineData=[];
  List<ItemList> secItemList=[];
  List<AdditItemResult> secAdditItemResult=[];

  var alterMacBranName = '';
  var alterModelNo = '';
  var alterMatDetalies = '';
  var machineName = TextEditingController();
  var machineSubName = TextEditingController();
  var itemName = TextEditingController();
  var remarks = TextEditingController();


  // Machine Data//


  @override
  void onInit() {
    // TODO: implement onInit
    getStringValuesSF();
    secCustype.addAll(['General','Order','Quatation']);
    secAddressType.addAll(['Building','Floor','Room']);
    update();
    super.onInit();
  }
  Future<void> getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

      sessionUseId  =   prefs.getString('UserID').toString();
      sessionName = prefs.getString('FirstName').toString();
      sessionDeptCode = prefs.getString('DeptCode').toString();
      sessionDeptName = prefs.getString('DeptName').toString();
      print(Get.arguments['DocNo']);
      getDocNo = Get.arguments['DocNo'].toString();
      cardname.text = Get.arguments['CompanyName'].toString();
      if(Get.arguments['DocNo'].toString()=="0"){
        getallmaster();
      }else {
        //getallmaster();
        getSavedData();
      }

      update();


  }

  getallmaster(){

    Allapi.getAllMaser(1, "", "", "", "", true).then((value) => {
      log(value.body),
      if(value.statusCode==200){
        rawLeadMasters = LeadMasters.fromJson(jsonDecode(value.body)),
        for(int i=0;i<rawLeadMasters.result!.length;i++){
          if(rawLeadMasters.result![i].type=='CG'){
            campanygroup.add(rawLeadMasters.result![i].name.toString()),
          }else if (rawLeadMasters.result![i].type=='TB'){
            typeofbusiness.add(rawLeadMasters.result![i].name.toString()),
          }else if (rawLeadMasters.result![i].type=='GST'){
            gsttype.add(rawLeadMasters.result![i].name.toString()),
          }else if (rawLeadMasters.result![i].type=='Cu'){
            currencytype.add(rawLeadMasters.result![i].name.toString()),
          }else if(rawLeadMasters.result![i].type=='CP'){
            contactPersonList.add(rawLeadMasters.result![i].name.toString()),
          }else if(rawLeadMasters.result![i].type=='IN'){
            stateList.add(rawLeadMasters.result![i].name.toString()),
          }
        },
        Utilities.closeLoader(),
        update(),
        getmachineData(),

      }else{
        Utilities.closeLoader(),
        update(),
      }

    });
  }



  getDistmaster(){

    Allapi.getAllMaser(19, "", "", getalterState.toString(), "", true).then((value) => {

      if(value.statusCode==200){
        log(value.body),
        rawDistrictModel = DistrictModel.fromJson(jsonDecode(value.body)),
        for(int i=0;i<rawDistrictModel.result!.length;i++){
          secDistrict.add(rawDistrictModel.result![i].name.toString()),
        },

        Utilities.closeLoader(),
        update(),
        //getmachineData(),

      }else{
        Utilities.closeLoader(),
        update(),
      }

    });
  }

  getSavedData(){
    Allapi.leadMasterScreen(2,
        cardname.text, mobileno.text, contactperson.text, contactpersonposition.text,
        email.text, streetname.text, landmark.text, district.text, state.text, officeno.text,
        0, sessionUseId, altercampanygroup, altertypeofbusiness, altercurrency, pan.text, gstin.text,
        alterGSTIN, bankname.text, accountno.text, branch.text, ifsc.text,
        addressType.text,"Y",orderType.text,orderValues.text,quatationvalue.text,
        true).then((value) => {

      if(value.statusCode==200){
        log(value.body),
        print(jsonDecode(value.body)['result'][0]['DocNo']),
        cardname.text = jsonDecode(value.body)['result'][0]['CardName'].toString(),
        mobileno.text = jsonDecode(value.body)['result'][0]['MobileNo'].toString(),
        contactperson.text=jsonDecode(value.body)['result'][0]['ContactPerson'],
        contactpersonposition.text=jsonDecode(value.body)['result'][0]['ContactPersonPosition'],
        email.text=jsonDecode(value.body)['result'][0]['Email'],
        streetname.text=jsonDecode(value.body)['result'][0]['StreetName'],
        landmark.text=jsonDecode(value.body)['result'][0]['LandMark'],
        district.text=jsonDecode(value.body)['result'][0]['District'],
        state.text=jsonDecode(value.body)['result'][0]['State'],
        officeno.text=jsonDecode(value.body)['result'][0]['OfficeNo'],
        altercampanygroup=jsonDecode(value.body)['result'][0]['CompanyGroup'],
        altertypeofbusiness=jsonDecode(value.body)['result'][0]['TypeOfBusiness'],
        altercurrency=jsonDecode(value.body)['result'][0]['Currency'],
        pan.text=jsonDecode(value.body)['result'][0]['Panno'],
        gstin.text=jsonDecode(value.body)['result'][0]['Gstin'],
        alterGSTIN=jsonDecode(value.body)['result'][0]['GstType'],
        bankname.text=jsonDecode(value.body)['result'][0]['BankName'],
        accountno.text=jsonDecode(value.body)['result'][0]['ACno'],
        branch.text=jsonDecode(value.body)['result'][0]['Branch'],
        ifsc.text=jsonDecode(value.body)['result'][0]['IFscCode'],
        Utilities.closeLoader(),
        update(),
      }else{
        Utilities.closeLoader(),
        update(),
      }

    });
  }



  getmachineData() {
    secAdditItemResult.clear();

    update();
    Allapi.getAllMaser(17, sessionUseId, sessionUseId, sessionUseId, cardname.text, true).then((value) => {
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





  postsave(int fromId){
    if(mobileno.text.length<10){

      Utilities.showDialaogboxWarningMessage(context, "Mobile Number Should more then 10 or Ten...", "Warning");

    }else if(email.text.isEmpty){
      Utilities.showDialaogboxWarningMessage(context, "Enter The Email..", "Warning");
    }

    else {

    Allapi.leadMasterScreen(fromId,
        cardname.text, mobileno.text, contactperson.text, contactpersonposition.text,
        email.text, streetname.text, landmark.text, district.text, state.text, officeno.text,
        0, sessionUseId, altercampanygroup, altertypeofbusiness, altercurrency, pan.text, gstin.text,
        alterGSTIN, bankname.text, accountno.text, branch.text, ifsc.text,
        addressType.text,"Y",orderType.text,orderValues.text,quatationvalue.text,
        true).then((value) => {

          if(value.statusCode==200){
            Utilities.closeLoader(),
            update(),
            Utilities.showDialaogboxSavedMessage(context,
                jsonDecode(value.body)['result'][0]['SatusMsg'].toString(),
                'Your Lead No is'+jsonDecode(value.body)['result'][0]['DocNo'].toString()),


          }else{
            Utilities.closeLoader(),
            update(),
          }

    });
    }
  }

   navigation(int i) {
    if(i==1){

    RouteManageMent.goToLeadReports();
    }else if(i==2){
      Get.back();
      RouteManageMent.goToSiteVisit();
      update();
    }

  }

  screenLayout(String text) {

    //datatbl = false;
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
                                    cardname,
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
                    keyboardType: TextInputType.number,
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

class MachineList {
  String? machineCode;
  String? machineName;
  MachineList(this.machineCode, this.machineName);
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
