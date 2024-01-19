class MovieModel {
  final String title, backdropPath;
  final int id;

  MovieModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        backdropPath = json['backdrop_path'],
        id = json['id'];
}
