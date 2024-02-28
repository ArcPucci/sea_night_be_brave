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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterCard &&
          runtimeType == other.runtimeType &&
          subTitle == other.subTitle;

  @override
  int get hashCode => subTitle.hashCode;
}
