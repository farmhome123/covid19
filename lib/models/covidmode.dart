// To parse this JSON data, do
//
//     final covid19 = covid19FromJson(jsonString);

import 'dart:convert';

List<Covid19> covid19FromJson(String str) =>
    List<Covid19>.from(json.decode(str).map((x) => Covid19.fromJson(x)));

String covid19ToJson(List<Covid19> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Covid19 {
  Covid19({
    required this.txnDate,
    required this.province,
    required this.newCase,
    required this.totalCase,
    required this.newCaseExcludeabroad,
    required this.totalCaseExcludeabroad,
    required this.newDeath,
    required this.totalDeath,
    required this.updateDate,
  });

  final DateTime txnDate;
  final String province;
  final int newCase;
  final int totalCase;
  final int newCaseExcludeabroad;
  final int totalCaseExcludeabroad;
  final int newDeath;
  final int totalDeath;
  final DateTime? updateDate;

  factory Covid19.fromJson(Map<String, dynamic> json) => Covid19(
        txnDate: DateTime.parse(json["txn_date"]),
        province: json["province"] == null ? null : json["province"],
        newCase: json["new_case"] == null ? null : json["new_case"],
        totalCase: json["total_case"] == null ? null : json["total_case"],
        newCaseExcludeabroad: json["new_case_excludeabroad"] == null
            ? null
            : json["new_case_excludeabroad"],
        totalCaseExcludeabroad: json["total_case_excludeabroad"] == null
            ? null
            : json["total_case_excludeabroad"],
        newDeath: json["new_death"] == null ? null : json["new_death"],
        totalDeath: json["total_death"] == null ? null : json["total_death"],
        updateDate: json["update_date"] == null
            ? null
            : DateTime.parse(json["update_date"]),
      );

  Map<String, dynamic> toJson() => {
        "txn_date": txnDate == null
            ? null
            : "${txnDate.year.toString().padLeft(4, '0')}-${txnDate.month.toString().padLeft(2, '0')}-${txnDate.day.toString().padLeft(2, '0')}",
        "province": province == null ? null : province,
        "new_case": newCase == null ? null : newCase,
        "total_case": totalCase == null ? null : totalCase,
        "new_case_excludeabroad":
            newCaseExcludeabroad == null ? null : newCaseExcludeabroad,
        "total_case_excludeabroad":
            totalCaseExcludeabroad == null ? null : totalCaseExcludeabroad,
        "new_death": newDeath == null ? null : newDeath,
        "total_death": totalDeath == null ? null : totalDeath,
        "update_date":
            updateDate == null ? null : updateDate?.toIso8601String(),
      };
}
