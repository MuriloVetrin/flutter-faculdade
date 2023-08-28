class Film {
  final String title;
  final String director;
  final String releaseDate;
  final List<String> characters;
  
  Film({
    required this.title,
    required this.director,
    required this.releaseDate,
    required this.characters,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      title: json['title'],
      director: json['director'],
      releaseDate: json['release_date'],
      characters: List<String>.from(json['characters']),
    );
  }
}
