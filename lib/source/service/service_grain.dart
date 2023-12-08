import 'package:final_homework/core/database/database_helper.dart';
import 'package:final_homework/source/models/grain_model.dart';

class ServiceGrain {
  static Future<int> addGrain() async {
    GrainModel newGrain = GrainModel(
      time: '24:00',
      lightPower: 5000,
      heat: 20,
      percentOfHumidity: 60,
      irrigationTime: 60,
      irrigationInterval: 120,
      slopeDegree: 15.0,
    );
    int insertedId = await DatabaseHelper.instance.insertGrain(newGrain);
    return insertedId;
  }

  static Future<List<GrainModel>> readGrains() async {
    List<GrainModel> allGrains = await DatabaseHelper.instance.getAllGrains();
    return allGrains;
  }
}
