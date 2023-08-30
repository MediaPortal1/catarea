import 'dart:async';
import 'package:flutter/material.dart';

class CatLoader extends StatefulWidget{
  const CatLoader({super.key});

  @override
  State createState() => CatLoaderState();
}

class CatLoaderState extends State<CatLoader>{
  
  bool isHelloKitty = false;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    runTimer();
  }


  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 62, height: 62, child:
        Image.asset(isHelloKitty ? 'assets/images/cat_load.png' : 'assets/images/cat_load2.png')
      );
  }

  void runTimer(){
   timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
     setState(() {
       isHelloKitty = !isHelloKitty;
     });
   });
  }
}