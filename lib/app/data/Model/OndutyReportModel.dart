class OndutyReportModel {
  int? status;
  List<Result>? result;

  OndutyReportModel({this.status, this.result});

  OndutyReportModel.fromJson(Map<String, dynamic> json) {
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
  String? ondutyType;
  String? fromDate;
  String? toDate;
  String? fromLoc;
  String? toLocation;
  String? fromTime;
  String? toTime;
  String? purpose;
  String? status;
  String? empId;
  String? empName;
  var docNo;

  Result(
      {this.ondutyType,
        this.fromDate,
        this.toDate,
        this.fromLoc,
        this.toLocation,
        this.fromTime,
        this.toTime,
        this.purpose,this.status,this.empId,this.empName,this.docNo});

  Result.fromJson(Map<String, dynamic> json) {
    ondutyType = json['OndutyType'];
    fromDate = json['FromDate'];
    toDate = json['ToDate'];
    fromLoc = json['FromLoc'];
    toLocation = json['ToLocation'];
    fromTime = json['FromTime'];
    toTime = json['ToTime'];
    purpose = json['Purpose'];
    status = json['Status'];
    empId = json['EmpId'];
    empName = json['EmpName'];
    docNo = json['DocNo'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OndutyType'] = this.ondutyType;
    data['FromDate'] = this.fromDate;
    data['ToDate'] = this.toDate;
    data['FromLoc'] = this.fromLoc;
    data['ToLocation'] = this.toLocation;
    data['FromTime'] = this.fromTime;
    data['ToTime'] = this.toTime;
    data['Purpose'] = this.purpose;
    data['Status'] = this.status;
    data['EmpId'] = this.empId;
    data['EmpName'] = this.empName;
    data['DocNo'] = this.docNo;
    return data;
  }
}
