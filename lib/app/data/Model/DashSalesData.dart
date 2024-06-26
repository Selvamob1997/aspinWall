class DashSalesData {
  int? status;
  List<Result>? result;

  DashSalesData({this.status, this.result});

  DashSalesData.fromJson(Map<String, dynamic> json) {
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
  String? cardCode;
  String? cardName;
  String? totalPending;
  String? overDue;
  String? overDueAbove60Days;
  var Target;
  var Achived;
  var ShortFall;
  var Completed;
  var Pending;
  var Total;

  Result(
      {this.cardCode,
        this.cardName,
        this.totalPending,
        this.overDue,
        this.overDueAbove60Days,this.Target,this.Achived,this.ShortFall,this.Completed,this.Pending,this.Total});

  Result.fromJson(Map<String, dynamic> json) {
    cardCode = json['CardCode'];
    cardName = json['CardName'];
    totalPending = json['Total Pending'];
    overDue = json['Over Due'];
    overDueAbove60Days = json['Over Due Above 60 Days'];
    Target = json['Target'];
    Achived = json['Achived'];
    ShortFall = json['ShortFall'];
    Completed = json['Completed'];
    Pending = json['Pending'];
    Total = json['Total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CardCode'] = this.cardCode;
    data['CardName'] = this.cardName;
    data['Total Pending'] = this.totalPending;
    data['Over Due'] = this.overDue;
    data['Over Due Above 60 Days'] = this.overDueAbove60Days;
    data['Target'] = this.Target;
    data['Achived'] = this.Achived;
    data['ShortFall'] = this.ShortFall;
    data['Completed'] = this.Completed;
    data['Pending'] = this.Pending;
    data['Total'] = this.Total;
    return data;
  }
}
