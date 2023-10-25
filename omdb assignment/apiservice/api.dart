import 'package:practice_a/omdb%20assignment/Models/Moviedb.dart';
import 'package:http/http.dart' as http;

class Api{
 static const trendingUrl ="http://www.omdbapi.com/?i=tt3896198&apikey=f5c15fac" ;

 Future<Movie>getTrendingMovies()async{
  final response = await http.get(Uri.parse("http://www.omdbapi.com/?i=tt3896198&apikey=f5c15fac"));
  if(response.statusCode == 200){
   var data =response.body;
   return Movie.fromJson(data as Map<String,dynamic> );
  }else{
   throw Exception("Something happened");
  }
 }
}
// class Http{
//  static Future<MovieModel>fetchMovie() async{
//   var response = await http.get(Uri.parse("http://www.omdbapi.com/?i=tt3896198&apikey=f5c15fac"));
//   if(response.statusCode == 200){
//    var data =response.body;
//    return MovieModel.fromJson(data as Map<String,dynamic> );
//   }else{
//    throw Exception();
//   }
//  }
// }