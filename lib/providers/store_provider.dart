import 'package:flutter/material.dart';
import 'package:sea_night_be_brave/services/preferences_services.dart';

class StoreProvider extends ChangeNotifier {
  final PreferencesService _service;

  StoreProvider({
    required PreferencesService service,
  }) : _service = service;
}
