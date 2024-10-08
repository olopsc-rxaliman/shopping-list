import "package:hive_flutter/hive_flutter.dart";

class HiveFunctions {
  static const boxName = "shopping list";
  static final box = Hive.box(boxName);

  static addItem(Map data) => box.add(data);

  static List getAllItems() {
    final data = box.keys.map((key) {
      final value = box.get(key);
      return {
        'key': key,
        'name': value['name'],
        'quantity': value['quantity'],
      };
    }).toList();

    return data.toList();
  }

  static Map getItem(int key) => box.get(key);

  static deleteItem(int key) => box.delete(key);
  static deleteAllItems() => box.deleteAll(box.keys);
}