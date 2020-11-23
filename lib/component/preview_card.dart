import "package:flutter/material.dart";
import "package:instastory/models/user_model.dart";
import "package:instastory/models/post_model.dart";
import "package:instastory/models/story_model.dart";
import "package:instastory/screens/profile_screen.dart";
import 'package:instastory/component/cache_image_view.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:get/get.dart';

import "package:instastory/component/circle_gradient_border.dart";
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'dart:async';

class PreviewCard extends StatefulWidget {
   final PostModel post;
   final Function press;
  

  PreviewCard({
    Key key,
    @required this.press,
    @required this.post,
      }) : super(key: key);
  @override
  _PreviewCardState createState() => _PreviewCardState();
}

class _PreviewCardState extends State<PreviewCard>{
  var currentIndex;
  var currentIndi;
  PageController pageCont;
  double likeIcon;
  bool isLike = false;
  bool isSave = false;
  double positionSave = -80.0;
  int durationNow = 1;
  final FlareControls flareControls = FlareControls();

   void showBottomSave(int durations){
     // var duration = Duration(seconds: 1);
     // Timer _timer = new Timer.periodic(duration, (Timer timer){
     //  print(positionSave);
     //    setState((){
     //        if(durations < 1){
     //          timer.cancel();
     //          positionSave = -80.0;
     //        }else{
     //          positionSave = 0.0;
     //          durations--;
     //        }
     //    });
     //  });
   } 

  @override
  void initState() {
    super.initState();
    currentIndi = 0;
    currentIndex = 0;
    likeIcon = 0.0;
    pageCont = PageController();

  }

  @override
  void dispose(){
    pageCont.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var parser = EmojiParser();
    return GestureDetector(
      onDoubleTap: () async {
          flareControls.play("like");
          setState((){
              isLike = true;
          });
        },
        child: Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child :Row(
                        children: [
                          widget.post.author.hasStory ? 
                          CircleGradientBorder(url : widget.post.author.profilImage, width: 40, height: 40, tickBorder: 2.0) :
                          SizedBox(
                            width : 40,
                            height : 40,
                            child :CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(widget.post.author.profilImage)
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded( 
                            child: GestureDetector(
                              child : Text(widget.post.author.name, style : Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
                              onTap: (){
                                Get.to(ProfileScreen(user: widget.post.author));
                              }
                            )
                          ),

                          IconButton(
                            icon : Icon(Icons.more_vert, color: Colors.black),
                            onPressed: (){
                            },
                          ),
                        ]
                      )
                    ),
                    SizedBox(
                      height: 300,
                      child: Stack(
                          children:[
                            PageView.builder(
                              controller: pageCont,
                              onPageChanged: (index){
                                setState((){
                                  currentIndex = index;
                                });
                              },
                              itemCount: widget.post.url.length,
                              itemBuilder: (context, index){
                                return CacheImageView(
                                  url:widget.post.url[index],
                                );  
                              }
                            ),
                            (widget.post.url.length > 1) ? Positioned(
                                top : 10,
                                right: 10,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.black.withOpacity(0.75),
                                    ),
                                    child: Text("${currentIndex+1}/${widget.post.url.length}", style : Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white, fontWeight: FontWeight.bold))
                                ),
                            ) : Container(),
                            Center(
                              child: SizedBox(
                                width: 80,
                                height: 80,
                                child: FlareActor(
                                  'assets/images/instagram_like.flr',
                                  controller: flareControls,
                                  animation: 'idle',
                                ),
                              ),
                            ),
                            AnimatedPositioned(
                              duration : Duration(milliseconds: 1000),
                              curve: Curves.ease,
                              height: 80,
                              bottom : positionSave,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color:Colors.white,
                                padding:EdgeInsets.all(16),
                                child: Row(
                                    children: [
                                      SizedBox(
                                          width : 50,
                                          height: 50,
                                          child: CacheImageView(
                                            url:widget.post.url[currentIndex],
                                          )

                                      ),
                                      SizedBox(width: 20),
                                      Expanded(child :Text("Disimpan", style : Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black)))
                                    ],
                                )
                              )
                            )
                          ],
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          isLike ? IconButton(
                            icon : Icon(Icons.favorite, color: Colors.red, size: 30),
                            onPressed: (){
                              setState((){
                                  isLike = false;
                              });
                            },
                          ) : IconButton(
                            icon : Icon(Icons.favorite_border, color: Colors.black, size: 30),
                            onPressed: (){
                              setState((){
                                  isLike = true;
                              });
                              flareControls.play("like");
                            },
                          ),
                          IconButton(
                            icon : Icon(Icons.chat_bubble_outline, color: Colors.black, size: 30),
                            onPressed: (){
                            },
                          ),
                          IconButton(
                            icon : Icon(Icons.send, color: Colors.black, size: 30),
                            onPressed: (){
                            },
                          ),
                          IconButton(
                            icon : Icon(Icons.more_vert, color: Colors.black, size: 30),
                            onPressed: (){
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
    );  
  }
}
