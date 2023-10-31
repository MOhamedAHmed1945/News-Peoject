import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:master/Models/ProfileUserModels/profile_hive_model.dart';

import '../Constants/constants.dart';

class HiveFunctionBox {
  static const String profileBoxName = kProfileBoxSeven;
  //kProfileBoxSix;
  //kProfileBoxThree; //kProfileBoxTow; //kProfileBox; //'profileBox';kProfileBoxFour;
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProfileHiveModelAdapter());
    await Hive.openBox<ProfileHiveModel>(profileBoxName);
  }
  static Box<ProfileHiveModel> getProfileBox() {
    return Hive.box<ProfileHiveModel>(profileBoxName);
  }

   Future<void> deleteProfiles(List<int> keys) async {
  final box = HiveFunctionBox.getProfileBox();
  await box.deleteAll(keys);
}
}
