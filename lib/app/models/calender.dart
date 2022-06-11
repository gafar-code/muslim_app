// ignore_for_file: constant_identifier_names

import 'dart:convert';

CalenderModel calenderModelFromJson(String str) =>
    CalenderModel.fromJson(json.decode(str));

String calenderModelToJson(CalenderModel data) => json.encode(data.toJson());

class CalenderModel {
  CalenderModel({
    required this.type,
    required this.year,
    required this.name,
    required this.initial,
    required this.month,
    required this.monthly,
  });

  final int type;
  final int year;
  final String name;
  final String initial;
  final int month;
  final Monthly monthly;

  factory CalenderModel.fromJson(Map<String, dynamic> json) => CalenderModel(
        type: json["type"],
        year: json["year"],
        name: json["name"],
        initial: json["initial"],
        month: json["month"],
        monthly: Monthly.fromJson(json["monthly"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "year": year,
        "name": name,
        "initial": initial,
        "month": month,
        "monthly": monthly.toJson(),
      };
}

class Monthly {
  Monthly({
    required this.daysCount,
    required this.weeksCount,
    required this.firstWeek,
    required this.firstDate,
    required this.lastDate,
    required this.daily,
    required this.holiday,
    required this.leave,
    required this.islamic,
    required this.longWeekend,
    required this.harpitnas,
  });

  final int daysCount;
  final int weeksCount;
  final int firstWeek;
  final StDate firstDate;
  final StDate lastDate;
  final List<Daily> daily;
  final Harpitnas holiday;
  final Harpitnas leave;
  final Harpitnas islamic;
  final Harpitnas longWeekend;
  final Harpitnas harpitnas;

  factory Monthly.fromJson(Map<String, dynamic> json) => Monthly(
        daysCount: json["daysCount"],
        weeksCount: json["weeksCount"],
        firstWeek: json["firstWeek"],
        firstDate: StDate.fromJson(json["firstDate"]),
        lastDate: StDate.fromJson(json["lastDate"]),
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
        holiday: Harpitnas.fromJson(json["holiday"]),
        leave: Harpitnas.fromJson(json["leave"]),
        islamic: Harpitnas.fromJson(json["islamic"]),
        longWeekend: Harpitnas.fromJson(json["longWeekend"]),
        harpitnas: Harpitnas.fromJson(json["harpitnas"]),
      );

  Map<String, dynamic> toJson() => {
        "daysCount": daysCount,
        "weeksCount": weeksCount,
        "firstWeek": firstWeek,
        "firstDate": firstDate.toJson(),
        "lastDate": lastDate.toJson(),
        "daily": List<dynamic>.from(daily.map((x) => x.toJson())),
        "holiday": holiday.toJson(),
        "leave": leave.toJson(),
        "islamic": islamic.toJson(),
        "longWeekend": longWeekend.toJson(),
        "harpitnas": harpitnas.toJson(),
      };
}

class Daily {
  Daily({
    required this.type,
    required this.date,
    required this.text,
    required this.day,
    required this.color,
    required this.info,
    required this.holiday,
    required this.leave,
    required this.islamic,
  });

  final Type type;
  final Date date;
  final Date text;
  final Date day;
  final Color color;
  final InfoClass info;
  final List<Holiday>? holiday;
  final dynamic leave;
  final List<Islamic>? islamic;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        type: typeValues.map[json["type"]]!,
        date: Date.fromJson(json["date"]),
        text: Date.fromJson(json["text"]),
        day: Date.fromJson(json["day"]),
        color: Color.fromJson(json["color"]),
        info: InfoClass.fromJson(json["info"]),
        holiday: json["holiday"] == null
            ? null
            : List<Holiday>.from(
                json["holiday"].map((x) => Holiday.fromJson(x))),
        leave: json["leave"],
        islamic: json["islamic"] == null
            ? null
            : List<Islamic>.from(
                json["islamic"].map((x) => Islamic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "date": date.toJson(),
        "text": text.toJson(),
        "day": day.toJson(),
        "color": color.toJson(),
        "info": info.toJson(),
        "holiday": holiday == null
            ? null
            : List<dynamic>.from(holiday!.map((x) => x.toJson())),
        "leave": leave,
        "islamic": islamic == null
            ? null
            : List<dynamic>.from(islamic!.map((x) => x.toJson())),
      };
}

class Color {
  Color({
    required this.back,
    required this.text,
    required this.old,
    required this.circle,
  });

  final Back back;
  final Back text;
  final Old old;
  final Circle circle;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        back: backValues.map[json["back"]]!,
        text: backValues.map[json["text"]]!,
        old: oldValues.map[json["old"]]!,
        circle: circleValues.map[json["circle"]]!,
      );

  Map<String, dynamic> toJson() => {
        "back": backValues.reverse[back],
        "text": backValues.reverse[text],
        "old": oldValues.reverse[old],
        "circle": circleValues.reverse[circle],
      };
}

enum Back { GREY, RED, WHITE, GREEN, BLUE, BLACK }

final backValues = EnumValues({
  "black": Back.BLACK,
  "blue": Back.BLUE,
  "green": Back.GREEN,
  "grey": Back.GREY,
  "red": Back.RED,
  "white": Back.WHITE
});

enum Circle { CIRCLE, SQUARE }

final circleValues =
    EnumValues({"circle": Circle.CIRCLE, "square": Circle.SQUARE});

enum Old { GREY, EMPTY }

final oldValues = EnumValues({"": Old.EMPTY, "grey": Old.GREY});

class Date {
  Date({
    required this.m,
    required this.h,
    required this.j,
    required this.c,
    required this.s,
    required this.w,
  });

  final String m;
  final String h;
  final String j;
  final String c;
  final String s;
  final dynamic w;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        m: json["M"],
        h: json["H"],
        j: json["J"],
        c: json["C"],
        s: json["S"],
        w: json["W"],
      );

  Map<String, dynamic> toJson() => {
        "M": m,
        "H": h,
        "J": j,
        "C": c,
        "S": s,
        "W": w,
      };
}

class Holiday {
  Holiday({
    required this.week,
    required this.type,
    required this.date,
    required this.day,
    required this.name,
    required this.info,
    required this.mode,
    required this.rel,
  });

