import 'package:hanzo/data/models/models.dart';

import '../../../service/service.dart';

class HomeRepository {
  HttpManager httpManager = HttpManager();
  //Search
  Future<List<Movie>> getMovie() async {
    List<Movie> movies = [];
    final result = await httpManager.restRequest(
      url: 'https://movies-api14.p.rapidapi.com/shows',
      method: HttpMethods.get,
      headers: {
        'X-RapidAPI-Key': '519ab425efmsh6146fb5520ec102p17665ejsn552ed66dbf5a',
        'x-rapidapi-host': 'movies-api14.p.rapidapi.com'
      },
    );
    for (var i = 0; i < result.data['movies'].length; i++) {
      movies.add(
        Movie.fromJson(result.data['movies'][i]),
      );
    }
    return movies;
  }
}
