class LeaveReportModel {
  int? status;
  List<Result>? result;

  LeaveReportModel({this.status, this.result});

  LeaveReportModel.fromJson(Map<String, dynamic> json) {
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
  String? leaveType;
  String? leaveCode;
  String? noOfDays;
  String? comments;
  String? docDate;

  String? approval;
  String? empId;
  String? empName;
  var docNo;
  var status;

  Result({this.leaveType, this.leaveCode, this.noOfDays, this.comments,this.docDate,this.approval,this.empName,this.empId,this.docNo,this.status});

  Result.fromJson(Map<String, dynamic> json) {
    leaveType = json['LeaveType'];
    leaveCode = json['LeaveCode'];
    noOfDays = json['NoOfDays'];
    comments = json['Comments'];
    docDate = json['DocDate'];

    approval = json['Approval'];
    empId = json['EmpId'];
    empName = json['EmpName'];
    docNo = json['DocNo'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LeaveType'] = this.leaveType;
    data['LeaveCode'] = this.leaveCode;
    data['NoOfDays'] = this.noOfDays;
    data['Comments'] = this.comments;
    data['DocDate'] = this.docDate;

    data['Approval'] = this.approval;
    data['EmpId'] = this.empId;
    data['EmpName'] = this.empName;
    data['DocNo'] = this.docNo;
    data['Status'] = this.status;
    return data;
  }
}
