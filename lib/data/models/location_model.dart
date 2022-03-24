class LocationModel {
  Info info;
  List<Location> results;

  LocationModel({
    required this.info,
    required this.results,
  });

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      info: Info.fromMap(map['info']),
      results: (map['results'] as List<dynamic>)
          .map((e) => Location.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Location {
  String name;
  String type;
  String dimension;

  Location({
    required this.name,
    required this.type,
    required this.dimension,
  });

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      name: map['name'] as String,
      type: map['type'] as String,
      dimension: map['dimension'] as String,
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
