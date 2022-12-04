import 'dart:convert';

import 'package:get_storage/get_storage.dart';

final box = GetStorage('AppNameStorage');

// /// write a storage key's value
// saveListWithGetStorage(String storageKey, List<dynamic> storageValue) async =>
//     await box.write(/*key:*/ storageKey, /*value:*/ jsonEncode(storageValue));
//
// /// read from storage
// readWithGetStorage(String storageKey) => box.read(storageKey);

class GetStorageServices {
  saveListWithGetStorage(String storageKey, List<dynamic> storageValue) async =>
      await box.write(/*key:*/ storageKey, /*value:*/ jsonEncode(storageValue));

  readWithGetStorage(String storageKey) {
    var storage = box.read(storageKey);
    print(storage);
    return storage;
  }
}

saveList(List<dynamic> listNeedToSave) {
  /// getting all saved data
  String oldSavedData =
      GetStorageServices().readWithGetStorage('saveList').toString();

  /// in case there is saved data
  if (oldSavedData != 'null') {
    /// create a holder list for the old data
    List<dynamic> oldSavedList = jsonDecode(oldSavedData);

    /// append the new list to saved one
    oldSavedList.addAll(listNeedToSave);

    /// save the new collection
    return GetStorageServices()
        .saveListWithGetStorage('saveList', oldSavedList);
  } else {
    /// in case of there is no saved data -- add the new list to storage
    return GetStorageServices()
        .saveListWithGetStorage('saveList', listNeedToSave);
  }
}

/// read from the storage
readList() async {
  var storage = await GetStorageServices().readWithGetStorage('saveList');
  print(storage);
}
