
import 'package:firebase_flutter/hive_feature/local_data_source.dart';

class HiveDataSource extends LocalDataSource {
  @override
  Future<bool> isFirstInstalled() async {
    try {
      final hiveAuthBox = await HiveSetup.openBox('FIRST_INSTALL_BOX');
      /// Check key for in the box
      final result = await hiveAuthBox.get('status');
      return (result ?? true) ;
    } catch (e) {
      return true;
    }
  }

  @override
  Future<bool> updateFirstInstalled(bool value) async {
    try {
      final hiveAuthBox = await HiveSetup.openBox('FIRST_INSTALL_BOX');
      await hiveAuthBox.put('status', value);
      var result = await isFirstInstalled();
      return result;
    } catch (e) {}
    return false;
  }
}

class HiveSetup {
  static openBox(String s) {}
}
