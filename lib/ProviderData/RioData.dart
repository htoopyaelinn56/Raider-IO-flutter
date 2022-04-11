import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import '../Database/db.dart';
import '../Database/PlayerDao.dart';
import '../Database/Player.dart';

class RioData extends ChangeNotifier {
  late PlayerDao _dao;
  RioData() {
    _dao = GetIt.instance.get<PlayerDao>();
  }
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

  Future<void> addToCharList(Player p) async {
    _dao.insertPlayer(p);
    notifyListeners();
  }

  Stream<List<Player>> getPlayerStream() {
    return _dao.findAllPlayerByStream();
  }

  Future<bool> checkCharacterInData(Player p) async {
    for (var i in await _dao.findAllPlayer()) {
      if (i.name == p.name) return true;
    }
    return false;
  }

  Future<List<Player>> getPlayerList() async {
    return await _dao.findAllPlayer();
  }

  Future<void> deletePlayer(Player p) async {
    await _dao.deletePlayer(p);
    notifyListeners();
  }

  Future<void> updatePlayer(double io, String spec, String name) async {
    await _dao.updatePlayer(io, spec, name);
    notifyListeners();
  }
}
