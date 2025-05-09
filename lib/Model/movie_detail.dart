class MovieDetail {
  final String backdropPath;

  MovieDetail({
    required this.backdropPath,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      backdropPath: json['backdrop_path'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'backdrop_path': backdropPath,
    };
  }
}
