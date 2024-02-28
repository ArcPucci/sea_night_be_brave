import 'package:flutter/material.dart';
import 'package:sea_night_be_brave/models/models.dart';
import 'package:sea_night_be_brave/services/preferences_services.dart';
import 'package:sea_night_be_brave/utils/utils.dart';

class StoreProvider extends ChangeNotifier {
  final PreferencesService _service;

  StoreProvider({
    required PreferencesService service,
  }) : _service = service;

  int _coins = 0;

  int get coins => _coins;

  CharacterCard _characterCard = characterCards.first;

  BGCard _bgCard = bgCards.first;

  CharacterCard get characterCard => _characterCard;

  BGCard get bgCard => _bgCard;

  List<int> _characterCards = [0];

  List<int> _bgCards = [0];

  List<int> get boughtCharacters => _characterCards;

  List<int> get boughtBG => _bgCards;

  int get initialSkin => characterCards.indexOf(_characterCard);

  int get initialBG => bgCards.indexOf(_bgCard);

  bool _premium = false;

  bool get premium => _premium;

  void init() {
    _coins = _service.getCoins();
    _characterCard = _service.getSkin();
    _bgCard = _service.getBG();
    _characterCards = _service.getSkins();
    _bgCards = _service.getBackgrounds();
    _premium = _service.getPremium();
  }

  void onSelectSkin(CharacterCard card) async {
    if (_characterCards.contains(card.id)) {
      _characterCard = card;
      await _service.setSkin(card);
    } else {
      if (_coins < card.price) return;
      _coins -= card.price;
      await _service.setCoins(_coins);
      _characterCards.add(card.id);
      await _service.setSkins(_characterCards);
    }
    notifyListeners();
  }

  void onSelectBG(BGCard card) async {
    if (_bgCards.contains(card.id)) {
      _bgCard = card;
      await _service.setBG(card);
    } else {
      if (_coins < card.price) return;
      _coins -= card.price;
      await _service.setCoins(_coins);
      _bgCards.add(card.id);
      await _service.setBackgrounds(_bgCards);
    }
    notifyListeners();
  }

  void onAddMoney(int coins) async {
    _coins += coins;
    await _service.setCoins(_coins);

    notifyListeners();
  }

  void onMinusMoney(int coins) async {
    if (_coins < coins) {
      _coins = 0;
    } else {
      _coins -= coins;
    }
    await _service.setCoins(_coins);

    notifyListeners();
  }

  void onBuyPremium() async {
    _characterCards = characterCards.map((e) => e.id).toList();
    _bgCards = bgCards.map((e) => e.id).toList();

    await _service.setSkins(_characterCards);
    await _service.setBackgrounds(_bgCards);

    _premium = true;
    await _service.setPremium();

    notifyListeners();
  }
}
