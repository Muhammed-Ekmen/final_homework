class GrainModel {
  int? id;
  String? time;
  int? lightPower;
  int? heat;
  int? percentOfHumidity;
  int? irrigationTime;
  int? irrigationInterval;
  double? slopeDegree;

  GrainModel({
    this.id,
    this.time,
    this.lightPower,
    this.heat,
    this.percentOfHumidity,
    this.irrigationTime,
    this.irrigationInterval,
    this.slopeDegree,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'time': time,
      'lightPower': lightPower,
      'heat': heat,
      'percentOfHumidity': percentOfHumidity,
      'irrigationTime': irrigationTime,
      'irrigationInterval': irrigationInterval,
      'slopeDegree': slopeDegree,
    };
  }
}
