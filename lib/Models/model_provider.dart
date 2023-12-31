import 'package:flutter/material.dart';
import 'package:master/Helper/hive_function_box.dart';
import 'package:master/Models/ProfileUserModels/profile_hive_model.dart';
//import 'package:provider/provider.dart';

class ModelProvider extends ChangeNotifier {
  List<ProfileHiveModel> get profiles =>
      HiveFunctionBox.getProfileBox().values.toList();
  notifyListeners();

  Future<void> deleteProfile(ProfileHiveModel profile) async {
    final box = HiveFunctionBox.getProfileBox();
    await box.delete(profile.key);
    notifyListeners();
  }
}
