class MachineSubData {
  int? status;
  List<Result>? result;

  MachineSubData({this.status, this.result});

  MachineSubData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  var docNo;
  String? empId;
  String? cardCode;
  String? tANNAME;
  String? bRANNAME;
  String? mADELNO;
  String? mRTDETALIES;
  String? iTEMCODE;
  String? iTEMNAME;
  String? sTOCK;
  String? qTY;
  String? sTATUS;
  var rEFDOCNO;
  String? rEDDOCNUM;

  Result(
      {this.docNo,
        this.empId,
        this.cardCode,
        this.tANNAME,
        this.bRANNAME,
        this.mADELNO,
        this.mRTDETALIES,
        this.iTEMCODE,
        this.iTEMNAME,
        this.sTOCK,
        this.qTY,
        this.sTATUS,
        this.rEFDOCNO,
        this.rEDDOCNUM});

  Result.fromJson(Map<String, dynamic> json) {
    docNo = json['DocNo'];
    empId = json['EmpId'];
    cardCode = json['CardCode'];
    tANNAME = json['TANNAME'];
    bRANNAME = json['BRANNAME'];
    mADELNO = json['MADELNO'];
    mRTDETALIES = json['MRTDETALIES'];
    iTEMCODE = json['ITEMCODE'];
    iTEMNAME = json['ITEMNAME'];
    sTOCK = json['STOCK'];
    qTY = json['QTY'];
    sTATUS = json['STATUS'];
    rEFDOCNO = json['REFDOCNO'];
    rEDDOCNUM = json['REDDOCNUM'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DocNo'] = this.docNo;
    data['EmpId'] = this.empId;
    data['CardCode'] = this.cardCode;
    data['TANNAME'] = this.tANNAME;
    data['BRANNAME'] = this.bRANNAME;
    data['MADELNO'] = this.mADELNO;
    data['MRTDETALIES'] = this.mRTDETALIES;
    data['ITEMCODE'] = this.iTEMCODE;
    data['ITEMNAME'] = this.iTEMNAME;
    data['STOCK'] = this.sTOCK;
    data['QTY'] = this.qTY;
    data['STATUS'] = this.sTATUS;
    data['REFDOCNO'] = this.rEFDOCNO;
    data['REDDOCNUM'] = this.rEDDOCNUM;
    return data;
  }
}
