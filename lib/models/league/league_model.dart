
import 'package:soccer_app/models/league/league_model_response.dart';

class Country {
    final String name;
    final String? code;
    final String? flag;

    Country({
        required this.name,
        required this.code,
        required this.flag,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        code: json["code"],
        flag: json["flag"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "flag": flag,
    };
}

class League {
    final int id;
    final String name;
    final Type type;
    final String logo;

    League({
        required this.id,
        required this.name,
        required this.type,
        required this.logo,
    });

    factory League.fromJson(Map<String, dynamic> json) => League(
        id: json["id"],
        name: json["name"],
        type: typeValues.map[json["type"]]!,
        logo: json["logo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": typeValues.reverse[type],
        "logo": logo,
    };
}

enum Type {
    CUP,
    LEAGUE
}

final typeValues = EnumValues({
    "Cup": Type.CUP,
    "League": Type.LEAGUE
});

class Season {
    final int year;
    final DateTime start;
    final DateTime end;
    final bool current;
    final Coverage coverage;

    Season({
        required this.year,
        required this.start,
        required this.end,
        required this.current,
        required this.coverage,
    });

    factory Season.fromJson(Map<String, dynamic> json) => Season(
        year: json["year"],
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
        current: json["current"],
        coverage: Coverage.fromJson(json["coverage"]),
    );

    Map<String, dynamic> toJson() => {
        "year": year,
        "start": "${start.year.toString().padLeft(4, '0')}-${start.month.toString().padLeft(2, '0')}-${start.day.toString().padLeft(2, '0')}",
        "end": "${end.year.toString().padLeft(4, '0')}-${end.month.toString().padLeft(2, '0')}-${end.day.toString().padLeft(2, '0')}",
        "current": current,
        "coverage": coverage.toJson(),
    };
}