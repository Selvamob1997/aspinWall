class PermisionReportModel {
  int? status;
  List<Result>? result;

  PermisionReportModel({this.status, this.result});

  PermisionReportModel.fromJson(Map<String, dynamic> json) {
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
  String? fromDate;
  String? fromTime;
  String? toTime;
  String? totalTime;
  String? purposeVisit;
  String? status;
  String? empId;
  String? empName;

  Result(
      {this.docNo,
        this.fromDate,
        this.fromTime,
        this.toTime,
        this.totalTime,
        this.purposeVisit,this.status,this.empId,this.empName});

  Result.fromJson(Map<String, dynamic> json) {
    docNo = json['DocNo'];
    fromDate = json['FromDate'];
    fromTime = json['FromTime'];
    toTime = json['ToTime'];
    totalTime = json['TotalTime'];
    purposeVisit = json['PurposeVisit'];
    status = json['Status'];
    empId = json['EmpId'];
    empName = json['EmpName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DocNo'] = this.docNo;
    data['FromDate'] = this.fromDate;
    data['FromTime'] = this.fromTime;
    data['ToTime'] = this.toTime;
    data['TotalTime'] = this.totalTime;
    data['PurposeVisit'] = this.purposeVisit;
    data['Status'] = this.status;
    data['EmpId'] = this.empId;
    data['EmpName'] = this.empName;
    return data;
  }
}
