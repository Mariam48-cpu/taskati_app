import 'package:hive_ce_flutter/hive_ce_flutter.dart';

class HiveProvider {
  static const String userBoxName = 'userBox';
  static const String kName = 'Name';
  static const String kImage = 'Image';

  static late Box _userBox;
  static Future<void> init() async {
    await Hive.initFlutter();
    _userBox = await Hive.openBox('userBox');
  }

  static Future<void> casheData(String key, dynamic value) async {
    await _userBox.put(key, value);
  }

  static dynamic getData(String key) {
    return _userBox.get(key);
  }

  static void caschedUserData({
    required String name,
    required String imagePath,
  }) {
    casheData(kImage, imagePath);
    casheData(kName, name);
  }
}
