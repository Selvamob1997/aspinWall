class AuditMasterModel {
  int? status;
  List<Result>? result;

  AuditMasterModel({this.status, this.result});

  AuditMasterModel.fromJson(Map<String, dynamic> json) {
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
  int? headerDocEntry;
  int? docEntry;
  String? machBrand;
  String? modelNo;
  String? matDetail;
  String? tab;
  String? tabName;

  Result(
      {this.headerDocEntry,
        this.docEntry,
        this.machBrand,
        this.modelNo,
        this.matDetail,
        this.tab,
        this.tabName});

  Result.fromJson(Map<String, dynamic> json) {
    headerDocEntry = json['HeaderDocEntry'];
    docEntry = json['DocEntry'];
    machBrand = json['MachBrand'];
    modelNo = json['ModelNo'];
    matDetail = json['MatDetail'];
    tab = json['Tab'];
    tabName = json['TabName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['HeaderDocEntry'] = this.headerDocEntry;
    data['DocEntry'] = this.docEntry;
    data['MachBrand'] = this.machBrand;
    data['ModelNo'] = this.modelNo;
    data['MatDetail'] = this.matDetail;
    data['Tab'] = this.tab;
    data['TabName'] = this.tabName;
    return data;
  }
}
