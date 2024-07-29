import 'dart:convert';

import 'package:soccer_app/models/league/league_model.dart';

ResponseLeague responseLeagueFromJson(String str) => ResponseLeague.fromJson(json.decode(str));

String responseLeagueToJson(ResponseLeague data) => json.encode(data.toJson());

class ResponseLeague {
    final String responseLeagueGet;
    final List<dynamic> parameters;
    final List<dynamic> errors;
    final int results;
    final Paging paging;
    final List<ResponseAllLeague> response;

    ResponseLeague({
        required this.responseLeagueGet,
        required this.parameters,
        required this.errors,
        required this.results,
        required this.paging,
        required this.response,
    });

    factory ResponseLeague.fromJson(Map<String, dynamic> json) => ResponseLeague(
        responseLeagueGet: json["get"],
        parameters: List<dynamic>.from(json["parameters"].map((x) => x)),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        results: json["results"],
        paging: Paging.fromJson(json["paging"]),
        response: List<ResponseAllLeague>.from(json["response"].map((x) => ResponseAllLeague.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "get": responseLeagueGet,
        "parameters": List<dynamic>.from(parameters.map((x) => x)),
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

class ResponseAllLeague {
    final League league;
    final Country country;
    final List<Season> seasons;

    ResponseAllLeague({
        required this.league,
        required this.country,
        required this.seasons,
    });

    factory ResponseAllLeague.fromJson(Map<String, dynamic> json) => ResponseAllLeague(
        league: League.fromJson(json["league"]),
        country: Country.fromJson(json["country"]),
        seasons: List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "league": league.toJson(),
        "country": country.toJson(),
        "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
    };
}


class Coverage {
    final Fixtures fixtures;
    final bool standings;
    final bool players;
    final bool topScorers;
    final bool topAssists;
    final bool topCards;
    final bool injuries;
    final bool predictions;
    final bool odds;

    Coverage({
        required this.fixtures,
        required this.standings,
        required this.players,
        required this.topScorers,
        required this.topAssists,
        required this.topCards,
        required this.injuries,
        required this.predictions,
        required this.odds,
    });

    factory Coverage.fromJson(Map<String, dynamic> json) => Coverage(
        fixtures: Fixtures.fromJson(json["fixtures"]),
        standings: json["standings"],
        players: json["players"],
        topScorers: json["top_scorers"],
        topAssists: json["top_assists"],
        topCards: json["top_cards"],
        injuries: json["injuries"],
        predictions: json["predictions"],
        odds: json["odds"],
    );

    Map<String, dynamic> toJson() => {
        "fixtures": fixtures.toJson(),
        "standings": standings,
        "players": players,
        "top_scorers": topScorers,
        "top_assists": topAssists,
        "top_cards": topCards,
        "injuries": injuries,
        "predictions": predictions,
        "odds": odds,
    };
}

class Fixtures {
    final bool events;
    final bool lineups;
    final bool statisticsFixtures;
    final bool statisticsPlayers;

    Fixtures({
        required this.events,
        required this.lineups,
        required this.statisticsFixtures,
        required this.statisticsPlayers,
    });

    factory Fixtures.fromJson(Map<String, dynamic> json) => Fixtures(
        events: json["events"],
        lineups: json["lineups"],
        statisticsFixtures: json["statistics_fixtures"],
        statisticsPlayers: json["statistics_players"],
    );

    Map<String, dynamic> toJson() => {
        "events": events,
        "lineups": lineups,
        "statistics_fixtures": statisticsFixtures,
        "statistics_players": statisticsPlayers,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
