import 'package:sea_night_be_brave/models/models.dart';
import 'package:sea_night_be_brave/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final SharedPreferences _preferences;

  const PreferencesService({
    required SharedPreferences preferences,
  }) : _preferences = preferences;

  static const premiumKey = 'PREMIUM';
  static const skinsKey = 'SKINS';
  static const bgKey = 'BG_KEY';
  static const coinsKey = 'COINS';
  static const selectedSkinKey = 'SELECTED_SKIN';
  static const selectedBGKey = 'SELECTED_BG';

  Future<void> setCoins(int coins) async {
    await _preferences.setInt(coinsKey, coins);
  }

  int getCoins() {
    return _preferences.getInt(coinsKey) ?? 100;
  }

  Future<void> setPremium() async {
    await _preferences.setBool(premiumKey, true);
  }

  bool getPremium() {
    return _preferences.getBool(premiumKey) ?? false;
  }

  Future<void> setSkins(List<CharacterCard> skins) async {
    final map = skins.map((e) => e.id.toString()).toList();
    await _preferences.setStringList(skinsKey, map);
  }

  List<CharacterCard> getSkins() {
    final map = _preferences.getStringList(skinsKey) ?? [];
    if (map.isEmpty) return [characterCards.first];
    final data = map.map((e) => int.parse(e)).toList();
    final skins = characterCards.where((e) => data.contains(e.id)).toList();
    return skins;
  }

  Future<void> setSkin(CharacterCard card) async {
    await _preferences.setInt(selectedSkinKey, card.id);
  }

  CharacterCard getSkin() {
    final id = _preferences.getInt(selectedSkinKey) ?? 0;
    final skin = characterCards.firstWhere((e) => e.id == id);
    return skin;
  }

  Future<void> setBackgrounds(List<BGCard> bg) async {
    final map = bg.map((e) => e.id.toString()).toList();
    await _preferences.setStringList(bgKey, map);
  }

  List<BGCard> getBackgrounds() {
    final map = _preferences.getStringList(bgKey) ?? [];
    if (map.isEmpty) return [bgCards.first];
    final data = map.map((e) => int.parse(e)).toList();
    final bg = bgCards.where((e) => data.contains(e.id)).toList();
    return bg;
  }

  Future<void> setBG(BGCard card) async {
    await _preferences.setInt(selectedBGKey, card.id);
  }

  BGCard getBG() {
    final id = _preferences.getInt(selectedBGKey) ?? 0;
    final bg = bgCards.firstWhere((e) => e.id == id);
    return bg;
  }
}
