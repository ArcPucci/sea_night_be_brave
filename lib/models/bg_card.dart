import 'package:sea_night_be_brave/models/models.dart';

class BGCard extends CardModel {
  final String image;

  BGCard({
    required super.id,
    required super.title,
    required super.asset,
    required this.image,
    required super.price,
  });
}
