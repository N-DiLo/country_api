import 'dart:convert';

class CountryModel {
  final Name? name;
  final List<String>? tld;
  final String? cca2;
  final String? ccn3;
  final String? cca3;
  final bool? independent;
  final String? status;
  final bool? unMember;
  final Map<String, Currency>? currencies;
  final Idd? idd;
  final List<String>? capital;
  final List<String>? altSpellings;
  final String? region;
  final Map<String, String>? languages;
  final Map<String, Translation>? translations;
  final List<double>? latlng;
  final bool? landlocked;
  final double? area;
  final Demonyms? demonyms;
  final String? flag;
  final Maps? maps;
  final int? population;
  final Car? car;
  final List<String>? timezones;
  final List<String>? continents;
  final Flags? flags;
  final CoatOfArms? coatOfArms;
  final String? startOfWeek;
  final CapitalInfo? capitalInfo;
  final String? cioc;
  final String? subregion;
  final String? fifa;
  final List<String>? borders;
  final Map<String, double>? gini;
  final PostalCode? postalCode;

  CountryModel({
    this.name,
    this.tld,
    this.cca2,
    this.ccn3,
    this.cca3,
    this.independent,
    this.status,
    this.unMember,
    this.currencies,
    this.idd,
    this.capital,
    this.altSpellings,
    this.region,
    this.languages,
    this.translations,
    this.latlng,
    this.landlocked,
    this.area,
    this.demonyms,
    this.flag,
    this.maps,
    this.population,
    this.car,
    this.timezones,
    this.continents,
    this.flags,
    this.coatOfArms,
    this.startOfWeek,
    this.capitalInfo,
    this.cioc,
    this.subregion,
    this.fifa,
    this.borders,
    this.gini,
    this.postalCode,
  });

  CountryModel copyWith({
    Name? name,
    List<String>? tld,
    String? cca2,
    String? ccn3,
    String? cca3,
    bool? independent,
    String? status,
    bool? unMember,
    Map<String, Currency>? currencies,
    Idd? idd,
    List<String>? capital,
    List<String>? altSpellings,
    String? region,
    Map<String, String>? languages,
    Map<String, Translation>? translations,
    List<double>? latlng,
    bool? landlocked,
    double? area,
    Demonyms? demonyms,
    String? flag,
    Maps? maps,
    int? population,
    Car? car,
    List<String>? timezones,
    List<String>? continents,
    Flags? flags,
    CoatOfArms? coatOfArms,
    String? startOfWeek,
    CapitalInfo? capitalInfo,
    String? cioc,
    String? subregion,
    String? fifa,
    List<String>? borders,
    Map<String, double>? gini,
    PostalCode? postalCode,
  }) =>
      CountryModel(
        name: name ?? this.name,
        tld: tld ?? this.tld,
        cca2: cca2 ?? this.cca2,
        ccn3: ccn3 ?? this.ccn3,
        cca3: cca3 ?? this.cca3,
        independent: independent ?? this.independent,
        status: status ?? this.status,
        unMember: unMember ?? this.unMember,
        currencies: currencies ?? this.currencies,
        idd: idd ?? this.idd,
        capital: capital ?? this.capital,
        altSpellings: altSpellings ?? this.altSpellings,
        region: region ?? this.region,
        languages: languages ?? this.languages,
        translations: translations ?? this.translations,
        latlng: latlng ?? this.latlng,
        landlocked: landlocked ?? this.landlocked,
        area: area ?? this.area,
        demonyms: demonyms ?? this.demonyms,
        flag: flag ?? this.flag,
        maps: maps ?? this.maps,
        population: population ?? this.population,
        car: car ?? this.car,
        timezones: timezones ?? this.timezones,
        continents: continents ?? this.continents,
        flags: flags ?? this.flags,
        coatOfArms: coatOfArms ?? this.coatOfArms,
        startOfWeek: startOfWeek ?? this.startOfWeek,
        capitalInfo: capitalInfo ?? this.capitalInfo,
        cioc: cioc ?? this.cioc,
        subregion: subregion ?? this.subregion,
        fifa: fifa ?? this.fifa,
        borders: borders ?? this.borders,
        gini: gini ?? this.gini,
        postalCode: postalCode ?? this.postalCode,
      );

