class DashBoardDatafilter {
  int? status;
  List<Result>? result;

  DashBoardDatafilter({this.status, this.result});

  DashBoardDatafilter.fromJson(Map<String, dynamic> json) {
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
  var code;
  var position;
  String? type;

  Result({this.code, this.position, this.type});

  Result.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    position = json['Position'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code'] = this.code;
    data['Position'] = this.position;
    data['Type'] = this.type;
    return data;
  }
}
