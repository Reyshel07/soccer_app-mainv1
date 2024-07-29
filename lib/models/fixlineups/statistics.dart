// To parse this JSON data, do
//
//     final resposeStatistics = resposeStatisticsFromJson(jsonString);

import 'dart:convert';

ResponseStatistics resposeStatisticsFromJson(String str) => ResponseStatistics.fromJson(json.decode(str));

String resposeStatisticsToJson(ResponseStatistics data) => json.encode(data.toJson());

class ResponseStatistics {
    final String resposeStatisticsGet;
    final Parameters parameters;
    final List<dynamic> errors;
    final int results;
    final Paging paging;
    final List<ResponseSta> response;

    ResponseStatistics({
        required this.resposeStatisticsGet,
        required this.parameters,
        required this.errors,
        required this.results,
        required this.paging,
        required this.response,
    });

    factory ResponseStatistics.fromJson(Map<String, dynamic> json) => ResponseStatistics(
        resposeStatisticsGet: json["get"],
        parameters: Parameters.fromJson(json["parameters"]),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        results: json["results"],
        paging: Paging.fromJson(json["paging"]),
        response: List<ResponseSta>.from(json["response"].map((x) => ResponseSta.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "get": resposeStatisticsGet,
        "parameters": parameters.toJson(),
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "results": results,
        "paging": paging.toJson(),
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
    };
}

class Paging {
    final int current;
    final int total;

    Paging({
        required this.current,
        required this.total,
    });

    factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        current: json["current"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current": current,
        "total": total,
    };
}

class Parameters {
    final String fixture;

    Parameters({
        required this.fixture,
    });

    factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        fixture: json["fixture"],
    );

    Map<String, dynamic> toJson() => {
        "fixture": fixture,
    };
}

class ResponseSta {
    final Team team;
    final List<Statistic> statistics;

    ResponseSta({
        required this.team,
        required this.statistics,
    });

    factory ResponseSta.fromJson(Map<String, dynamic> json) => ResponseSta(
        team: Team.fromJson(json["team"]),
        statistics: List<Statistic>.from(json["statistics"].map((x) => Statistic.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "team": team.toJson(),
        "statistics": List<dynamic>.from(statistics.map((x) => x.toJson())),
    };
}

class Statistic {
    final String type;
    final dynamic value;

    Statistic({
        required this.type,
        required this.value,
    });

    factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
        type: json["type"],
        value: json["value"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
    };
}

class Team {
    final int id;
    final String name;
    final String logo;

    Team({
        required this.id,
        required this.name,
        required this.logo,
    });

    factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
    };
}
