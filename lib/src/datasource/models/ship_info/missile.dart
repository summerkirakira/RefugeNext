// To parse this JSON data, do
//
//     final missile = missileFromJson(jsonString);

import 'dart:convert';

Missile missileFromJson(String str) => Missile.fromJson(json.decode(str));

String missileToJson(Missile data) => json.encode(data.toJson());

class Missile {
    double armTime;
    SpeedPhaseInfo boostPhase;
    String? chineseDescription;
    String? chineseName;
    Damage damage;
    String? description;
    double explosionRadiusMax;
    double explosionRadiusMin;
    HealthInfo? healthInfo;
    double igniteTime;
    SpeedPhaseInfo interceptPhase;
    double lifetime;
    double lockAngle;
    double lockRangeMax;
    double lockRangeMin;
    double lockTime;
    String manufacturer;
    double mass;
    double microScu;
    String name;
    String? path;
    String ref;
    List<ShopInfo> shopInfo;
    int size;
    double speed;
    SpeedPhaseInfo terminalPhase;
    TrackingSignalType trackingSignalType;
    String? type;

    Missile({
        required this.armTime,
        required this.boostPhase,
        this.chineseDescription,
        required this.chineseName,
        required this.damage,
        this.description,
        required this.explosionRadiusMax,
        required this.explosionRadiusMin,
        required this.healthInfo,
        required this.igniteTime,
        required this.interceptPhase,
        required this.lifetime,
        required this.lockAngle,
        required this.lockRangeMax,
        required this.lockRangeMin,
        required this.lockTime,
        required this.manufacturer,
        required this.mass,
        required this.microScu,
        required this.name,
        this.path,
        required this.ref,
        required this.shopInfo,
        required this.size,
        required this.speed,
        required this.terminalPhase,
        required this.trackingSignalType,
        this.type,
    });

    factory Missile.fromJson(Map<String, dynamic> json) => Missile(
        armTime: json["arm_time"]?.toDouble(),
        boostPhase: SpeedPhaseInfo.fromJson(json["boost_phase"]),
        chineseDescription: json["chinese_description"],
        chineseName: json["chinese_name"],
        damage: Damage.fromJson(json["damage"]),
        description: json["description"],
        explosionRadiusMax: json["explosion_radius_max"]?.toDouble(),
        explosionRadiusMin: json["explosion_radius_min"]?.toDouble(),
        healthInfo: json["health_info"] == null ? null : HealthInfo.fromJson(json["health_info"]),
        igniteTime: json["ignite_time"]?.toDouble(),
        interceptPhase: SpeedPhaseInfo.fromJson(json["intercept_phase"]),
        lifetime: json["lifetime"]?.toDouble(),
        lockAngle: json["lock_angle"]?.toDouble(),
        lockRangeMax: json["lock_range_max"]?.toDouble(),
        lockRangeMin: json["lock_range_min"]?.toDouble(),
        lockTime: json["lock_time"]?.toDouble(),
        manufacturer: json["manufacturer"],
        mass: json["mass"]?.toDouble(),
        microScu: json["micro_scu"]?.toDouble(),
        name: json["name"],
        path: json["path"],
        ref: json["ref"],
        shopInfo: List<ShopInfo>.from(json["shop_info"].map((x) => ShopInfo.fromJson(x))),
        size: json["size"],
        speed: json["speed"]?.toDouble(),
        terminalPhase: SpeedPhaseInfo.fromJson(json["terminal_phase"]),
        trackingSignalType: trackingSignalTypeValues.map[json["tracking_signal_type"]]!,
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "arm_time": armTime,
        "boost_phase": boostPhase.toJson(),
        "chinese_description": chineseDescription,
        "chinese_name": chineseName,
        "damage": damage.toJson(),
        "description": description,
        "explosion_radius_max": explosionRadiusMax,
        "explosion_radius_min": explosionRadiusMin,
        "health_info": healthInfo?.toJson(),
        "ignite_time": igniteTime,
        "intercept_phase": interceptPhase.toJson(),
        "lifetime": lifetime,
        "lock_angle": lockAngle,
        "lock_range_max": lockRangeMax,
        "lock_range_min": lockRangeMin,
        "lock_time": lockTime,
        "manufacturer": manufacturer,
        "mass": mass,
        "micro_scu": microScu,
        "name": name,
        "path": path,
        "ref": ref,
        "shop_info": List<dynamic>.from(shopInfo.map((x) => x.toJson())),
        "size": size,
        "speed": speed,
        "terminal_phase": terminalPhase.toJson(),
        "tracking_signal_type": trackingSignalTypeValues.reverse[trackingSignalType],
        "type": type,
    };
}

