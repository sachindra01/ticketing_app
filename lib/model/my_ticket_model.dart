// To parse this JSON data, do
//
//     final myTicketModel = myTicketModelFromJson(jsonString);

import 'dart:convert';

MyTicketModel myTicketModelFromJson(String str) => MyTicketModel.fromJson(json.decode(str));

String myTicketModelToJson(MyTicketModel data) => json.encode(data.toJson());

class MyTicketModel {
    MyTicketModel({
        required this.code,
        required this.message,
        required this.data,
    });

    String code;
    String message;
    Data data;

    factory MyTicketModel.fromJson(Map<String, dynamic> json) => MyTicketModel(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.dist,
    });

    Dist dist;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        dist: Dist.fromJson(json["dist"]),
    );

    Map<String, dynamic> toJson() => {
        "dist": dist.toJson(),
    };
}

class Dist {
    Dist({
        required this.day,
        required this.week,
        required this.month,
        required this.year,
    });

    List<Day> day;
    List<Day> week;
    List<Day> month;
    List<Day> year;

    factory Dist.fromJson(Map<String, dynamic> json) => Dist(
        day: List<Day>.from(json["day"].map((x) => Day.fromJson(x))),
        week: List<Day>.from(json["week"].map((x) => Day.fromJson(x))),
        month: List<Day>.from(json["month"].map((x) => Day.fromJson(x))),
        year: List<Day>.from(json["year"].map((x) => Day.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "day": List<dynamic>.from(day.map((x) => x.toJson())),
        "week": List<dynamic>.from(week.map((x) => x.toJson())),
        "month": List<dynamic>.from(month.map((x) => x.toJson())),
        "year": List<dynamic>.from(year.map((x) => x.toJson())),
    };
}

class Day {
    Day({
        required this.label,
        this.value,
    });

    String label;
    String? value;

    factory Day.fromJson(Map<String, dynamic> json) => Day(
        label: json["label"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
    };
}
