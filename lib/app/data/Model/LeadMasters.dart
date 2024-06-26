class LeadMasters {
  int? status;
  List<Result>? result;

  LeadMasters({this.status, this.result});

  LeadMasters.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? name;
  var type;
  var type1;

  Result({this.name, this.type});

  Result.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    type = json['Type'];
    type1 = json['Type1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = this.name;
    data['Type'] = this.type;
    data['Type1'] = this.type1;
    return data;
  }
}
