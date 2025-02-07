import 'dart:convert';

class CountryModel {
  final List<Country>? data;
  final Links? links;
  final Meta? meta;

  CountryModel({
    this.data,
    this.links,
    this.meta,
  });

  CountryModel copyWith({
    List<Country>? data,
    Links? links,
    Meta? meta,
  }) =>
      CountryModel(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory CountryModel.fromRawJson(String str) =>
      CountryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        data: json["data"] == null
            ? []
            : List<Country>.from(json["data"]!.map((x) => Country.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
      };
}

class Country {
  final String? name;
  final String? fullName;
  final String? capital;
  final String? iso2;
  final String? iso3;
  final Covid19? covid19;
  final CurrentPresident? currentPresident;
  final String? currency;
  final String? phoneCode;
  final String? continent;
  final String? description;
  final String? size;
  final DateTime? independenceDate;
  final String? population;
  final CountryHref? href;

  Country({
    this.name,
    this.fullName,
    this.capital,
    this.iso2,
    this.iso3,
    this.covid19,
    this.currentPresident,
    this.currency,
    this.phoneCode,
    this.continent,
    this.description,
    this.size,
    this.independenceDate,
    this.population,
    this.href,
  });

  Country copyWith({
    String? name,
    String? fullName,
    String? capital,
    String? iso2,
    String? iso3,
    Covid19? covid19,
    CurrentPresident? currentPresident,
    String? currency,
    String? phoneCode,
    String? continent,
    String? description,
    String? size,
    DateTime? independenceDate,
    String? population,
    CountryHref? href,
  }) =>
      Country(
        name: name ?? this.name,
        fullName: fullName ?? this.fullName,
        capital: capital ?? this.capital,
        iso2: iso2 ?? this.iso2,
        iso3: iso3 ?? this.iso3,
        covid19: covid19 ?? this.covid19,
        currentPresident: currentPresident ?? this.currentPresident,
        currency: currency ?? this.currency,
        phoneCode: phoneCode ?? this.phoneCode,
        continent: continent ?? this.continent,
        description: description ?? this.description,
        size: size ?? this.size,
        independenceDate: independenceDate ?? this.independenceDate,
        population: population ?? this.population,
        href: href ?? this.href,
      );

  factory Country.fromRawJson(String str) => Country.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        fullName: json["full_name"],
        capital: json["capital"],
        iso2: json["iso2"],
        iso3: json["iso3"],
        covid19:
            json["covid19"] == null ? null : Covid19.fromJson(json["covid19"]),
        currentPresident: json["current_president"] == null
            ? null
            : CurrentPresident.fromJson(json["current_president"]),
        currency: json["currency"],
        phoneCode: json["phone_code"],
        continent: json["continent"],
        description: json["description"],
        size: json["size"],
        independenceDate: json["independence_date"] == null
            ? null
            : DateTime.parse(json["independence_date"]),
        population: json["population"],
        href: json["href"] == null ? null : CountryHref.fromJson(json["href"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "full_name": fullName,
        "capital": capital,
        "iso2": iso2,
        "iso3": iso3,
        "covid19": covid19?.toJson(),
        "current_president": currentPresident?.toJson(),
        "currency": currency,
        "phone_code": phoneCode,
        "continent": continent,
        "description": description,
        "size": size,
        "independence_date":
            "${independenceDate!.year.toString().padLeft(4, '0')}-${independenceDate!.month.toString().padLeft(2, '0')}-${independenceDate!.day.toString().padLeft(2, '0')}",
        "population": population,
        "href": href?.toJson(),
      };
}

class Covid19 {
  final String? totalCase;
  final String? totalDeaths;
  final DateTime? lastUpdated;

  Covid19({
    this.totalCase,
    this.totalDeaths,
    this.lastUpdated,
  });

  Covid19 copyWith({
    String? totalCase,
    String? totalDeaths,
    DateTime? lastUpdated,
  }) =>
      Covid19(
        totalCase: totalCase ?? this.totalCase,
        totalDeaths: totalDeaths ?? this.totalDeaths,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );

  factory Covid19.fromRawJson(String str) => Covid19.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Covid19.fromJson(Map<String, dynamic> json) => Covid19(
        totalCase: json["total_case"],
        totalDeaths: json["total_deaths"],
        lastUpdated: json["last_updated"] == null
            ? null
            : DateTime.parse(json["last_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "total_case": totalCase,
        "total_deaths": totalDeaths,
        "last_updated": lastUpdated?.toIso8601String(),
      };
}

class CurrentPresident {
  final String? name;
  final String? gender;
  final DateTime? appointmentStartDate;
  final dynamic appointmentEndDate;
  final CurrentPresidentHref? href;

  CurrentPresident({
    this.name,
    this.gender,
    this.appointmentStartDate,
    this.appointmentEndDate,
    this.href,
  });

  CurrentPresident copyWith({
    String? name,
    String? gender,
    DateTime? appointmentStartDate,
    dynamic appointmentEndDate,
    CurrentPresidentHref? href,
  }) =>
      CurrentPresident(
        name: name ?? this.name,
        gender: gender ?? this.gender,
        appointmentStartDate: appointmentStartDate ?? this.appointmentStartDate,
        appointmentEndDate: appointmentEndDate ?? this.appointmentEndDate,
        href: href ?? this.href,
      );

  factory CurrentPresident.fromRawJson(String str) =>
      CurrentPresident.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CurrentPresident.fromJson(Map<String, dynamic> json) =>
      CurrentPresident(
        name: json["name"],
        gender: json["gender"],
        appointmentStartDate: json["appointment_start_date"] == null
            ? null
            : DateTime.parse(json["appointment_start_date"]),
        appointmentEndDate: json["appointment_end_date"],
        href: json["href"] == null
            ? null
            : CurrentPresidentHref.fromJson(json["href"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "appointment_start_date":
            "${appointmentStartDate!.year.toString().padLeft(4, '0')}-${appointmentStartDate!.month.toString().padLeft(2, '0')}-${appointmentStartDate!.day.toString().padLeft(2, '0')}",
        "appointment_end_date": appointmentEndDate,
        "href": href?.toJson(),
      };
}

class CurrentPresidentHref {
  final String? self;
  final String? country;
  final String? picture;

  CurrentPresidentHref({
    this.self,
    this.country,
    this.picture,
  });

  CurrentPresidentHref copyWith({
    String? self,
    String? country,
    String? picture,
  }) =>
      CurrentPresidentHref(
        self: self ?? this.self,
        country: country ?? this.country,
        picture: picture ?? this.picture,
      );

  factory CurrentPresidentHref.fromRawJson(String str) =>
      CurrentPresidentHref.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CurrentPresidentHref.fromJson(Map<String, dynamic> json) =>
      CurrentPresidentHref(
        self: json["self"],
        country: json["country"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "country": country,
        "picture": picture,
      };
}

class CountryHref {
  final String? self;
  final String? states;
  final String? presidents;
  final String? flag;

  CountryHref({
    this.self,
    this.states,
    this.presidents,
    this.flag,
  });

  CountryHref copyWith({
    String? self,
    String? states,
    String? presidents,
    String? flag,
  }) =>
      CountryHref(
        self: self ?? this.self,
        states: states ?? this.states,
        presidents: presidents ?? this.presidents,
        flag: flag ?? this.flag,
      );

  factory CountryHref.fromRawJson(String str) =>
      CountryHref.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CountryHref.fromJson(Map<String, dynamic> json) => CountryHref(
        self: json["self"],
        states: json["states"],
        presidents: json["presidents"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "states": states,
        "presidents": presidents,
        "flag": flag,
      };
}

class Links {
  final String? first;
  final String? last;
  final dynamic prev;
  final dynamic next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  Links copyWith({
    String? first,
    String? last,
    dynamic prev,
    dynamic next,
  }) =>
      Links(
        first: first ?? this.first,
        last: last ?? this.last,
        prev: prev ?? this.prev,
        next: next ?? this.next,
      );

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  Meta copyWith({
    int? currentPage,
    int? from,
    int? lastPage,
    String? path,
    int? perPage,
    int? to,
    int? total,
  }) =>
      Meta(
        currentPage: currentPage ?? this.currentPage,
        from: from ?? this.from,
        lastPage: lastPage ?? this.lastPage,
        path: path ?? this.path,
        perPage: perPage ?? this.perPage,
        to: to ?? this.to,
        total: total ?? this.total,
      );

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}
