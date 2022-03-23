class EpisodeModel {
  Info info;
  List<Episode> results;

  EpisodeModel({
    required this.info,
    required this.results,
  });

  factory EpisodeModel.fromMap(Map<String, dynamic> map) {
    return EpisodeModel(
      info: Info.fromMap(map['info']),
      results: (map['results'] as List<dynamic>)
          .map((e) => Episode.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Episode {
  String name;
  String air_date;
  String episode;
  List<dynamic> characters;

  Episode({
    required this.name,
    required this.air_date,
    required this.episode,
    required this.characters,
  });

  factory Episode.fromMap(Map<String, dynamic> map) {
    return Episode(
      name: map['name'] as String,
      air_date: map['air_date'] as String,
      episode: map['episode'] as String,
      characters: map['characters'] as List,
    );
  }
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
