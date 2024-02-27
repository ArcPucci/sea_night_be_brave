sealed class Box {
  String get skin;

  bool isOpened = false;

  void use() {
    isOpened = true;
  }
}

extension Skin on Box {
  String get getSkin {
    if (isOpened) {
      return skin;
    }
    return '';
  }
}

class User extends Box {
  @override
  final String skin;

  User(this.skin);
}

class Empty extends Box {
  @override
  String get skin => "assets/png/cells/empty.png";
}

class Finish extends Box {
  @override
  String get skin => "assets/png/cells/exit.png";
}

class Gold extends Box {
  @override
  String get skin => "assets/png/cells/gold.png";
}

class Diamond extends Box {
  @override
  String get skin => "assets/png/cells/diamond.png";
}

class Emerald extends Box {
  @override
  String get skin => "assets/png/cells/emerald.png";
}

class LuckyCoin extends Box {
  @override
  String get skin => "assets/png/cells/lucky.png";
}

class UnluckyCoin extends Box {
  @override
  String get skin => "assets/png/cells/unlucky.png";
}

class Worm extends Box {
  @override
  String get skin => "assets/png/cells/worm.png";
}

class Shark extends Box {
  @override
  String get skin => "assets/png/cells/shark.png";
}