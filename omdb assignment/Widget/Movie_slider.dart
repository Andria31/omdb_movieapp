import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Moviesliders extends StatelessWidget {
  const Moviesliders({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
            height: 32),


    Text("Up Coming Movie", style: GoogleFonts.aBeeZee(fontSize: 25,),),
    const SizedBox(height: 32,),
    SizedBox(height: 200, width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.amber,
              height: 200,
              width: 200,


            ),

          );
        },
      ),
    ),
    ],
    );

    }
}
