import 'package:hive/hive.dart';

class HiveDB {
  static String DB_NAME = "cardInfo";
  static var box = Hive.box(DB_NAME);

  static void storeNotes(String cardInfo) async {
    box.put("info", cardInfo);
  }

  static String? loadNotes() {
    return box.get("info");
  }

  static Future<void> removeUid() {
    return box.delete("info");
  }
}
