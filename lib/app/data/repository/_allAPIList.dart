import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../utils/Utilites.dart';

abstract class Allapi {
  // ignore: non_constant_identifier_names
  //static String LIVE_URL = "http://192.168.1.4:4202/"; //
  //static String LIVE_URL = "http://182.78.163.86:4202/"; //
  static String LIVE_URL = "http://13.200.48.126:5201/"; //

  static Future<http.Response> postRequest1(_edtUsername,_edtPassword,isloading) async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'login');
    var headers = {"Content-Type": "application/json"};
    var body = {
      "UserName": _edtUsername,
      "Password": _edtPassword
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'login'),
          body: jsonEncode(body),
          headers: headers);

      Utilities.closeLoader();

      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }

  static Future<http.Response> getdashattendance(formid,isloading,empId) async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'getdashatten');
    var headers = {"Content-Type": "application/json"};
    var body = {
      "FromId": formid,
      "EmpId": empId
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'getdashatten'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }

  static Future<http.Response> getdashLeave(formid,isloading,empId) async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'getdashLeave');
    var headers = {"Content-Type": "application/json"};
    var body = {
      "FromId": formid,
      "Date": empId,
      "EmpId": empId,
      //"DocNo": DocNo,
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'getdashLeave'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }

  static Future<http.Response> getcardcode(formid,userId,isloading) async {

    log(LIVE_URL + 'login');
    var headers = {"Content-Type": "application/json"};
    var body = {
      "FromId":formid,
      "CardCode":userId
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'getcardcode'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }

  static Future<http.Response> postattendance(
      isloading,formid,name,empId,date,day,frmlatlong, fromplace,tolatlng,toplace,totaldistance,month,remarks,
      createby,modifiedBy,approvestatus,locationtype,locationnanme,description,fromtime,totime,finalstatus,
      maxDocNo
      ) async {

    log(LIVE_URL + 'InSalesInsertAttendance');
    if(isloading)Utilities.showLoader();
    var headers = {"Content-Type": "application/json"};
    var body = {
      "FormID": formid,
      "Name": name,
      "EmpId": empId,
      "Date": date,
      "Day": "",
      "FromLatLng":frmlatlong,
      "FromPlace": fromplace,
      "ToLatLng": tolatlng,
      "ToPlace": toplace,
      "TotalDistance": totaldistance,
      "Month": month,
      "Remarks": remarks,
      "CreatedBy": createby,
      "ModifiedBy": modifiedBy,
      "ApprovalStatus": approvestatus,
      "ApprovedBy": "",
      "LocationType": locationtype,
      "LocationName": locationnanme,
      "Discription": description,
      "FromTime": fromtime ,
      "ToTime": totime,
      "FinalStatus":finalstatus,
      "MaxDocNo":maxDocNo,
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'InSalesInsertAttendance'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }


  static Future<http.Response> getLeaveType(formid,docNo,status,type,leadno,isloading) async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'getallmaster');
    var headers = {"Content-Type": "application/json"};
    var body = {

      "FormID": formid,
      "DocNo": docNo,
      "Status": status,
      "Type": type,
      "Leadno": leadno
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'getallmaster'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }


  static Future<http.Response> insertLeaveMaster(formid,empId,leaveType,leaveCode,fromDate,todate,noOfDays,comments,status,docNo,isloading) async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'insetLeaveqmaster');
    var headers = {"Content-Type": "application/json"};
    var body = {
      "FromId": formid,
      "EmpId": empId,
      "LeaveType": leaveType,
      "LeaveCode": leaveCode,
      "FromDate": fromDate,
      "Todate": todate,
      "NoOfDays": noOfDays,
      "Comments": comments,
      "Status": status,
      "DocNo": docNo,
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insetLeaveqmaster'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }


  static Future<http.Response> visitChecking(formid,empId,cardcode,intTime,outTime,fromLat,fromLog,fromAddress,
      toLat,toLang,toAddress,status,docDate,isloading
      ) async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'insetVisitqmaster');
    var headers = {"Content-Type": "application/json"};
    var body = {
      "FromId": formid,
      "EmpId": empId,
      "CardCode": cardcode,
      "InTime": intTime,
      "OutTime": outTime,
      "FromLat": fromLat,
      "FromLog": fromLog,
      "FromAddress": fromAddress,
      "ToLat": toLat,
      "ToLang": toLang,
      "ToAddress": toAddress,
      "Status": status,
      "DocDate": docDate
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insetVisitqmaster'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }



  static Future<http.Response> telecallBooking(formid,empId,cardcode,remarks,status,docdate,type,
  desiganation,contactperson,contactNo,email,ordervalue,quavalue,servicePlace,isloading) async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'insettelebooking');
    var headers = {"Content-Type": "application/json"};
    var body = {
      "FromId"	:formid,
      "EmpId":	empId,
      "CardCode":cardcode,
      "Remarks":remarks,
      "Status":status,
      "DocDate":docdate,
      "Type":type,
      "Desiganation":desiganation,
      "Contactperson":contactperson,
      "ContactNo":contactNo,
      "Email":email,
      "OrderValue":ordervalue,
      "QuaValue":quavalue,
      "ServicePlace":servicePlace,
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insettelebooking'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }




  static Future<http.Response> insertPermisionMaster(formid,fromdate,fromTime,totime,totalTime,empId,docdate,
      status,purposeofvist,docNo, isloading) async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'insetPermisionmaster');
    var headers = {"Content-Type": "application/json"};
    var body = {
      "FromId": formid,
      "Fromdate": fromdate,
      "FromTime": fromTime,
      "ToTime": totime,
      "TotalTime": totalTime,
      "EmpId": empId,
      "DocDate": docdate,
      "Status": status,
      "Purposeofvist": purposeofvist,
      "DocNo": docNo,
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insetPermisionmaster'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }


  static Future<http.Response> insertOnDutyMaster(formid,onDutyType,fromDate,toDate,fromLocation,toLocation,fromTime,toTime,
      empId,status,docDate,docNo,purpose,isloading) async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'insetOnDutymaster');
    var headers = {"Content-Type": "application/json"};
    var body = {
      "FromId": formid,
      "OnDutyType": onDutyType,
      "FromDate": fromDate,
      "ToDate": toDate,
      "FromLocation": fromLocation,
      "ToLocation": toLocation,
      "FromTIme": fromTime,
      "ToTime": toTime,
      "EmpId": empId,
      "Status": status,
      "DocDate": docDate,
      "DocNo": docNo,
      "Purpose":purpose
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insetOnDutymaster'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }

  static Future<http.Response> getApprovelList(formid,userid,docdate,status,DocNo,isloading) async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'getPermisionMaster');
    var headers = {"Content-Type": "application/json"};
    var body = {
      "FromId": formid,
      "UserId": userid,
      "DocDate": docdate,
      "Status": status,
      "DocNo":DocNo
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'getPermisionMaster'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }


  static Future<http.Response> getAllMaser(formid,docNo,status,type,leadno,isloading) async {

    if(isloading)Utilities.showLoader();

    log(LIVE_URL + 'getallmaster');
    var headers = {"Content-Type": "application/json"};
    var body = {
      "FormID":formid,
      "DocNo": docNo,
      "Status": "",
      "Type": type,
      "Leadno": leadno.toString()
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'getallmaster'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }


  static Future<http.Response> leadMasterScreen(formid,cardname,mobileno,contactperson,contactpersonposition,
  email,streetname,landmark,district,state,officeno,docno,sessionUseId,altercampanygroup,altertypeofbusiness,
      altercurrency,pan,gstin,alterGSTIN,bankname,accountno,branch,ifsc,addressType,serviceBy,visiterType,ordervalue,
      quaValue,isloading
      ) async {

    if(isloading)Utilities.showLoader();

    log(LIVE_URL + 'insetleadmaster');
    var headers = {"Content-Type": "application/json"};

    var body = {
      "FromId":formid,
      "CardName":cardname,
      "MobileNo":mobileno,
      "ContactPerson":contactperson,
      "ContactPersonPosition":contactpersonposition,
      "Email":email,
      "StreetName":streetname,
      "LandMark":landmark,
      "District":district,
      "State":state,
      "OfficeNo":officeno,
      "DocDate":docno,
      "CreateBy":sessionUseId.toString(),
      "CompanyGroup":altercampanygroup.toString(),
      "TypeOfBusiness":altertypeofbusiness.toString(),
      "Currency":altercurrency.toString(),
      "Panno":pan,
      "Gstin":gstin,
      "GstType":alterGSTIN.toString(),
      "BankName":bankname,
      "ACno":accountno,
      "Branch":branch,
      "IFscCode":ifsc,

      "AddressType":addressType,
      "ServiceBy":serviceBy,
      "visiterType":visiterType,
      "orderValue":ordervalue,
      "QuaValue":quaValue
      //"SapLeadNo":LeadCode
    };

    //log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insetleadmaster'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }

  static Future<http.Response> insertProductEntry(EnqNo,cardCode,EnqDate,CardName,ContactPerson,MobileNo
      ,CreateBy,Email,status,tool,toolType,machineType,machineTypeCode,spindleType,spindleTypeCode,CreatedDate,DocNo,FormID,isloading
      ) async {

    if(isloading)Utilities.showLoader();

    log(LIVE_URL + 'insetleadmaster');
    var headers = {"Content-Type": "application/json"};

    var body = {
      "EnqNo":EnqNo,
      "CardCode":cardCode,
      "EnqDate":EnqDate,
      "CardName":CardName,
      "ContactPerson":ContactPerson,
      "MobileNo":MobileNo,
      "CreateBy":CreateBy,
      "Email":Email,
      "Status":status,
      "Tool":tool,
      "ToolType":toolType,
      "MachineType":machineType,
      "MachineTypeCode":machineTypeCode,
      "SpindleType":spindleType,
      "SpindleTypeCode":spindleTypeCode,
      "CreatedDate":CreatedDate,
      "DocNo":"0",
      "FormID":1
    };

    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insetProdEntry'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }



  static Future<http.Response> insertProductSingleModule(DocNo,MachineManufacturerctr,MachineModelCtr,spindleCtr,RotationspindleCtr,
      verticalisfeedCtr,AutofeedfacilityCtr,BoreDiameterCtr,MotorpowerCtr,RPMRangeCtr,FeedCtr,HeightspindleCtr,
      MaximumDiameterCtr,MinimumDiameterCtr,materialbeingmachinedCtr,MaterialThicknessCtr,ProductsmanufaturedCtr,
      dustextractoCtr,Brandoftools,toolsserviced,ToolsRequired,tipRequiredCtr,CreateBy,Saptatus,isloading,feedRate,serPlace
      ) async {

    if(isloading)Utilities.showLoader();

    log(LIVE_URL + 'insetProdEntrySingleModule');
    var headers = {"Content-Type": "application/json"};

    var body = {
      "FormID":1,
      "DocNo":DocNo,
      "MachineManufacturerctr":MachineManufacturerctr,
      "MachineModelCtr":MachineModelCtr,
      "spindleCtr":spindleCtr,
      "RotationspindleCtr":RotationspindleCtr,
      "verticalisfeedCtr":verticalisfeedCtr,
      "AutofeedfacilityCtr":AutofeedfacilityCtr,
      "BoreDiameterCtr":BoreDiameterCtr,
      "MotorpowerCtr":MotorpowerCtr,
      "RPMRangeCtr":RPMRangeCtr,
      "FeedCtr":FeedCtr,
      "HeightspindleCtr":HeightspindleCtr,
      "MaximumDiameterCtr":MaximumDiameterCtr,
      "MinimumDiameterCtr":MinimumDiameterCtr,
      "materialbeingmachinedCtr":materialbeingmachinedCtr,
      "MaterialThicknessCtr":MaterialThicknessCtr,
      "ProductsmanufaturedCtr":ProductsmanufaturedCtr,
      "dustextractoCtr":dustextractoCtr,
      "Brandoftools":Brandoftools,
      "toolsserviced":toolsserviced,
      "ToolsRequired":ToolsRequired,
      "tipRequiredCtr":tipRequiredCtr,
      "CreateBy":CreateBy,
      "Saptatus":Saptatus,
      "FeedRate":feedRate,
      "SerPlace":serPlace
    };

    //log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insetProdEntrySingleModule'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }


  static Future<http.Response> insertProductMultiModule(DocNo,
      page2MachineManufacturerctr,page2MachineModelCtr,page2Spindleavailable,page2spindlemachine,page2BoreDiameter
      ,page2MaterialsBeingmachined,page2RawMaterialSize,page2FinishedMaterialSize,page2Productsmanufactured,
      page2Brandoftoolspresentlyused,page2Toolsserviced,page2DirectionofRotationoftool,page2TipGrade,page2Directionoffeedofconveyor,
      CreateBy,Saptatus,isloading
      ) async {

    if(isloading)Utilities.showLoader();

    log(LIVE_URL + 'insetProdEntryMultiModule');
    var headers = {"Content-Type": "application/json"};

    var body = {
      "FormID":1,
      "DocNo":DocNo,
      "page2MachineManufacturerctr":page2MachineManufacturerctr,
      "page2MachineModelCtr":page2MachineModelCtr,
      "page2Spindleavailable":page2Spindleavailable,
      "page2spindlemachine":page2spindlemachine,
      "page2BoreDiameter":page2BoreDiameter,
      "page2MaterialsBeingmachined":page2MaterialsBeingmachined,
      "page2RawMaterialSize":page2RawMaterialSize,
      "page2FinishedMaterialSize":page2FinishedMaterialSize,
      "page2Productsmanufactured":page2Productsmanufactured,
      "page2Brandoftoolspresentlyused":page2Brandoftoolspresentlyused,
      "page2Toolsserviced":page2Toolsserviced,
      "page2DirectionofRotationoftool":page2DirectionofRotationoftool,
      "page2TipGrade":page2TipGrade,
      "page2Directionoffeedofconveyor":page2Directionoffeedofconveyor,
      "CreateBy":CreateBy,
      "Saptatus":Saptatus,
      "CreatedDate":"CreatedDate"
    };

    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insetProdEntryMultiModule'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }


  static Future<http.Response> insertProductSubModule(FromID,DocNo, Name,varbile1,varbile2,varbile3,
      CreateBy,Saptatus,isloading) async {

    if(isloading)Utilities.showLoader();

    log(LIVE_URL + 'insetProdEntryMultiModuleSUB');
    var headers = {"Content-Type": "application/json"};

    var body = {
      "FormID":FromID,
      "DocNo":DocNo,
      "Name":Name,
      "varbile1":varbile1,
      "varbile2":varbile2,
      "varbile3":varbile3,
      "createBy":CreateBy,
      "Saptatus":Saptatus,
      "CreatedDate":"CreatedDate"
    };

    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insetProdEntryMultiModuleSUB'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }



  static Future<http.Response> insertProducEnding(DocNo,
      page3MachineManufacturer,page3MachineModelNo,page3spindle,page3Rotationspindle,page3MaximumDiaAbo
      ,page3MaximumDiaBel,page3MinimumDia,page3BoreDiameter,page3MotorPower,
      page3RPMRanges,page3usefulheightofthespindle,page3Tablemovement,page3Cuttermovement,page3MaterialsbeingMachined,
      page3MaterialwallThickness,page3Prodmanmachine,page3Dexavailable,page3BrandTools,page3Tooser,page3Cooavai,page3TipGrade,
      CreateBy,Saptatus,isloading
      ) async {

    if(isloading)Utilities.showLoader();

    log(LIVE_URL + 'insetProdEntryEND');
    var headers = {"Content-Type": "application/json"};

    var body = {
      "FormID":1,
      "DocNo":DocNo,
      "MachineManufacturer":page3MachineManufacturer,
      "MachineModelNo":page3MachineModelNo,
      "spindle":page3spindle,
      "Rotationspindle":page3Rotationspindle,
      "MaximumDiaAbo":page3MaximumDiaAbo,
      "MaximumDiaBel":page3MaximumDiaBel,
      "MinimumDia":page3MinimumDia,
      "BoreDiameter":page3BoreDiameter,
      "MotorPower":page3MotorPower,
      "RPMRanges":page3RPMRanges,
      "usefulheightofthespindle":page3usefulheightofthespindle,
      "Tablemovement":page3Tablemovement,
      "Cuttermovement":page3Cuttermovement,
      "MaterialsbeingMachined":page3MaterialsbeingMachined,
      "MaterialwallThickness":page3MaterialwallThickness,
      "Prodmanmachine":page3Prodmanmachine,
      "Dexavailable":page3Dexavailable,
      "BrandTools":page3BrandTools,
      "Tooser":page3Tooser,
      "Cooavai":page3Cooavai,
      "TipGrade":page3TipGrade,
      "CreateBy":CreateBy,
      "Saptatus":Saptatus,
      "CreatedDate":"CreatedDate"
    };

    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insetProdEntryEND'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }



  static Future<http.Response> insertProducEntryOthers(DocNo,page4MachineManufacturer,page4MachineMake,page4MachineModelNo,page4spindle,
      page4Rotationspindle,page4RighttoLeft,page4ffaavai,page4BoreDiameter,page4MotorPower,page4RPMRanges,page4Feed,page4usefulheightofthespindle,
      page4MaximumDiaAbo,page4MinimumAbo,page4MaterialsbeingMachined,page4MaterialwallThickness,page4Prodmanmachine,page4Dexavailable,
      page4BrandTools,page4Tooser,page4TipGrade,page4toolsservicedwhere,
      CreateBy,Saptatus,isloading
      ) async {

    if(isloading)Utilities.showLoader();

    log(LIVE_URL + 'insetProdEntryOthers');
    var headers = {"Content-Type": "application/json"};

    var body = {
      "FormID":1,
      "DocNo":DocNo,
      "MachineManufacturer":page4MachineManufacturer,
      "MachineMake":page4MachineMake,
      "MachineModelNo":page4MachineModelNo,
      "spindle":page4spindle,
      "Rotationspindle":page4Rotationspindle,
      "RighttoLeft":page4RighttoLeft,
      "ffaavai":page4ffaavai,
      "BoreDiameter":page4BoreDiameter,
      "MotorPower":page4MotorPower,
      "RPMRanges":page4RPMRanges,
      "Feed":page4Feed,
      "usefulheightofthespindle":page4usefulheightofthespindle,
      "MaximumDiaAbo":page4MaximumDiaAbo,
      "MinimumAbo":page4MinimumAbo,
      "MaterialsbeingMachined":page4MaterialsbeingMachined,
      "MaterialwallThickness":page4MaterialwallThickness,
      "Prodmanmachine":page4Prodmanmachine,
      "Dexavailable":page4Dexavailable,
      "BrandTools":page4BrandTools,
      "Tooser":page4Tooser,
      "TipGrade":page4TipGrade,
      "toolsservicedwhere":page4toolsservicedwhere,
      "CreateBy":CreateBy,
      "Saptatus":Saptatus,
    };

    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insetProdEntryOthers'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }


  static Future<http.Response> insertProducEntryRouterBit(DocNo,page5MachineManufacturer,page5MachineModelNo,page5toolpositions,page5Typeofchuckused,
      page5Typeofcolletused,page5ToDiareq,page5ToshaSiReq,page5MaxDia,page5ToCulengNL,page5ToToLengGL,page5DirRotTool,page5NoFluTip,
      page5Fltwides,page5Material,page5MateThick,page5SpiRPM,page5MotorPower,page5Radius,page5Chamangle,page5Tipgrade,page5PortableRouter,
      CreateBy,Saptatus,isloading
      ) async {

    if(isloading)Utilities.showLoader();

    log(LIVE_URL + 'insetProdEntryRouterBit');
    var headers = {"Content-Type": "application/json"};

    var body = {
      "FormID":1,
      "DocNo":DocNo,
      "MachineManufacturer":page5MachineManufacturer,
      "MachineModelNo":page5MachineModelNo,
      "toolpositions":page5toolpositions,
      "Typeofchuckused":page5Typeofchuckused,
      "Typeofcolletused":page5Typeofcolletused,
      "ToDiareq":page5ToDiareq,
      "ToshaSiReq":page5ToshaSiReq,
      "MaxDia":page5MaxDia,
      "ToCulengNL":page5ToCulengNL,
      "ToToLengGL":page5ToToLengGL,
      "DirRotTool":page5DirRotTool,
      "NoFluTip":page5NoFluTip,
      "Fltwides":page5Fltwides,
      "Material":page5Material,
      "MateThick":page5MateThick,
      "SpiRPM":page5SpiRPM,
      "MotorPower":page5MotorPower,
      "Radius":page5Radius,
      "Chamangle":page5Chamangle,
      "Tipgrade":page5Tipgrade,
      "PortableRouter":page5PortableRouter,
      "CreateBy":CreateBy,
      "Saptatus":Saptatus
    };

    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insetProdEntryRouterBit'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }


  static Future<http.Response> insertProducEntryDrilBit(DocNo,page6MachineManufacturer,page6MachineModelNo,page6CNCControlle,page6NuofHe,
      page6TonuVer,page6TonuHar,page6Drillbit,page6DbitDiameter,page6DbitCutdepNL,page6DbitLenGL,page6DrillbitSD,page6TipGrade,
      page6DrillbitRota,page6Materialsbeingbored,page6MaterialThickness,page6Diameter,page6TipThickness,page6Bore,page6NLA,
      page6bitserviced,page6Place, CreateBy,Saptatus,isloading) async {
    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'insetProdEntryDrillBit');
    var headers = {"Content-Type": "application/json"};
    var body = {
      "FormID":1,
      "DocNo":DocNo,
      "MachineManufacturer":page6MachineManufacturer,
      "MachineModelNo":page6MachineModelNo,
      "CNCControlle":page6CNCControlle,
      "NuofHe":page6NuofHe,
      "TonuVer":page6TonuVer,
      "TonuHar":page6TonuHar,
      "Drillbit":page6Drillbit,
      "DbitDiameter":page6DbitDiameter,
      "DbitCutdepNL":page6DbitCutdepNL,
      "DbitLenGL":page6DbitLenGL,
      "DrillbitSD":page6DrillbitSD,
      "TipGrade":page6TipGrade,
      "DrillbitRota":page6DrillbitRota,
      "Materialsbeingbored":page6Materialsbeingbored,
      "MaterialThickness":page6MaterialThickness,
      "Diameter":page6Diameter,
      "TipThickness":page6TipThickness,
      "Bore":page6Bore,
      "NLA":page6NLA,
      "bitserviced":page6bitserviced,
      "Place":page6Place,
      "CreateBy":CreateBy,
      "Saptatus":Saptatus
    };

    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insetProdEntryDrillBit'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }




  static Future<http.Response> insertSalesEnqHeader(opportunityType,salesType,cradCode,opportunityName,cardName,
      opportunityNo,contactPerson,saleStatus,empName,empCode,startDate,manufacturing,
      postartDate,poClosingDate,salespesBy,salescode,poStage,poSclosing,poammount,powigAmt,createby,formid,
      isloading) async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'insetSalesEnqueryHeader');
    var headers = {"Content-Type": "application/json"};
    var body = {

        "opportunityType":opportunityType,
        "salesType":salesType,
        "cradCode":cradCode,
        "opportunityName":opportunityName,
        "cardName":cardName,
        "opportunityNo":opportunityNo,
        "contactPerson":contactPerson,
        "saleStatus":saleStatus,
        "empName":empName,
        "empCode":empCode,
        "startDate":startDate,
        "manufacturing":manufacturing,
        "postartDate":postartDate,
        "poClosingDate":poClosingDate,
        "salespesBy":salespesBy,
        "salescode":salescode,
        "poStage":poStage,
        "poSclosing":poSclosing,
        "poammount":poammount,
        "powigAmt":powigAmt,
        "Createby":createby,
         "FormID":formid
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insetSalesEnqueryHeader'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }


  static Future<http.Response> insertSalesEnqItemDetalies(docNo,itemcode,itamname,remarks,createby,formID,
      isloading) async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'insetSalesEnqueryDetaies');
    var headers = {"Content-Type": "application/json"};
    var body = {

      "DocNo":docNo,
      "Itemcode":itemcode,
      "Itamname": itamname,
      "Remarks":remarks,
      "Createby":createby,
      "FormID":formID

    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insetSalesEnqueryDetaies'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }




  static Future<http.Response> getAllReports(formid,docNo,status,type,userId,docEntry,isloading) async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'getAllreports');
    var headers = {"Content-Type": "application/json"};
    var body = {

      "FormID": formid,
      "DocNo": docNo,
      "Status": status,
      "Type": type,
      "UserId": userId,
      "DocEntry":docEntry
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'getAllreports'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }




  static Future<http.Response> inserReimbursment(formid,docNo,foodtotalAmt,foodAtta,accTotalAmt,
      accAtta,transportmode,fromPlace,toPlace,transTotalAmt,transAtta,vechileType,startingKMPhoto,
      endingKMPhoto,totalDistance,totalAmt,remarks,vechileAtta,createdBy,
      isloading) async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'insetReimbursmaster');
    var headers = {"Content-Type": "application/json"};
    var body = {

      "FromId": formid,
      "DocNo": docNo,
      "FoodTotalAmt": foodtotalAmt,
      "FoodAtta": foodAtta,
      "AccoTotalAmt": accTotalAmt,
      "AccoAtta":accAtta,
      "TransPortMode":transportmode,
      "FromPlace":fromPlace,
      "ToPlace":toPlace,
      "TransTotalAmt":transTotalAmt,
      "TransAtta":transAtta,
      "VechileType":vechileType,
      "StartingKMPhoto":startingKMPhoto,
      "EndingKMPhoto":endingKMPhoto,
      "TotalDistance":totalDistance,
      "TotalAmt":totalAmt,
      "Remarks":remarks,
      "VechileAtta":vechileAtta,
      "CreatedBy":createdBy,
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insetReimbursmaster'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }



  static Future<http.Response> inserEnquery(formid,empId,cardCode,contactperson,contactNo,desiganation,status,
      remarks,visterType,orderValue,quaValue,servicePlace,email,isloading)
  async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'insertEnquery');
    var headers = {"Content-Type": "application/json"};
    var body = {

      "FormID": formid,
      "EmpId": empId,
      "CardCode": cardCode.toString(),
      "ContactPerson": contactperson,
      "ContactNo": contactNo,
      "Desiganation":desiganation,
      "Status":status,
      "Remarks":remarks,
      "VisterType":visterType,
      "OrderValue":orderValue,
      "QuaValue":quaValue,
      "ServicePlace":servicePlace,
      "Email":email,

    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insertEnquery'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }


  static Future<http.Response> insertMachine(formid,empId,cardCode, tabName,brandName,modelNo,mtrDetalies,itemcode,itemName,stock,qty,status,refDocNo,docStatus, isloading)
  async {
    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'insertMachine');
    var headers = {"Content-Type": "application/json"};
    var body = {

      "FormID": formid,
      "EmpId": empId,
      "CardCode": cardCode.toString(),
      "TabName": tabName,
      "BranName": brandName,
      "ModelNo":modelNo,
      "MtrDetalies":mtrDetalies,
      "ItemCode":itemcode,
      "ItemName":itemName,
      "Stock":stock,
      "Qty":qty,
      "RefDocNo":refDocNo,
      "DocStatus":docStatus,

    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insertMachine'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }

  static Future<http.Response> getDashBoardData(reportType,empId,cardCode,itemType,year,mn, isloading)
  async {
    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'getDashBoardData');
    var headers = {"Content-Type": "application/json"};
    var body = {

      "REPORTTYPE": reportType,
      "EMPID": empId,
      "CARDCODE": cardCode.toString(),
      "ITEMTYPE": itemType,
      "YER": year,
      "MN": mn,

    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'getDashBoardData'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }


  static Future<http.Response> getDashBoardDatafilter(formId,empId, isloading) async {
    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'getDashBoardDatafilter');
    var headers = {"Content-Type": "application/json"};
    var body = {

      "FormID": formId,
      "EmpID": empId,

    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'getDashBoardDatafilter'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }





}