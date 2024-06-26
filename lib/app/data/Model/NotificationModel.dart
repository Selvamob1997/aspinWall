class NotificationModel {
  int? status;
  List<Result>? result;

  NotificationModel({this.status, this.result});

  NotificationModel.fromJson(Map<String, dynamic> json) {
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
  String? docNo;
  String? satus;
  int? position;

  Result({this.screenName, this.docNo, this.satus, this.position});

  Result.fromJson(Map<String, dynamic> json) {
    screenName = json['ScreenName'];
    docNo = json['DocNo'];
    satus = json['Satus'];
    position = json['Position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ScreenName'] = this.screenName;
    data['DocNo'] = this.docNo;
    data['Satus'] = this.satus;
    data['Position'] = this.position;
    return data;
  }
}
