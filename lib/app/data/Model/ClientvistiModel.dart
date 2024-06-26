class ClientvistiModel {
  int? status;
  List<Result>? result;

  ClientvistiModel({this.status, this.result});

  ClientvistiModel.fromJson(Map<String, dynamic> json) {
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
  String? cardName;
  String? firstName;
  String? empId;
  String? inTime;
  String? outTime;
  String? fromAdress;
  String? tOAddress;
  String? status;
  String? Remarks;

  Result(
      {this.cardName,
        this.firstName,
        this.empId,
        this.inTime,
        this.outTime,
        this.fromAdress,
        this.tOAddress,
        this.status,this.Remarks});

  Result.fromJson(Map<String, dynamic> json) {
    cardName = json['CardName'];
    firstName = json['firstName'];
    empId = json['EmpId'];
    inTime = json['InTime'];
    outTime = json['OutTime'];
    fromAdress = json['FromAdress'];
    tOAddress = json['TOAddress'];
    status = json['Status'];
    Remarks = json['Remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CardName'] = this.cardName;
    data['firstName'] = this.firstName;
    data['EmpId'] = this.empId;
    data['InTime'] = this.inTime;
    data['OutTime'] = this.outTime;
    data['FromAdress'] = this.fromAdress;
    data['TOAddress'] = this.tOAddress;
    data['Status'] = this.status;
    data['Remarks'] = this.Remarks;
    return data;
  }
}
