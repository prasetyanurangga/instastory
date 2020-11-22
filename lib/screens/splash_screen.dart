import "package:flutter/material.dart";
import "package:instastory/screens/home_screen.dart";
import 'package:cached_network_image/cached_network_image.dart';
import 'package:video_player/video_player.dart';
import "package:instastory/component/animated_bar.dart";
import "package:instastory/component/story_circle.dart";
import "package:instastory/component/story_circle_add.dart";
import "package:instastory/component/post_card.dart";
import "package:instastory/constant.dart";
import "package:get/get.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  SplashScreen({
    Key key
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    super.initState();
    nextPage(2);
  }

  void nextPage(int durations){
     var duration = Duration(seconds: 1);
     Timer _timer = new Timer.periodic(duration, (Timer timer){
      print(durations);
        setState((){
            if(durations < 1){
              timer.cancel();
              Get.to(HomeScreen());
            }else{
              durations--;
            }
        });
      });
   } 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(



















              child : SizedBox(child:Image.asset("assets/images/logo_ig.png"), width: 100, height: 100),
          )
      )
    );
  }
 
}

