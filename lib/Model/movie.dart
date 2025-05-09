class Movie {
  final int idMovie;
  final String title;
  final String backdropPath;
  final String posterPath;
  final String overview;
  final String releaseDate;
  final double voteAverage;

  Movie({
    required this.idMovie,
    required this.title,
    required this.backdropPath,
    required this.posterPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      idMovie: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': idMovie,
      'title': title,
      'backdrop_path': backdropPath,
      'poster_path': posterPath,
      'overview': overview,
      'release_date': releaseDate,
      'vote_average': voteAverage,
    };
  }
}
