class CharacterModel {
  Info info;
  List<Character> results;

  CharacterModel({
    required this.info,
    required this.results,
  });

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      info: Info.fromMap(map['info']),
      results: (map['results'] as List<dynamic>)
          .map((e) => Character.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Character {
  String name;
  String status;
  String species;
  String? type;
  String gender;
  Origin origin;
  Location location;
  String image;
  List<dynamic> episode;

  Character({
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
  });

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      name: map['name'] as String,
      status: map['status'] as String,
      species: map['species'] as String,
      type: map['type'] as String,
      gender: map['gender'] as String,
      origin: Origin.fromMap(map['origin']),
      location: Location.fromMap(map['location']),
      image: map['image'] as String,
      episode: (map['episode'] as List),
    );
  }
}

class Location {
  String name;
  String url;

//<editor-fold desc="Data Methods">

  Location({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'url': this.url,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

//</editor-fold>
}

class Origin {
  String name;
  String url;

//<editor-fold desc="Data Methods">

  Origin({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'url': this.url,
    };
  }

  factory Origin.fromMap(Map<String, dynamic> map) {
    return Origin(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

//</editor-fold>
}

class Info {
  int count;
  int pages;
  String? next;
  String? prev;

//<editor-fold desc="Data Methods">

  Info({
    required this.count,
    required this.pages,
    required this.next,
    this.prev,
  });

  Map<String, dynamic> toMap() {
    return {
      'count': this.count,
      'pages': this.pages,
      'next': this.next,
      'prev': this.prev,
    };
  }

  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      count: map['count'] as int,
      pages: map['pages'] as int,
      next: map['next'] as String?,
      prev: map['prev'] as String?,
    );
  }

//</editor-fold>
}
