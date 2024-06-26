class EmpDataModel {
  int? status;
  List<Result>? result;

  EmpDataModel({this.status, this.result});

  EmpDataModel.fromJson(Map<String, dynamic> json) {
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
  int? empCode;
  String? empName;

  Result({this.empCode, this.empName});

  Result.fromJson(Map<String, dynamic> json) {
    empCode = json['EmpCode'];
    empName = json['EmpName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EmpCode'] = this.empCode;
    data['EmpName'] = this.empName;
    return data;
  }
}
