// To parse this JSON data, do
//
//     final manufacturer = manufacturerFromJson(jsonString);

import 'dart:convert';

Manufacturer manufacturerFromJson(String str) => Manufacturer.fromJson(json.decode(str));

String manufacturerToJson(Manufacturer data) => json.encode(data.toJson());

class Manufacturer {
    String? chineseDescription;
    String? chineseName;
    String chineseShortName;
    String? description;
    Logo logo;
    String name;
    String path;
    String ref;
    String shortName;
    int? size;
    String? type;

    Manufacturer({
        this.chineseDescription,
        required this.chineseName,
        required this.chineseShortName,
        this.description,
        required this.logo,
        required this.name,
        required this.path,
        required this.ref,
        required this.shortName,
        this.size,
        this.type,
    });

    factory Manufacturer.fromJson(Map<String, dynamic> json) => Manufacturer(
        chineseDescription: json["chinese_description"],
        chineseName: json["chinese_name"],
        chineseShortName: json["chinese_short_name"],
        description: json["description"],
        logo: Logo.fromJson(json["logo"]),
        name: json["name"],
        path: json["path"],
        ref: json["ref"],
        shortName: json["short_name"],
        size: json["size"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "chinese_description": chineseDescription,
        "chinese_name": chineseName,
        "chinese_short_name": chineseShortName,
        "description": description,
        "logo": logo.toJson(),
        "name": name,
        "path": path,
        "ref": ref,
        "short_name": shortName,
        "size": size,
        "type": type,
    };
}

class Logo {
    String logo;
    String logoFullColor;
    String logoSimplifiedRaw;

    Logo({
        required this.logo,
        required this.logoFullColor,
        required this.logoSimplifiedRaw,
    });

    factory Logo.fromJson(Map<String, dynamic> json) => Logo(
        logo: json["logo"],
        logoFullColor: json["logo_full_color"],
        logoSimplifiedRaw: json["logo_simplified_raw"],
    );

    Map<String, dynamic> toJson() => {
        "logo": logo,
        "logo_full_color": logoFullColor,
        "logo_simplified_raw": logoSimplifiedRaw,
    };
}
