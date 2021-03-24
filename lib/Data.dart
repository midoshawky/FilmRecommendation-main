import 'package:http/http.dart' as http;

class Data
{
  Future<http.Response> getData(String movieName) async
  {
    var url = Uri.parse('https://movie-recommendersys.herokuapp.com/movie?title=$movieName');
    var response = await http.get(url);
    return response;
  }

  Future<http.Response> getMovieData(String movieName) async
  {
     const String _api_key = "f70840bebfmshbcdb222173f8562p12619fjsn9bf4bad49d6c";
     const String _baseUrl = "api-football-beta.p.rapidapi.com";

     const Map<String, String> _headers = {
        "content-type": "application/json",
        "x-rapidapi-host": "imdb-internet-movie-database-unofficial.p.rapidapi.com",
        "x-rapidapi-key": _api_key,
     };

     Uri uri = Uri.parse("https://imdb-internet-movie-database-unofficial.p.rapidapi.com/film/$movieName");
     final response = await http.get(uri, headers: _headers);

     return response;
  }

  Future<http.Response> getFirstSuggestions(bool adult,) async {
    Uri uri = Uri.parse("https://api.themoviedb.org/3/discover/movie?api_key=46128d5cc50e6dfe2f4a3dc8a0909d60&language=en-US&sort_by=popularity.desc&include_adult=$adult&include_video=false&page=1");
    final response = await http.get(uri);
    return response;
  }
}