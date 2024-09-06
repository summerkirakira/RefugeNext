import './upgrade_ship_info.dart';

class FilteredShipResponse {
  Data? data;

  FilteredShipResponse({this.data});

  FilteredShipResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  From? from;
  To? to;

  Data({this.from, this.to});

  Data.fromJson(Map<String, dynamic> json) {
    from = json['from'] != null ? new From.fromJson(json['from']) : null;
    to = json['to'] != null ? new To.fromJson(json['to']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.from != null) {
      data['from'] = this.from!.toJson();
    }
    if (this.to != null) {
      data['to'] = this.to!.toJson();
    }
    return data;
  }
}

class From {
  List<FromShips>? ships;

  From({this.ships});

  From.fromJson(Map<String, dynamic> json) {
    if (json['ships'] != null) {
      ships = <FromShips>[];
      json['ships'].forEach((v) {
        ships!.add(new FromShips.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ships != null) {
      data['ships'] = this.ships!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FromShips {
  int? id;

  FromShips({this.id});

  FromShips.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class To {
  String? featured;
  List<Ships>? ships;

  To({this.featured, this.ships});

  To.fromJson(Map<String, dynamic> json) {
    featured = json['featured'];
    if (json['ships'] != null) {
      ships = <Ships>[];
      json['ships'].forEach((v) {
        ships!.add(new Ships.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['featured'] = this.featured;
    if (this.ships != null) {
      data['ships'] = this.ships!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ships {
  int? id;
  List<Skus>? skus;

  Ships({this.id, this.skus});

  Ships.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['skus'] != null) {
      skus = <Skus>[];
      json['skus'].forEach((v) {
        skus!.add(new Skus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.skus != null) {
      data['skus'] = this.skus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
