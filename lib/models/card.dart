class CardModel {
  final int id;
  final String title;
  final String asset;
  final int price;

  const CardModel({
    required this.id,
    required this.title,
    required this.asset,
    required this.price,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          asset == other.asset &&
          price == other.price;

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ asset.hashCode ^ price.hashCode;
}