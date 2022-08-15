import 'dart:convert';

RacesByChickenModel racesbyChickenModelFromJson(String str, int chickenId) =>
    RacesByChickenModel.fromJson(json.decode(str), chickenId);

class RacesByChickenModel {
  int? chickenId;
  int? count;
  List<Rows>? rows;

  RacesByChickenModel({this.count, this.rows});

  RacesByChickenModel.fromJson(Map<String, dynamic> json, int chickenId) {
    chickenId = chickenId;
    count = json['count'];
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows!.add(Rows.fromJson(v, chickenId));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (rows != null) {
      data['rows'] = rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rows {
  int? id;
  String? name;
  String? peckingOrder;
  int? terrainId;
  int? distance;
  dynamic fee;
  int? maxCapacity;
  int? currentCapacity;
  String? location;
  int? minimumStartDelay;
  String? status;
  int? startTime;
  double? prizePool;
  String? paidStatus;
  int? unlimitPO;
  String? startsAt;
  String? endsAt;
  int? payoutAttempts;
  String? type;
  int? group;
  dynamic feeUSD;
  dynamic prizePoolUSD;
  String? createdAt;
  String? updatedAt;
  Result? result;
  Terrain? terrain;
  dynamic position = "NA";
  late double? earnings;
  late dynamic totalearnings;

  Rows(
      {this.id,
      this.name,
      this.peckingOrder,
      this.terrainId,
      this.distance,
      this.fee,
      this.maxCapacity,
      this.currentCapacity,
      this.location,
      this.minimumStartDelay,
      this.status,
      this.startTime,
      this.prizePool,
      this.paidStatus,
      this.unlimitPO,
      this.startsAt,
      this.endsAt,
      this.payoutAttempts,
      this.type,
      this.group,
      this.feeUSD,
      this.prizePoolUSD,
      this.createdAt,
      this.updatedAt,
      this.result,
      this.terrain,
      this.position,
      this.earnings,
      this.totalearnings});

  Rows.fromJson(Map<String, dynamic> json, int chickenId) {
    id = json['id'];
    name = json['name'];
    peckingOrder = json['peckingOrder'];
    terrainId = json['terrainId'];
    distance = json['distance'];
    fee = json['fee'];
    maxCapacity = json['maxCapacity'];
    currentCapacity = json['currentCapacity'];
    location = json['location'];
    minimumStartDelay = json['minimumStartDelay'];
    status = json['status'];
    startTime = json['startTime'];
    prizePool = json['prizePool'];
    paidStatus = json['paidStatus'];
    unlimitPO = json['unlimitPO'];
    startsAt = json['startsAt'];
    endsAt = json['endsAt'];
    payoutAttempts = json['payoutAttempts'];
    type = json['type'];
    group = json['group'];
    feeUSD = json['feeUSD'];
    prizePoolUSD = json['prizePoolUSD'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    terrain =
        json['terrain'] != null ? Terrain.fromJson(json['terrain']) : null;
    setPosition(chickenId);
  }

  void setPosition(int chickenId) {
    num lanes = result?.chickens?.length.toInt() ?? 0;
    for (var i = 0; i < lanes; i++) {
      if (result?.chickens?[i].id == chickenId) {
        position = i + 1;
        earnings = result?.chickens?[i].raceEarnings;
        totalearnings = earnings! - feeUSD;
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['peckingOrder'] = peckingOrder;
    data['terrainId'] = terrainId;
    data['distance'] = distance;
    data['fee'] = fee;
    data['maxCapacity'] = maxCapacity;
    data['currentCapacity'] = currentCapacity;
    data['location'] = location;
    data['minimumStartDelay'] = minimumStartDelay;
    data['status'] = status;
    data['startTime'] = startTime;
    data['prizePool'] = prizePool;
    data['paidStatus'] = paidStatus;
    data['unlimitPO'] = unlimitPO;
    data['startsAt'] = startsAt;
    data['endsAt'] = endsAt;
    data['payoutAttempts'] = payoutAttempts;
    data['type'] = type;
    data['group'] = group;
    data['feeUSD'] = feeUSD;
    data['prizePoolUSD'] = prizePoolUSD;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    if (terrain != null) {
      data['terrain'] = terrain!.toJson();
    }
    return data;
  }
}

class Result {
  int? id;
  int? raceId;
  List<Chickens>? chickens;

  Result({this.id, this.raceId, this.chickens});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    raceId = json['raceId'];
    if (json['chickens'] != null) {
      chickens = <Chickens>[];
      json['chickens'].forEach((v) {
        chickens!.add(Chickens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['raceId'] = raceId;
    if (chickens != null) {
      data['chickens'] = chickens!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chickens {
  int? id;
  double? raceEarnings;

  Chickens({this.id, this.raceEarnings});

  Chickens.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    raceEarnings = json['raceEarnings'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['raceEarnings'] = raceEarnings;
    return data;
  }
}

class Terrain {
  String? name;
  String? image;

  Terrain({this.name, this.image});

  Terrain.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}
