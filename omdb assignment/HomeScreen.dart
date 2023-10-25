import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_a/omdb%20assignment/Widget/Movie_slider.dart';
import 'package:practice_a/omdb%20assignment/Widget/TrendingSliderss.dart';

import 'Models/Moviedb.dart';
import 'apiservice/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  late Future<List<Movie>> trendingMovies;


  @override
  void initState(){
    super.initState();
    trendingMovies =Api().getTrendingMovies() as Future<List<Movie>>;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,
      elevation: 0,
      title:Center(child: Text("FLUTFLIX",style: TextStyle(color: Colors.red,fontSize: 40),))),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Trending movie",style: GoogleFonts.abel(fontSize: 25),),
              SizedBox(height: 32,),
             SizedBox(
               child: FutureBuilder(
                 future: trendingMovies,
                 builder: (context, snapshot) {
                   if (snapshot.connectionState == ConnectionState.waiting) {
                     return CircularProgressIndicator();
                   } else if (snapshot.hasError) {
                     return Text('Error: ${snapshot.error}');
                   } else {
                     // Return your widget based on the data from the Future
                     return TrendingSlider(snapshot: snapshot,);
                   }
                 },
               ),
               ),
               //refactor

              const SizedBox(height: 32,),
              
              Text("top rated movies",style: GoogleFonts.aBeeZee(fontSize: 25,),),
              const SizedBox(height: 32,),
              SizedBox(height: 200,width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.amber,
                      height: 200,
                      width: 200

                      ),

                  );
                },
              ),
              ),
               const Moviesliders(),

            ],
          ),
        ),
      ),
    );
  }
}