  factory CountryModel.fromRawJson(String str) =>
      CountryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        tld: json["tld"] == null
            ? []
            : List<String>.from(json["tld"]!.map((x) => x)),
        cca2: json["cca2"],
        ccn3: json["ccn3"],
        cca3: json["cca3"],
        independent: json["independent"],
        status: json["status"],
        unMember: json["unMember"],
        currencies: Map.from(json["currencies"]!)
            .map((k, v) => MapEntry<String, Currency>(k, Currency.fromJson(v))),
        idd: json["idd"] == null ? null : Idd.fromJson(json["idd"]),
        capital: json["capital"] == null
            ? []
            : List<String>.from(json["capital"]!.map((x) => x)),
        altSpellings: json["altSpellings"] == null
            ? []
            : List<String>.from(json["altSpellings"]!.map((x) => x)),
        region: json["region"],
        languages: Map.from(json["languages"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
        translations: Map.from(json["translations"]!).map((k, v) =>
            MapEntry<String, Translation>(k, Translation.fromJson(v))),
        latlng: json["latlng"] == null
            ? []
            : List<double>.from(json["latlng"]!.map((x) => x?.toDouble())),
        landlocked: json["landlocked"],
        area: json["area"]?.toDouble(),
        demonyms: json["demonyms"] == null
            ? null
            : Demonyms.fromJson(json["demonyms"]),
        flag: json["flag"],
        maps: json["maps"] == null ? null : Maps.fromJson(json["maps"]),
        population: json["population"],
        car: json["car"] == null ? null : Car.fromJson(json["car"]),
        timezones: json["timezones"] == null
            ? []
            : List<String>.from(json["timezones"]!.map((x) => x)),
        continents: json["continents"] == null
            ? []
            : List<String>.from(json["continents"]!.map((x) => x)),
        flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
        coatOfArms: json["coatOfArms"] == null
            ? null
            : CoatOfArms.fromJson(json["coatOfArms"]),
        startOfWeek: json["startOfWeek"],
        capitalInfo: json["capitalInfo"] == null
            ? null
            : CapitalInfo.fromJson(json["capitalInfo"]),
        cioc: json["cioc"],
        subregion: json["subregion"],
        fifa: json["fifa"],
        borders: json["borders"] == null
            ? []
            : List<String>.from(json["borders"]!.map((x) => x)),
        gini: Map.from(json["gini"]!)
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        postalCode: json["postalCode"] == null
            ? null
            : PostalCode.fromJson(json["postalCode"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name?.toJson(),
        "tld": tld == null ? [] : List<dynamic>.from(tld!.map((x) => x)),
        "cca2": cca2,
        "ccn3": ccn3,
        "cca3": cca3,
        "independent": independent,
        "status": status,
        "unMember": unMember,
        "currencies": Map.from(currencies!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "idd": idd?.toJson(),
        "capital":
            capital == null ? [] : List<dynamic>.from(capital!.map((x) => x)),
        "altSpellings": altSpellings == null
            ? []
            : List<dynamic>.from(altSpellings!.map((x) => x)),
        "region": region,
        "languages":
            Map.from(languages!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "translations": Map.from(translations!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "latlng":
            latlng == null ? [] : List<dynamic>.from(latlng!.map((x) => x)),
        "landlocked": landlocked,
        "area": area,
        "demonyms": demonyms?.toJson(),
        "flag": flag,
        "maps": maps?.toJson(),
        "population": population,
        "car": car?.toJson(),
        "timezones": timezones == null
            ? []
            : List<dynamic>.from(timezones!.map((x) => x)),
        "continents": continents == null
            ? []
            : List<dynamic>.from(continents!.map((x) => x)),
        "flags": flags?.toJson(),
        "coatOfArms": coatOfArms?.toJson(),
        "startOfWeek": startOfWeek,
        "capitalInfo": capitalInfo?.toJson(),
        "cioc": cioc,
        "subregion": subregion,
        "fifa": fifa,
        "borders":
            borders == null ? [] : List<dynamic>.from(borders!.map((x) => x)),
        "gini": Map.from(gini!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "postalCode": postalCode?.toJson(),
      };
}

class CapitalInfo {
  final List<double>? latlng;

  CapitalInfo({
    this.latlng,
  });

  CapitalInfo copyWith({
    List<double>? latlng,
  }) =>
      CapitalInfo(
        latlng: latlng ?? this.latlng,
      );

  factory CapitalInfo.fromRawJson(String str) =>
      CapitalInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CapitalInfo.fromJson(Map<String, dynamic> json) => CapitalInfo(
        latlng: json["latlng"] == null
            ? []
            : List<double>.from(json["latlng"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "latlng":
            latlng == null ? [] : List<dynamic>.from(latlng!.map((x) => x)),
      };
}

class Car {
  final List<String>? signs;
  final String? side;

  Car({
    this.signs,
    this.side,
  });

  Car copyWith({
    List<String>? signs,
    String? side,
  }) =>
      Car(
        signs: signs ?? this.signs,
        side: side ?? this.side,
      );

  factory Car.fromRawJson(String str) => Car.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        signs: json["signs"] == null
            ? []
            : List<String>.from(json["signs"]!.map((x) => x)),
        side: json["side"],
      );

  Map<String, dynamic> toJson() => {
        "signs": signs == null ? [] : List<dynamic>.from(signs!.map((x) => x)),
        "side": side,
      };
}

class CoatOfArms {
  final String? png;
  final String? svg;

  CoatOfArms({
    this.png,
    this.svg,
  });

  CoatOfArms copyWith({
    String? png,
    String? svg,
  }) =>
      CoatOfArms(
        png: png ?? this.png,
        svg: svg ?? this.svg,
      );

  factory CoatOfArms.fromRawJson(String str) =>
      CoatOfArms.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CoatOfArms.fromJson(Map<String, dynamic> json) => CoatOfArms(
        png: json["png"],
        svg: json["svg"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
      };
}

class Currency {
  final String? name;
  final String? symbol;

  Currency({
    this.name,
    this.symbol,
  });

  Currency copyWith({
    String? name,
    String? symbol,
  }) =>
      Currency(
        name: name ?? this.name,
        symbol: symbol ?? this.symbol,
      );

  factory Currency.fromRawJson(String str) =>
      Currency.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
      };
}

class Demonyms {
  final Eng? eng;
  final Eng? fra;

  Demonyms({
    this.eng,
    this.fra,
  });

  Demonyms copyWith({
    Eng? eng,
    Eng? fra,
  }) =>
      Demonyms(
        eng: eng ?? this.eng,
        fra: fra ?? this.fra,
      );

  factory Demonyms.fromRawJson(String str) =>
      Demonyms.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Demonyms.fromJson(Map<String, dynamic> json) => Demonyms(
        eng: json["eng"] == null ? null : Eng.fromJson(json["eng"]),
        fra: json["fra"] == null ? null : Eng.fromJson(json["fra"]),
      );

  Map<String, dynamic> toJson() => {
        "eng": eng?.toJson(),
        "fra": fra?.toJson(),
      };
}

class Eng {
  final String? f;
  final String? m;

  Eng({
    this.f,
    this.m,
  });

  Eng copyWith({
    String? f,
    String? m,
  }) =>
      Eng(
        f: f ?? this.f,
        m: m ?? this.m,
      );

  factory Eng.fromRawJson(String str) => Eng.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Eng.fromJson(Map<String, dynamic> json) => Eng(
        f: json["f"],
        m: json["m"],
      );

  Map<String, dynamic> toJson() => {
        "f": f,
        "m": m,
      };
}

class Flags {
  final String? png;
  final String? svg;
  final String? alt;

  Flags({
    this.png,
    this.svg,
    this.alt,
  });

  Flags copyWith({
    String? png,
    String? svg,
    String? alt,
  }) =>
      Flags(
        png: png ?? this.png,
        svg: svg ?? this.svg,
        alt: alt ?? this.alt,
      );

  factory Flags.fromRawJson(String str) => Flags.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        png: json["png"],
        svg: json["svg"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
        "alt": alt,
      };
}

class Idd {
  final String? root;
  final List<String>? suffixes;

  Idd({
    this.root,
    this.suffixes,
  });

  Idd copyWith({
    String? root,
    List<String>? suffixes,
  }) =>
      Idd(
        root: root ?? this.root,
        suffixes: suffixes ?? this.suffixes,
      );

  factory Idd.fromRawJson(String str) => Idd.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Idd.fromJson(Map<String, dynamic> json) => Idd(
        root: json["root"],
        suffixes: json["suffixes"] == null
            ? []
            : List<String>.from(json["suffixes"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "root": root,
        "suffixes":
            suffixes == null ? [] : List<dynamic>.from(suffixes!.map((x) => x)),
      };
}

class Maps {
  final String? googleMaps;
  final String? openStreetMaps;

  Maps({
    this.googleMaps,
    this.openStreetMaps,
  });

  Maps copyWith({
    String? googleMaps,
    String? openStreetMaps,
  }) =>
      Maps(
        googleMaps: googleMaps ?? this.googleMaps,
        openStreetMaps: openStreetMaps ?? this.openStreetMaps,
      );

  factory Maps.fromRawJson(String str) => Maps.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Maps.fromJson(Map<String, dynamic> json) => Maps(
        googleMaps: json["googleMaps"],
        openStreetMaps: json["openStreetMaps"],
      );

  Map<String, dynamic> toJson() => {
        "googleMaps": googleMaps,
        "openStreetMaps": openStreetMaps,
      };
}

class Name {
  final String? common;
  final String? official;
  final Map<String, Translation>? nativeName;

  Name({
    this.common,
    this.official,
    this.nativeName,
  });

  Name copyWith({
    String? common,
    String? official,
    Map<String, Translation>? nativeName,
  }) =>
      Name(
        common: common ?? this.common,
        official: official ?? this.official,
        nativeName: nativeName ?? this.nativeName,
      );

  factory Name.fromRawJson(String str) => Name.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        nativeName: Map.from(json["nativeName"]!).map((k, v) =>
            MapEntry<String, Translation>(k, Translation.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
        "nativeName": Map.from(nativeName!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Translation {
  final String? official;
  final String? common;

  Translation({
    this.official,
    this.common,
  });

  Translation copyWith({
    String? official,
    String? common,
  }) =>
      Translation(
        official: official ?? this.official,
        common: common ?? this.common,
      );

  factory Translation.fromRawJson(String str) =>
      Translation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        official: json["official"],
        common: json["common"],
      );

  Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
      };
}

class PostalCode {
  final String? format;
  final String? regex;

  PostalCode({
    this.format,
    this.regex,
  });

  PostalCode copyWith({
    String? format,
    String? regex,
  }) =>
      PostalCode(
        format: format ?? this.format,
        regex: regex ?? this.regex,
      );

  factory PostalCode.fromRawJson(String str) =>
      PostalCode.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PostalCode.fromJson(Map<String, dynamic> json) => PostalCode(
        format: json["format"],
        regex: json["regex"],
      );

  Map<String, dynamic> toJson() => {
        "format": format,
        "regex": regex,
      };
}
