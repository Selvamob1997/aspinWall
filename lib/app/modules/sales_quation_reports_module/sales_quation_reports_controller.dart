import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../data/Model/SalesQuationModel.dart';
import '../../data/repository/_allAPIList.dart';
import '../../utils/Utilites.dart';


class SalesQuationReportsController extends GetxController{




  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';

  late SalesQuationModel rawSalesQuationModel;
  List<ScreenDataList> secScreenDataList=[];

  @override
  void onInit() {
    // TODO: implement onInit
    getStringValuesSF();
    update();
    super.onInit();
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sessionUseId  =   prefs.getString('UserID').toString();
    sessionName = prefs.getString('FirstName').toString();
    sessionDeptCode = prefs.getString('DeptCode').toString();
    sessionDeptName = prefs.getString('DeptName').toString();
    getScreedata();
    update();

  }

  getScreedata(){

    Allapi.getAllReports(1, "0", "O", "", sessionUseId, "docEntry", true).then((value) => {
      if(value.statusCode==200){
        Utilities.closeLoader(),
        update(),
        log(value.body),
        if(jsonDecode(value.body)['status'].toString() == "0"){

        }else{
          rawSalesQuationModel = SalesQuationModel.fromJson(jsonDecode(value.body)),
          for(int k=0;k<rawSalesQuationModel.result!.length;k++){

            secScreenDataList.add(
                ScreenDataList(
                  rawSalesQuationModel.result![k].series,
                  rawSalesQuationModel.result![k].seriesName,
                  rawSalesQuationModel.result![k].docNum,
                  rawSalesQuationModel.result![k].docEntry,
                  rawSalesQuationModel.result![k].docDate,
                  rawSalesQuationModel.result![k].cardCode,
                  rawSalesQuationModel.result![k].cardName,
                  rawSalesQuationModel.result![k].branch,
                  rawSalesQuationModel.result![k].itemCode,
                  rawSalesQuationModel.result![k].dscription,
                  rawSalesQuationModel.result![k].quantity,
                  rawSalesQuationModel.result![k].price,
                  rawSalesQuationModel.result![k].lineTotal,
                  rawSalesQuationModel.result![k].taxCode,
                  rawSalesQuationModel.result![k].vatSum,
                  rawSalesQuationModel.result![k].gTotal,
                  rawSalesQuationModel.result![k].whsCode,
                  rawSalesQuationModel.result![k].docStatus,
                )
            ),

          },
          update(),

        }

      }
    });

  }
}


class ScreenDataList {
  int? series;
  String? seriesName;
  int? docNum;
  int? docEntry;
  String? docDate;
  String? cardCode;
  String? cardName;
  String? branch;
  String? itemCode;
  String? dscription;
  String? quantity;
  String? price;
  String? lineTotal;
  String? taxCode;
  String? vatSum;
  String? gTotal;
  String? whsCode;
  String? docStatus;

  ScreenDataList(
      this.series,
        this.seriesName,
        this.docNum,
        this.docEntry,
        this.docDate,
        this.cardCode,
        this.cardName,
        this.branch,
        this.itemCode,
        this.dscription,
        this.quantity,
        this.price,
        this.lineTotal,
        this.taxCode,
        this.vatSum,
        this.gTotal,
        this.whsCode,
        this.docStatus);


}
