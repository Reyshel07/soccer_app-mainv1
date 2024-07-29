import 'dart:convert';

ResponseLineups responseLineupsFromJson(String str) => ResponseLineups.fromJson(json.decode(str));

String responseLineupsToJson(ResponseLineups data) => json.encode(data.toJson());

class ResponseLineups {
    final String resposeLineupsGet;
    final Parameters parameters;
    final List<dynamic> errors;
    final int results;
    final Paging paging;
    final List<ResponseLine> response;

    ResponseLineups({
        required this.resposeLineupsGet,
        required this.parameters,
        required this.errors,
        required this.results,
        required this.paging,
        required this.response,
    });

    factory ResponseLineups.fromJson(Map<String, dynamic> json) => ResponseLineups(
        resposeLineupsGet: json["get"],
        parameters: Parameters.fromJson(json["parameters"]),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        results: json["results"],
        paging: Paging.fromJson(json["paging"]),
        response: List<ResponseLine>.from(json["response"].map((x) => ResponseLine.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "get": resposeLineupsGet,
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

class ResponseLine {
    final Team team;
    final String formation;
    final List<StartXi> startXi;
    final List<StartXi> substitutes;
    final Coach coach;

    ResponseLine({
        required this.team,
        required this.formation,
        required this.startXi,
        required this.substitutes,
        required this.coach,
    });

    factory ResponseLine.fromJson(Map<String, dynamic> json) => ResponseLine(
        team: Team.fromJson(json["team"]),
        formation: json["formation"],
        startXi: List<StartXi>.from(json["startXI"].map((x) => StartXi.fromJson(x))),
        substitutes: List<StartXi>.from(json["substitutes"].map((x) => StartXi.fromJson(x))),
        coach: Coach.fromJson(json["coach"]),
    );

    Map<String, dynamic> toJson() => {
        "team": team.toJson(),
        "formation": formation,
        "startXI": List<dynamic>.from(startXi.map((x) => x.toJson())),
        "substitutes": List<dynamic>.from(substitutes.map((x) => x.toJson())),
        "coach": coach.toJson(),
    };
}

class Coach {
    final int id;
    final String name;
    final String photo;

    Coach({
        required this.id,
        required this.name,
        required this.photo,
    });

    factory Coach.fromJson(Map<String, dynamic> json) => Coach(
        id: json["id"],
        name: json["name"],
        photo: json["photo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "photo": photo,
    };
}

class StartXi {
    final Player player;

    StartXi({
        required this.player,
    });

    factory StartXi.fromJson(Map<String, dynamic> json) => StartXi(
        player: Player.fromJson(json["player"]),
    );

    Map<String, dynamic> toJson() => {
        "player": player.toJson(),
    };
}

class Player {
    final int id;
    final String name;
    final int number;
    final Pos pos;
    final String? grid;

    Player({
        required this.id,
        required this.name,
        required this.number,
        required this.pos,
        required this.grid,
    });

    factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        name: json["name"],
        number: json["number"],
        pos: posValues.map[json["pos"]]!,
        grid: json["grid"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "number": number,
        "pos": posValues.reverse[pos],
        "grid": grid,
    };
}

enum Pos {
    D,
    F,
    G,
    M
}

final posValues = EnumValues({
    "D": Pos.D,
    "F": Pos.F,
    "G": Pos.G,
    "M": Pos.M
});

class Team {
    final int id;
    final String name;
    final String logo;
    final Colors colors;

    Team({
        required this.id,
        required this.name,
        required this.logo,
        required this.colors,
    });

    factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        colors: Colors.fromJson(json["colors"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "colors": colors.toJson(),
    };
}

class Colors {
    final Goalkeeper player;
    final Goalkeeper goalkeeper;

    Colors({
        required this.player,
        required this.goalkeeper,
    });

    factory Colors.fromJson(Map<String, dynamic> json) => Colors(
        player: Goalkeeper.fromJson(json["player"]),
        goalkeeper: Goalkeeper.fromJson(json["goalkeeper"]),
    );

    Map<String, dynamic> toJson() => {
        "player": player.toJson(),
        "goalkeeper": goalkeeper.toJson(),
    };
}

class Goalkeeper {
    final String primary;
    final String number;
    final String border;

    Goalkeeper({
        required this.primary,
        required this.number,
        required this.border,
    });

    factory Goalkeeper.fromJson(Map<String, dynamic> json) => Goalkeeper(
        primary: json["primary"],
        number: json["number"],
        border: json["border"],
    );

    Map<String, dynamic> toJson() => {
        "primary": primary,
        "number": number,
        "border": border,
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