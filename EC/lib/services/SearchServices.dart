import 'dart:convert';

import 'Storage.dart';

class SearchServices {
  static setHistoryData(keywords) async {
    String searchList = await Storage.getString('searchList');
    if (searchList != null) {
      List searchListData = json.decode(searchList);
      var hasData = searchListData.any((v) {
        return v == keywords;
      });

      if (!hasData) {
        searchListData.add(keywords);
        await Storage.setString('searchList', json.encode(searchListData));
      }
    } else {
      List tempList = [];
      tempList.add(keywords);
      await Storage.setString('searchList', json.encode(tempList));
    }
  }

  static getHistoryList() async {
    String searchList = await Storage.getString('searchList');
    if (searchList != null) {
      List searchListData = json.decode(searchList);
      return searchListData;
    }
    return [];
  }

  static clearHistoryList() async {
    await Storage.remove('searchList');
  }

  static removeHistoryData(keywords) async {
    String searchList = await Storage.getString('searchList');
    if (searchList != null) {
      List searchListData = json.decode(searchList);
      searchListData.remove(keywords);
      await Storage.setString('searchList', json.encode(searchListData));
    }
  }
}
