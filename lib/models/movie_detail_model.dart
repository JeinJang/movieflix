class MovieDetailModel {
  final String originalTitle, backdropPath, overview;
  final int id;
  final List<Map<String, dynamic>> genre;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : originalTitle = json['original_title'],
        backdropPath = json['backdrop_path'],
        id = json['id'],
        overview = json['overview'],
        genre = json['genres'].map<Map<String, dynamic>>((genre) {
          return {
            'name': genre['name'],
            'id': genre['id'],
          };
        }).toList();
}
