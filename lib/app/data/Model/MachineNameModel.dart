class MachineNameModel {
  int? status;
  List<Result>? result;

  MachineNameModel({this.status, this.result});

  MachineNameModel.fromJson(Map<String, dynamic> json) {
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
  String? machineCode;
  String? machineName;

  Result({this.machineCode, this.machineName});

  Result.fromJson(Map<String, dynamic> json) {
    machineCode = json['MachineCode'];
    machineName = json['MachineName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MachineCode'] = this.machineCode;
    data['MachineName'] = this.machineName;
    return data;
  }
}
