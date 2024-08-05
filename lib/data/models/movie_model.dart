class Movie {
  int? iId;
  String? backdropPath;
  String? firstAired;
  List<String>? genres;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? title;
  String? contentType;

  Movie(
      {this.iId,
      this.backdropPath,
      this.firstAired,
      this.genres,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.title,
      this.contentType});

  Movie.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    backdropPath = json['backdrop_path'];
    firstAired = json['first_aired'];
    genres = json['genres'].cast<String>();
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    title = json['title'];
    contentType = json['contentType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = iId;
    data['backdrop_path'] = backdropPath;
    data['first_aired'] = firstAired;
    data['genres'] = genres;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['title'] = title;
    data['contentType'] = contentType;
    return data;
  }
}
