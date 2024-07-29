import 'dart:convert';

ResponseFixture resposeFixtureFromJson(String str) => ResponseFixture.fromJson(json.decode(str));

String resposeFixtureToJson(ResponseFixture data) => json.encode(data.toJson());

class ResponseFixture {
    final String resposeFixtureGet;
    final Parameters parameters;
    final List<dynamic> errors;
    final int results;
    final Paging paging;
    final List<ResponseFixt> response;

    ResponseFixture({
        required this.resposeFixtureGet,
        required this.parameters,
        required this.errors,
        required this.results,
        required this.paging,
        required this.response,
    });

    factory ResponseFixture.fromJson(Map<String, dynamic> json) => ResponseFixture(
        resposeFixtureGet: json["get"],
        parameters: Parameters.fromJson(json["parameters"]),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        results: json["results"],
        paging: Paging.fromJson(json["paging"]),
        response: List<ResponseFixt>.from(json["response"].map((x) => ResponseFixt.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "get": resposeFixtureGet,
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
    final DateTime date;
    final String season;

    Parameters({
        required this.date,
        required this.season,
    });

    factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        date: DateTime.parse(json["date"]),
        season: json["season"],
    );

    Map<String, dynamic> toJson() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "season": season,
    };
}

class ResponseFixt {
    final Fixture fixture;
    final League league;
    final Teams teams;
    final Goals goals;
    final Score score;

    ResponseFixt({
        required this.fixture,
        required this.league,
        required this.teams,
        required this.goals,
        required this.score,
    });

    factory ResponseFixt.fromJson(Map<String, dynamic> json) => ResponseFixt(
        fixture: Fixture.fromJson(json["fixture"]),
        league: League.fromJson(json["league"]),
        teams: Teams.fromJson(json["teams"]),
        goals: Goals.fromJson(json["goals"]),
        score: Score.fromJson(json["score"]),
    );

    Map<String, dynamic> toJson() => {
        "fixture": fixture.toJson(),
        "league": league.toJson(),
        "teams": teams.toJson(),
        "goals": goals.toJson(),
        "score": score.toJson(),
    };
}

class Fixture {
    final int id;
    final String? referee;
    final Timezone timezone;
    final DateTime date;
    final int timestamp;
    final Periods periods;
    final Venue venue;
    final Status status;

    Fixture({
        required this.id,
        required this.referee,
        required this.timezone,
        required this.date,
        required this.timestamp,
        required this.periods,
        required this.venue,
        required this.status,
    });

    factory Fixture.fromJson(Map<String, dynamic> json) => Fixture(
        id: json["id"],
        referee: json["referee"],
        timezone: timezoneValues.map[json["timezone"]]!,
        date: DateTime.parse(json["date"]),
        timestamp: json["timestamp"],
        periods: Periods.fromJson(json["periods"]),
        venue: Venue.fromJson(json["venue"]),
        status: Status.fromJson(json["status"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "referee": referee,
        "timezone": timezoneValues.reverse[timezone],
        "date": date.toIso8601String(),
        "timestamp": timestamp,
        "periods": periods.toJson(),
        "venue": venue.toJson(),
        "status": status.toJson(),
    };
}

class Periods {
    final int? first;
    final int? second;

    Periods({
        required this.first,
        required this.second,
    });

    factory Periods.fromJson(Map<String, dynamic> json) => Periods(
        first: json["first"],
        second: json["second"],
    );

    Map<String, dynamic> toJson() => {
        "first": first,
        "second": second,
    };
}

class Status {
    final String long;
    final String short;
    final int? elapsed;

    Status({
        required this.long,
        required this.short,
        required this.elapsed,
    });

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        long:json["long"]??"",
        short: json["short"]??"",
        elapsed: json["elapsed"]??0,
    );

    Map<String, dynamic> toJson() => {
        "long": longValues.reverse[long],
        "short": shortValues.reverse[short],
        "elapsed": elapsed,
    };
}

enum Long {
    MATCH_CANCELLED,
    MATCH_FINISHED,
    MATCH_POSTPONED,
    NOT_STARTED
}

final longValues = EnumValues({
    "Match Cancelled": Long.MATCH_CANCELLED,
    "Match Finished": Long.MATCH_FINISHED,
    "Match Postponed": Long.MATCH_POSTPONED,
    "Not Started": Long.NOT_STARTED
});

enum Short {
    AET,
    CANC,
    FT,
    NS,
    PEN,
    PST
}

final shortValues = EnumValues({
    "AET": Short.AET,
    "CANC": Short.CANC,
    "FT": Short.FT,
    "NS": Short.NS,
    "PEN": Short.PEN,
    "PST": Short.PST
});

enum Timezone {
    UTC
}

final timezoneValues = EnumValues({
    "UTC": Timezone.UTC
});

class Venue {
    final int? id;
    final String? name;
    final String? city;

    Venue({
        required this.id,
        required this.name,
        required this.city,
    });

    factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["id"],
        name: json["name"],
        city: json["city"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
    };
}

class Goals {
    final int? home;
    final int? away;

    Goals({
        required this.home,
        required this.away,
    });

    factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        home: json["home"],
        away: json["away"],
    );

    Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
    };
}

class League {
    final int id;
    final String name;
    final String country;
    final String logo;
    final String? flag;
    final int season;
    final String round;

    League({
        required this.id,
        required this.name,
        required this.country,
        required this.logo,
        required this.flag,
        required this.season,
        required this.round,
    });

    factory League.fromJson(Map<String, dynamic> json) => League(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        logo: json["logo"],
        flag: json["flag"],
        season: json["season"],
        round: json["round"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "logo": logo,
        "flag": flag,
        "season": season,
        "round": round,
    };
}

class Score {
    final Goals halftime;
    final Goals fulltime;
    final Goals extratime;
    final Goals penalty;

    Score({
        required this.halftime,
        required this.fulltime,
        required this.extratime,
        required this.penalty,
    });

    factory Score.fromJson(Map<String, dynamic> json) => Score(
        halftime: Goals.fromJson(json["halftime"]),
        fulltime: Goals.fromJson(json["fulltime"]),
        extratime: Goals.fromJson(json["extratime"]),
        penalty: Goals.fromJson(json["penalty"]),
    );

    Map<String, dynamic> toJson() => {
        "halftime": halftime.toJson(),
        "fulltime": fulltime.toJson(),
        "extratime": extratime.toJson(),
        "penalty": penalty.toJson(),
    };
}

class Teams {
    final Away home;
    final Away away;

    Teams({
        required this.home,
        required this.away,
    });

    factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        home: Away.fromJson(json["home"]),
        away: Away.fromJson(json["away"]),
    );

    Map<String, dynamic> toJson() => {
        "home": home.toJson(),
        "away": away.toJson(),
    };
}

class Away {
    final int id;
    final String name;
    final String logo;
    final bool? winner;

    Away({
        required this.id,
        required this.name,
        required this.logo,
        required this.winner,
    });

    factory Away.fromJson(Map<String, dynamic> json) => Away(
        id: json["id"],
        name: json["name"]??"",
        logo: json["logo"]??"",
        winner: json["winner"]??false,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "winner": winner,
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