  final int week;
  final String type;
  final DateTime date;
  final int day;
  final String name;
  final int info;
  final int mode;
  final String rel;

  factory Holiday.fromJson(Map<String, dynamic> json) => Holiday(
        week: json["week"],
        type: json["type"],
        date: DateTime.parse(json["date"]),
        day: json["day"],
        name: json["name"],
        info: json["info"],
        mode: json["mode"],
        rel: json["rel"],
      );

  Map<String, dynamic> toJson() => {
        "week": week,
        "type": type,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "day": day,
        "name": name,
        "info": info,
        "mode": mode,
        "rel": rel,
      };
}

class InfoClass {
  InfoClass({
    required this.m,
    required this.j,
    required this.s,
  });

  final M m;
  final J j;
  final S s;

  factory InfoClass.fromJson(Map<String, dynamic> json) => InfoClass(
        m: M.fromJson(json["M"]),
        j: J.fromJson(json["J"]),
        s: S.fromJson(json["S"]),
      );

  Map<String, dynamic> toJson() => {
        "M": m.toJson(),
        "J": j.toJson(),
        "S": s.toJson(),
      };
}

class J {
  J({
    required this.pasaran,
    required this.wuku,
    required this.neptu,
    required this.mongso,
    required this.tahun,
    required this.windu,
    required this.lambang,
  });

  final JPasaran pasaran;
  final JWuku? wuku;
  final String neptu;
  final String mongso;
  final JTahun tahun;
  final JWindu windu;
  final Lambang lambang;

  factory J.fromJson(Map<String, dynamic> json) => J(
        pasaran: jPasaranValues.map[json["Pasaran"]]!,
        wuku: jWukuValues.map[json["Wuku"]],
        neptu: json["Neptu"],
        mongso: json["Mongso"],
        tahun: jTahunValues.map[json["Tahun"]]!,
        windu: jWinduValues.map[json["Windu"]]!,
        lambang: lambangValues.map[json["Lambang"]]!,
      );

  Map<String, dynamic> toJson() => {
        "Pasaran": jPasaranValues.reverse[pasaran],
        "Wuku": jWukuValues.reverse[wuku],
        "Neptu": neptu,
        "Mongso": mongso,
        "Tahun": jTahunValues.reverse[tahun],
        "Windu": jWinduValues.reverse[windu],
        "Lambang": lambangValues.reverse[lambang],
      };
}

enum Lambang { LANGKIR }

final lambangValues = EnumValues({"Langkir": Lambang.LANGKIR});

enum JPasaran { LEGI, PAHING, PON, WAGE, KLIWON }

final jPasaranValues = EnumValues({
  "Kliwon": JPasaran.KLIWON,
  "Legi": JPasaran.LEGI,
  "Pahing": JPasaran.PAHING,
  "Pon": JPasaran.PON,
  "Wage": JPasaran.WAGE
});

enum JTahun { ALIP }

final jTahunValues = EnumValues({"Alip": JTahun.ALIP});

enum JWindu { SANCAYA }

final jWinduValues = EnumValues({"Sancaya": JWindu.SANCAYA});

enum JWuku { MARAKEH, TAMBIR, MEDANGKUNGAN, MAKTAL, WAYE, MENAHIL }

final jWukuValues = EnumValues({
  "Maktal": JWuku.MAKTAL,
  "Marakeh": JWuku.MARAKEH,
  "Medangkungan": JWuku.MEDANGKUNGAN,
  "Menahil": JWuku.MENAHIL,
  "Tambir": JWuku.TAMBIR,
  "Waye": JWuku.WAYE
});

class M {
  M({
    required this.zodiac,
    required this.shio,
    required this.element,
  });

