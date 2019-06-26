class MovieTrailer {
  int id;
  List<TrailerResult> results;

  MovieTrailer.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.results = (json["results"] as Iterable)
      .map((x) => TrailerResult.fromJson(x));
  }
}

class TrailerResult {
  String id;
  String name;
  int size;

  TrailerResult.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.size = json["size"];
  }
}