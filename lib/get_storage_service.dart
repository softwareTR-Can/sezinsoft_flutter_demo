import 'dart:convert';

import 'package:get_storage/get_storage.dart';

final box = GetStorage('AppStorage');

class GetStorageServices {
  saveListWithGetStorage(String storageKey, List<dynamic> storageValue) async =>
      await box.write(/*key:*/ storageKey, /*value:*/ jsonEncode(storageValue));

  readWithGetStorage(String storageKey) {
    var storage = box.read('baskettt');
    print('storage');
    print(storage);
    return storage;
  }
}
