// To parse this JSON data, do
//
//     final raceModel = raceModelFromJson(jsonString);
import 'dart:convert';
RaceDataModel raceModelFromJson(String str) => RaceDataModel.fromJson(json.decode(str));
class RaceDataModel {
  int? id;
  String? name;
  String? peckingOrder;
  int? terrainId;
  dynamic distance;
  dynamic fee;
  int? maxCapacity;
  int? currentCapacity;
  String? location;
  dynamic minimumStartDelay;
  String? status;
  dynamic startTime;
  double? prizePool;
  String? paidStatus;
  dynamic unlimitPO;
  String? startsAt;
  String? endsAt;
  int? payoutAttempts;
  String? type;
  int? group;
  dynamic feeUSD;
  double? prizePoolUSD;
  String? createdAt;
  String? updatedAt;
  Terrain? terrain;
  List<Lanes>? lanes;

  RaceDataModel(
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
        this.terrain,
        this.lanes});

  RaceDataModel.fromJson(Map<String, dynamic> json) {
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
    terrain =
    json['terrain'] != null ? new Terrain.fromJson(json['terrain']) : null;
    if (json['lanes'] != null) {
      lanes = <Lanes>[];
      json['lanes'].forEach((v) {
        lanes!.add(new Lanes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['peckingOrder'] = this.peckingOrder;
    data['terrainId'] = this.terrainId;
    data['distance'] = this.distance;
    data['fee'] = this.fee;
    data['maxCapacity'] = this.maxCapacity;
    data['currentCapacity'] = this.currentCapacity;
    data['location'] = this.location;
    data['minimumStartDelay'] = this.minimumStartDelay;
    data['status'] = this.status;
    data['startTime'] = this.startTime;
    data['prizePool'] = this.prizePool;
    data['paidStatus'] = this.paidStatus;
    data['unlimitPO'] = this.unlimitPO;
    data['startsAt'] = this.startsAt;
    data['endsAt'] = this.endsAt;
    data['payoutAttempts'] = this.payoutAttempts;
    data['type'] = this.type;
    data['group'] = this.group;
    data['feeUSD'] = this.feeUSD;
    data['prizePoolUSD'] = this.prizePoolUSD;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.terrain != null) {
      data['terrain'] = this.terrain!.toJson();
    }
    if (this.lanes != null) {
      data['lanes'] = this.lanes!.map((v) => v.toJson()).toList();
    }
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class Lanes {
  int? laneNumber;
  String? assignedAt;
  int? chickenId;
  String? userWalletId;
  UserWallet? userWallet;
  Chicken? chicken;

  Lanes(
      {this.laneNumber,
        this.assignedAt,
        this.chickenId,
        this.userWalletId,
        this.userWallet,
        this.chicken});

  Lanes.fromJson(Map<String, dynamic> json) {
    laneNumber = json['laneNumber'];
    assignedAt = json['assignedAt'];
    chickenId = json['chickenId'];
    userWalletId = json['userWalletId'];
    userWallet = json['userWallet'] != null
        ? new UserWallet.fromJson(json['userWallet'])
        : null;
    chicken =
    json['chicken'] != null ? new Chicken.fromJson(json['chicken']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['laneNumber'] = this.laneNumber;
    data['assignedAt'] = this.assignedAt;
    data['chickenId'] = this.chickenId;
    data['userWalletId'] = this.userWalletId;
    if (this.userWallet != null) {
      data['userWallet'] = this.userWallet!.toJson();
    }
    if (this.chicken != null) {
      data['chicken'] = this.chicken!.toJson();
    }
    return data;
  }
}

class UserWallet {
  String? username;

  UserWallet({this.username});

  UserWallet.fromJson(Map<String, dynamic> json) {
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    return data;
  }
}

class Chicken {
  int? id;
  String? chknId;
  String? heritage;
  int? perfection;
  String? stock;
  String? talent;
  String? image;
  String? gender;
  String? animal;
  String? baseBody;
  String? stripes;
  String? eyesType;
  String? beakColor;
  String? beakAccessory;
  String? combColor;
  String? wattleColor;
  String? legs;
  String? background;
  int? races;
  int? firsts;
  int? seconds;
  int? thirds;
  dynamic earnings;
  String? situation;
  int? poPoints;
  String? hair;
  String? necklace;
  String? glasses;
  String? jacket;
  String? shoes;
  String? fatherID;
  String? motherID;
  String? name;
  int? chickRaces;
  String? createdAt;
  String? updatedAt;
  int? position;
  String? owner;
  double? cumulativeSegmentSize;
  double? raceEarnings;

  Chicken(
      {this.id,
        this.chknId,
        this.heritage,
        this.perfection,
        this.stock,
        this.talent,
        this.image,
        this.gender,
        this.animal,
        this.baseBody,
        this.stripes,
        this.eyesType,
        this.beakColor,
        this.beakAccessory,
        this.combColor,
        this.wattleColor,
        this.legs,
        this.background,
        this.races,
        this.firsts,
        this.seconds,
        this.thirds,
        this.earnings,
        this.situation,
        this.poPoints,
        this.hair,
        this.necklace,
        this.glasses,
        this.jacket,
        this.shoes,
        this.fatherID,
        this.motherID,
        this.name,
        this.chickRaces,
        this.createdAt,
        this.updatedAt,
        this.position,
        this.owner,
        this.cumulativeSegmentSize,
        this.raceEarnings});

  Chicken.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chknId = json['chknId'];
    heritage = json['heritage'];
    perfection = json['perfection'];
    stock = json['stock'];
    talent = json['talent'];
    image = json['image'];
    gender = json['gender'];
    animal = json['animal'];
    baseBody = json['baseBody'];
    stripes = json['stripes'];
    eyesType = json['eyesType'];
    beakColor = json['beakColor'];
    beakAccessory = json['beakAccessory'];
    combColor = json['combColor'];
    wattleColor = json['wattleColor'];
    legs = json['legs'];
    background = json['background'];
    races = json['races'];
    firsts = json['firsts'];
    seconds = json['seconds'];
    thirds = json['thirds'];
    earnings = json['earnings'];
    situation = json['situation'];
    poPoints = json['poPoints'];
    hair = json['hair'];
    necklace = json['necklace'];
    glasses = json['glasses'];
    jacket = json['jacket'];
    shoes = json['shoes'];
    fatherID = json['fatherID'];
    motherID = json['motherID'];
    name = json['name'];
    chickRaces = json['chickRaces'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    position = json['position'];
    owner = json['owner'];
    cumulativeSegmentSize = json['cumulativeSegmentSize'];
    raceEarnings = json['raceEarnings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chknId'] = this.chknId;
    data['heritage'] = this.heritage;
    data['perfection'] = this.perfection;
    data['stock'] = this.stock;
    data['talent'] = this.talent;
    data['image'] = this.image;
    data['gender'] = this.gender;
    data['animal'] = this.animal;
    data['baseBody'] = this.baseBody;
    data['stripes'] = this.stripes;
    data['eyesType'] = this.eyesType;
    data['beakColor'] = this.beakColor;
    data['beakAccessory'] = this.beakAccessory;
    data['combColor'] = this.combColor;
    data['wattleColor'] = this.wattleColor;
    data['legs'] = this.legs;
    data['background'] = this.background;
    data['races'] = this.races;
    data['firsts'] = this.firsts;
    data['seconds'] = this.seconds;
    data['thirds'] = this.thirds;
    data['earnings'] = this.earnings;
    data['situation'] = this.situation;
    data['poPoints'] = this.poPoints;
    data['hair'] = this.hair;
    data['necklace'] = this.necklace;
    data['glasses'] = this.glasses;
    data['jacket'] = this.jacket;
    data['shoes'] = this.shoes;
    data['fatherID'] = this.fatherID;
    data['motherID'] = this.motherID;
    data['name'] = this.name;
    data['chickRaces'] = this.chickRaces;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['position'] = this.position;
    data['owner'] = this.owner;
    data['cumulativeSegmentSize'] = this.cumulativeSegmentSize;
    data['raceEarnings'] = this.raceEarnings;
    return data;
  }
}
