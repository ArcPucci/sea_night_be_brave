import 'package:sea_night_be_brave/models/models.dart';

class CharacterCard extends CardModel {
  final String subTitle;

  CharacterCard({
    required super.id,
    required super.title,
    required this.subTitle,
    required super.asset,
    required super.price,
  });
}
