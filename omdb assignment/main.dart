import 'package:flutter/material.dart';

import 'HomeScreen.dart';

void main(){
  runApp(MaterialApp(home: Myapp(),));
}

class Myapp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'flutfix',

    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
  home: HomeScreen(),
    );
  }
}
