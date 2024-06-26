class SalesQuationModel {
  int? status;
  List<Result>? result;

  SalesQuationModel({this.status, this.result});

  SalesQuationModel.fromJson(Map<String, dynamic> json) {
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
  int? series;
  String? seriesName;
  int? docNum;
  int? docEntry;
  String? docDate;
  String? cardCode;
  String? cardName;
  String? branch;
  String? itemCode;
  String? dscription;
  String? quantity;
  String? price;
  String? lineTotal;
  String? taxCode;
  String? vatSum;
  String? gTotal;
  String? whsCode;
  String? docStatus;

  Result(
      {this.series,
        this.seriesName,
        this.docNum,
        this.docEntry,
        this.docDate,
        this.cardCode,
        this.cardName,
        this.branch,
        this.itemCode,
        this.dscription,
        this.quantity,
        this.price,
        this.lineTotal,
        this.taxCode,
        this.vatSum,
        this.gTotal,
        this.whsCode,
        this.docStatus});

  Result.fromJson(Map<String, dynamic> json) {
    series = json['Series'];
    seriesName = json['SeriesName'];
    docNum = json['DocNum'];
    docEntry = json['DocEntry'];
    docDate = json['DocDate'];
    cardCode = json['CardCode'];
    cardName = json['CardName'];
    branch = json['Branch'];
    itemCode = json['ItemCode'];
    dscription = json['Dscription'];
    quantity = json['Quantity'];
    price = json['Price'];
    lineTotal = json['LineTotal'];
    taxCode = json['TaxCode'];
    vatSum = json['VatSum'];
    gTotal = json['GTotal'];
    whsCode = json['WhsCode'];
    docStatus = json['DocStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Series'] = this.series;
    data['SeriesName'] = this.seriesName;
    data['DocNum'] = this.docNum;
    data['DocEntry'] = this.docEntry;
    data['DocDate'] = this.docDate;
    data['CardCode'] = this.cardCode;
    data['CardName'] = this.cardName;
    data['Branch'] = this.branch;
    data['ItemCode'] = this.itemCode;
    data['Dscription'] = this.dscription;
    data['Quantity'] = this.quantity;
    data['Price'] = this.price;
    data['LineTotal'] = this.lineTotal;
    data['TaxCode'] = this.taxCode;
    data['VatSum'] = this.vatSum;
    data['GTotal'] = this.gTotal;
    data['WhsCode'] = this.whsCode;
    data['DocStatus'] = this.docStatus;
    return data;
  }
}
