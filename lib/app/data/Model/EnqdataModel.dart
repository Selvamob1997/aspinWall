class EnqdataModel {
  int? status;
  List<Result>? result;

  EnqdataModel({this.status, this.result});

  EnqdataModel.fromJson(Map<String, dynamic> json) {
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
  int? enqNo;
  String? cardCode;
  String? cardName;
  int? contactPerson;
  String? enqDate;

  Result(
      {this.enqNo,
        this.cardCode,
        this.cardName,
        this.contactPerson,
        this.enqDate});

  Result.fromJson(Map<String, dynamic> json) {
    enqNo = json['EnqNo'];
    cardCode = json['CardCode'];
    cardName = json['CardName'];
    contactPerson = json['ContactPerson'];
    enqDate = json['EnqDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EnqNo'] = this.enqNo;
    data['CardCode'] = this.cardCode;
    data['CardName'] = this.cardName;
    data['ContactPerson'] = this.contactPerson;
    data['EnqDate'] = this.enqDate;
    return data;
  }
}