class SpeedPhaseInfo {
    double acceleration;
    double angularAcceleration;
    double angularSpeed;
    double duration;

    SpeedPhaseInfo({
        required this.acceleration,
        required this.angularAcceleration,
        required this.angularSpeed,
        required this.duration,
    });

    factory SpeedPhaseInfo.fromJson(Map<String, dynamic> json) => SpeedPhaseInfo(
        acceleration: json["acceleration"]?.toDouble(),
        angularAcceleration: json["angular_acceleration"]?.toDouble(),
        angularSpeed: json["angular_speed"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "acceleration": acceleration,
        "angular_acceleration": angularAcceleration,
        "angular_speed": angularSpeed,
        "duration": duration,
    };
}

class Damage {
    double damageBiochemical;
    double damageDistortion;
    double damageEnergy;
    double damagePhysical;
    double damageStun;
    double damageThermal;

    Damage({
        required this.damageBiochemical,
        required this.damageDistortion,
        required this.damageEnergy,
        required this.damagePhysical,
        required this.damageStun,
        required this.damageThermal,
    });

    factory Damage.fromJson(Map<String, dynamic> json) => Damage(
        damageBiochemical: json["damage_biochemical"]?.toDouble(),
        damageDistortion: json["damage_distortion"]?.toDouble(),
        damageEnergy: json["damage_energy"]?.toDouble(),
        damagePhysical: json["damage_physical"]?.toDouble(),
        damageStun: json["damage_stun"]?.toDouble(),
        damageThermal: json["damage_thermal"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "damage_biochemical": damageBiochemical,
        "damage_distortion": damageDistortion,
        "damage_energy": damageEnergy,
        "damage_physical": damagePhysical,
        "damage_stun": damageStun,
        "damage_thermal": damageThermal,
    };
}

class HealthInfo {
    DamageResistances damageResistances;
    double health;

    HealthInfo({
        required this.damageResistances,
        required this.health,
    });

    factory HealthInfo.fromJson(Map<String, dynamic> json) => HealthInfo(
        damageResistances: DamageResistances.fromJson(json["damage_resistances"]),
        health: json["health"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "damage_resistances": damageResistances.toJson(),
        "health": health,
    };
}

class DamageResistances {
    double? damageBiochemical;
    double? damageDistortion;
    double? damageEnergy;
    double? damagePhysical;
    double? damageStun;
    double? damageThermal;

    DamageResistances({
        this.damageBiochemical,
        this.damageDistortion,
        this.damageEnergy,
        this.damagePhysical,
        this.damageStun,
        this.damageThermal,
    });

    factory DamageResistances.fromJson(Map<String, dynamic> json) => DamageResistances(
        damageBiochemical: json["damage_biochemical"]?.toDouble(),
        damageDistortion: json["damage_distortion"]?.toDouble(),
        damageEnergy: json["damage_energy"]?.toDouble(),
        damagePhysical: json["damage_physical"]?.toDouble(),
        damageStun: json["damage_stun"]?.toDouble(),
        damageThermal: json["damage_thermal"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "damage_biochemical": damageBiochemical,
        "damage_distortion": damageDistortion,
        "damage_energy": damageEnergy,
        "damage_physical": damagePhysical,
        "damage_stun": damageStun,
        "damage_thermal": damageThermal,
    };
}

class ShopInfo {
    int basePrice;
    String? chineseLocation;
    String? chineseName;
    String location;
    String name;
    int price;

    ShopInfo({
        required this.basePrice,
        this.chineseLocation,
        this.chineseName,
        required this.location,
        required this.name,
        required this.price,
    });

    factory ShopInfo.fromJson(Map<String, dynamic> json) => ShopInfo(
        basePrice: json["base_price"],
        chineseLocation: json["chinese_location"],
        chineseName: json["chinese_name"],
        location: json["location"],
        name: json["name"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "base_price": basePrice,
        "chinese_location": chineseLocation,
        "chinese_name": chineseName,
        "location": location,
        "name": name,
        "price": price,
    };
}

enum TrackingSignalType {
    CROSS_SECTION,
    ELECTROMAGNETIC,
    INFRARED
}

final trackingSignalTypeValues = EnumValues({
    "CrossSection": TrackingSignalType.CROSS_SECTION,
    "Electromagnetic": TrackingSignalType.ELECTROMAGNETIC,
    "Infrared": TrackingSignalType.INFRARED
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
