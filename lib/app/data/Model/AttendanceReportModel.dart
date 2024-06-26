class AttendanceReportModel {
  int? status;
  List<Result>? result;

  AttendanceReportModel({this.status, this.result});

  AttendanceReportModel.fromJson(Map<String, dynamic> json) {
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
  String? empId;
  String? fromPlace;
  String? toPlace;
  String? locType;
  String? fromTime;
  String? toTime;
  String? finalStatus;
  String? docDate;

  Result(
      {this.empId,
        this.fromPlace,
        this.toPlace,
        this.locType,
        this.fromTime,
        this.toTime,
        this.finalStatus,
        this.docDate});

  Result.fromJson(Map<String, dynamic> json) {
    empId = json['EmpId'];
    fromPlace = json['FromPlace'];
    toPlace = json['ToPlace'];
    locType = json['LocType'];
    fromTime = json['FromTime'];
    toTime = json['ToTime'];
    finalStatus = json['FinalStatus'];
    docDate = json['DocDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EmpId'] = this.empId;
    data['FromPlace'] = this.fromPlace;
    data['ToPlace'] = this.toPlace;
    data['LocType'] = this.locType;
    data['FromTime'] = this.fromTime;
    data['ToTime'] = this.toTime;
    data['FinalStatus'] = this.finalStatus;
    data['DocDate'] = this.docDate;
    return data;
  }
}
