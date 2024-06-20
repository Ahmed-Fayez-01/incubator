class CasesModel {
  String? status;
  Data? data;

  CasesModel({this.status, this.data});

  CasesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  List<Cases>? cases;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['cases'] != null) {
      cases = <Cases>[];
      json['cases'].forEach((v) {
        cases!.add( Cases.fromJson(v));
      });
    }
  }

}

class Cases {
  String? sId;
  String? userId;
  String? fullName;
  int? code;
  String? disease;
  int? age;
  String? date;

  Cases(
      {this.sId,
        this.userId,
        this.fullName,
        this.code,
        this.disease,
        this.age,
        this.date,
        });

  Cases.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    fullName = json['fullName'];
    code = json['code'];
    disease = json['disease'];
    age = json['age'];
    date = json['date'];
  }

}