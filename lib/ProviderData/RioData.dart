import 'package:flutter/foundation.dart';
import 'package:raider_io_flutter/DataModel/character.dart';
import '../Database/db.dart';
import '../Database/PlayerDao.dart';
import '../Database/Player.dart';

class RioData extends ChangeNotifier {
  PlayerDao? dao;

  RioData({this.dao});

  bool nameError = false;
  bool realmError = false;

  void checkName(String nameText) {
    if (nameText == '' || nameText == null) {
      nameError = true;
    } else {
      nameError = false;
    }
    notifyListeners();
  }

  void checkRealm(String realmText) {
    if (realmText == '' || realmText == null) {
      realmError = true;
    } else {
      realmError = false;
    }
    notifyListeners();
  }

  String currentRegion = 'US';

  void changeRegion(String region) {
    currentRegion = region;
    notifyListeners();
  }

  bool searchingRio = false;

  void searching() {
    searchingRio = true;
    notifyListeners();
  }

  void searchDone() {
    searchingRio = false;
    notifyListeners();
  }

  List<Character> charList = [];

  void addToCharList(Character c) {
    charList.add(c);
    notifyListeners();
  }

  bool checkCharacterInList(Character c) {
    for (var i in charList) {
      if (i.name == c.name) return true;
    }
    return false;
  }
}