  final int zodiac;
  final int shio;
  final int element;

  factory M.fromJson(Map<String, dynamic> json) => M(
        zodiac: json["Zodiac"],
        shio: json["Shio"],
        element: json["Element"],
      );

  Map<String, dynamic> toJson() => {
        "Zodiac": zodiac,
        "Shio": shio,
        "Element": element,
      };
}

class S {
  S({
    required this.pasaran,
    required this.wuku,
    required this.tahun,
    required this.windu,
  });

  final SPasaran pasaran;
  final SWuku? wuku;
  final STahun? tahun;
  final SWindu? windu;

  factory S.fromJson(Map<String, dynamic> json) => S(
        pasaran: sPasaranValues.map[json["Pasaran"]]!,
        wuku: sWukuValues.map[json["Wuku"]],
        tahun: sTahunValues.map[json["Tahun"]],
        windu: sWinduValues.map[json["Windu"]],
      );

  Map<String, dynamic> toJson() => {
        "Pasaran": sPasaranValues.reverse[pasaran],
        "Wuku": sWukuValues.reverse[wuku],
        "Tahun": sTahunValues.reverse[tahun],
        "Windu": sWinduValues.reverse[windu],
      };
}

enum SPasaran { PON, WAGE, KALIWON, MANIS, PAHING }

final sPasaranValues = EnumValues({
  "Kaliwon": SPasaran.KALIWON,
  "Manis": SPasaran.MANIS,
  "Pahing": SPasaran.PAHING,
  "Pon": SPasaran.PON,
  "Wage": SPasaran.WAGE
});

enum STahun { KEUYEUP }

final sTahunValues = EnumValues({"Keuyeup": STahun.KEUYEUP});

enum SWindu { ADI }

final sWinduValues = EnumValues({"Adi": SWindu.ADI});

enum SWuku { KULAWU, DUKUT, WATUGUNUNG, SINTA, LANDEP, WUKIR }

final sWukuValues = EnumValues({
  "Dukut": SWuku.DUKUT,
  "Kulawu": SWuku.KULAWU,
  "Landep": SWuku.LANDEP,
  "Sinta": SWuku.SINTA,
  "Watugunung": SWuku.WATUGUNUNG,
  "Wukir": SWuku.WUKIR
});

class Islamic {
  Islamic({
    required this.week,
    required this.type,
    required this.date,
    required this.day,
    required this.name,
    required this.info,
    required this.mode,
    required this.rel,
  });

  final int week;
  final String type;
  final DateTime date;
  final int day;
  final String name;
  final String info;
  final int mode;
  final String rel;

  factory Islamic.fromJson(Map<String, dynamic> json) => Islamic(
        week: json["week"],
        type: json["type"],
        date: DateTime.parse(json["date"]),
        day: json["day"],
        name: json["name"],
        info: json["info"],
        mode: json["mode"],
        rel: json["rel"],
      );

  Map<String, dynamic> toJson() => {
        "week": week,
        "type": type,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "day": day,
        "name": name,
        "info": info,
        "mode": mode,
        "rel": rel,
      };
}

enum Type { BEFORE, CURRENT, AFTER }

final typeValues = EnumValues(
    {"after": Type.AFTER, "before": Type.BEFORE, "current": Type.CURRENT});

class StDate {
  StDate({
    required this.date,
    required this.text,
  });

  final Date date;
  final Date text;

  factory StDate.fromJson(Map<String, dynamic> json) => StDate(
        date: Date.fromJson(json["date"]),
        text: Date.fromJson(json["text"]),
      );

  Map<String, dynamic> toJson() => {
        "date": date.toJson(),
        "text": text.toJson(),
      };
}

class Harpitnas {
  Harpitnas({
    required this.count,
    required this.data,
  });

  final int count;
  final List<Datum>? data;

  factory Harpitnas.fromJson(Map<String, dynamic> json) => Harpitnas(
        count: json["count"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.week,
    required this.type,
    required this.date,
    required this.day,
    required this.name,
    required this.info,
    required this.mode,
    required this.rel,
  });

  final int week;
  final String type;
  final DateTime date;
  final int day;
  final String name;
  final dynamic info;
  final int mode;
  final String rel;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        week: json["week"],
        type: json["type"],
        date: DateTime.parse(json["date"]),
        day: json["day"],
        name: json["name"],
        info: json["info"],
        mode: json["mode"],
        rel: json["rel"],
      );

  Map<String, dynamic> toJson() => {
        "week": week,
        "type": type,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "day": day,
        "name": name,
        "info": info,
        "mode": mode,
        "rel": rel,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
