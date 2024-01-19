class MovieDetailModel {
  final String title, backdropPath, overview;
  final int id;
  final int runtime;
  final double voteAverage;
  final List<Map<String, dynamic>> genre;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        backdropPath = json['backdrop_path'],
        id = json['id'],
        runtime = json['runtime'],
        voteAverage = json['vote_average'].toDouble(),
        overview = json['overview'],
        genre = json['genres'].map<Map<String, dynamic>>((genre) {
          return {
            'name': genre['name'],
            'id': genre['id'],
          };
        }).toList();
}
