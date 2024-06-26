class ItemMasterModel {
  int? status;
  List<Result>? result;

  ItemMasterModel({this.status, this.result});

  ItemMasterModel.fromJson(Map<String, dynamic> json) {
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
  String? itemCode;
  String? itemName;
  String? forigenName;
  String? stock;

  Result({this.itemCode, this.itemName, this.forigenName, this.stock});

  Result.fromJson(Map<String, dynamic> json) {
    itemCode = json['ItemCode'];
    itemName = json['ItemName'];
    forigenName = json['ForigenName'];
    stock = json['Stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ItemCode'] = this.itemCode;
    data['ItemName'] = this.itemName;
    data['ForigenName'] = this.forigenName;
    data['Stock'] = this.stock;
    return data;
  }
}
