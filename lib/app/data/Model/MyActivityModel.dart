class MyActivityModel {
  int? status;
  List<Result>? result;

  MyActivityModel({this.status, this.result});

  MyActivityModel.fromJson(Map<String, dynamic> json) {
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
  String? screenName;
  String? type;
  var docNo;
  String? cardName;
  String? contactPerson;
  String? contactNo;
  String? remarks;

  Result(
      {this.screenName,
        this.type,
        this.docNo,
        this.cardName,
        this.contactPerson,
        this.contactNo,
        this.remarks});

  Result.fromJson(Map<String, dynamic> json) {
    screenName = json['ScreenName'];
    type = json['Type'];
    docNo = json['DocNo'];
    cardName = json['CardName'];
    contactPerson = json['ContactPerson'];
    contactNo = json['ContactNo'];
    remarks = json['Remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ScreenName'] = this.screenName;
    data['Type'] = this.type;
    data['DocNo'] = this.docNo;
    data['CardName'] = this.cardName;
    data['ContactPerson'] = this.contactPerson;
    data['ContactNo'] = this.contactNo;
    data['Remarks'] = this.remarks;
    return data;
  }
}
