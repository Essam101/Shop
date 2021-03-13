import 'package:hive/hive.dart';

class Caching {
  Box<dynamic> box;
  String boxName = "test";

  Future<bool> isBoxOpen() async {
    return Hive.isBoxOpen(boxName);
  }

  closeBox() async {
    await Hive.close();
  }

  clearBox() async {
    box = Hive.box<dynamic>(boxName);
    await box.clear();
  }

  deleteFromDisk() async {
    box = Hive.box<dynamic>(boxName);
    await box.deleteFromDisk();
  }

  cachingData(dynamic value) async {
    box = Hive.box<dynamic>(boxName);
    await box.add(value);
  }

  Future<Iterable<dynamic>> getCachedData() async {
    box = Hive.box<dynamic>(boxName);
    return box.values;
  }
}
