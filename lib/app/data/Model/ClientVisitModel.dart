class ClientVisitModel {
  int? status;
  List<Result>? result;

  ClientVisitModel({this.status, this.result});

  ClientVisitModel.fromJson(Map<String, dynamic> json) {
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
  String? inTime;
  String? outTime;
  String? fromAdd;
  String? toAdd;
  String? docDate;
  String? CardName;
  String? Type;

  Result({this.inTime, this.outTime, this.fromAdd, this.toAdd, this.docDate,this.CardName,this.Type});

  Result.fromJson(Map<String, dynamic> json) {
    inTime = json['InTime'];
    outTime = json['OutTime'];
    fromAdd = json['FromAdd'];
    toAdd = json['ToAdd'];
    docDate = json['DocDate'];
    CardName = json['CardName'];
    Type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['InTime'] = this.inTime;
    data['OutTime'] = this.outTime;
    data['FromAdd'] = this.fromAdd;
    data['ToAdd'] = this.toAdd;
    data['DocDate'] = this.docDate;
    data['CardName'] = this.CardName;
    data['Type'] = this.Type;
    return data;
  }
}
