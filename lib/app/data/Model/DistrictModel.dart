class DistrictModel {
  int? status;
  List<Result>? result;

  DistrictModel({this.status, this.result});

  DistrictModel.fromJson(Map<String, dynamic> json) {
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
  String? code;
  String? name;
  String? uState;
  String? uState1;
  String? uDistNo;
  String? uStartNo;
  String? uNextNo;
  String? uZone;
  String? uRegion;

  Result(
      {this.code,
        this.name,
        this.uState,
        this.uState1,
        this.uDistNo,
        this.uStartNo,
        this.uNextNo,
        this.uZone,
        this.uRegion});

  Result.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    name = json['Name'];
    uState = json['U_State'];
    uState1 = json['U_State1'];
    uDistNo = json['U_DistNo'];
    uStartNo = json['U_StartNo'];
    uNextNo = json['U_NextNo'];
    uZone = json['U_zone'];
    uRegion = json['U_Region'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code'] = this.code;
    data['Name'] = this.name;
    data['U_State'] = this.uState;
    data['U_State1'] = this.uState1;
    data['U_DistNo'] = this.uDistNo;
    data['U_StartNo'] = this.uStartNo;
    data['U_NextNo'] = this.uNextNo;
    data['U_zone'] = this.uZone;
    data['U_Region'] = this.uRegion;
    return data;
  }
}
