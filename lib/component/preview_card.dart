import "package:flutter/material.dart";
import "package:instastory/models/user_model.dart";
import "package:instastory/models/post_model.dart";
import "package:instastory/models/story_model.dart";
import "package:instastory/screens/profile_screen.dart";
import 'package:cached_network_image/cached_network_image.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:get/get.dart';

import "package:instastory/component/circle_gradient_border.dart";
import 'dart:async';

class PreviewCard extends StatefulWidget {
   final PostModel post;

  PreviewCard({
    Key key,
    @required this.post,
      }) : super(key: key);
  @override
  _PreviewCardState createState() => _PreviewCardState();
}

class _PreviewCardState extends State<PreviewCard> with TickerProviderStateMixin {
  var currentIndex = 0;
  var currentIndi;
  PageController pageCont;
  PageController indiCont;
  double likeIcon;
  Animation<double> controller;
  Animation<double> opacity;
  Animation<double> width;
  Animation<double> translate;
  bool isLike = false;
  bool isSave = false;
  double positionSave = -80.0;

  AnimationController _controller;
  AnimationController _controller2;
  int durationNow = 1;


  

    // height = Tween<double>(
    //   begin: 110.0,
    //   end: 100.0
    // ).animate(
    //   CurvedAnimation(
    //     parent: controller,
    //     curve: Interval(
    //       0.250, 0.375,
    //       curve: Curves.ease,
    //     ),
    //   ),
    // ),

   void showBottomSave(int durations){
     var duration = Duration(seconds: 1);
     Timer _timer = new Timer.periodic(duration, (Timer timer){
      print(positionSave);
        setState((){
            if(durations < 1){
              timer.cancel();
              positionSave = -80.0;
            }else{
              positionSave = 0.0;
              durations--;
            }
        });
      });
   } 

  @override
  void initState() {
    super.initState();
    currentIndi = 0;
    likeIcon = 0.0;
    pageCont = PageController();
    indiCont  = PageController(viewportFraction: 0.3);

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this
    );

    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this
    );

    // _controller2.addStatusListener((status){
    //   if(status == AnimationStatus.completed){
    //     print("conplete");
    //     _controller2.reverse();
    //   }
    // });

    controller = _controller.view;

    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, 0.100,
          curve: Curves.bounceInOut,
        ),
      ),
    );

    width = Tween<double>(
      begin: 100.0,
      end: 110.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.125, 0.250,
          curve: Curves.bounceInOut,
        ),
      ),
    );

    translate = Tween<double>(
      begin: -10.0,
      end: 10.0,
    ).animate(_controller2);

  }

  Widget _buildAnimation(BuildContext context, Widget child){
    return Opacity(
        opacity: opacity.value,
        child :Icon(
          Icons.favorite,
          color: Colors.white.withOpacity(0.85),
          size : width.value,
      ),
    );
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  Future<void> _playAnimation2() async {
    try {
      await _controller2.forward().orCancel;
      await _controller2.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  void dispose(){
    pageCont.dispose();
     _controller.dispose();
    indiCont.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var parser = EmojiParser();
    return GestureDetector(
      onDoubleTap: (){
          print("double");
          _playAnimation();
          setState((){
              isLike = true;
          });
        },
        child: Container(
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
                ]
              )
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Stack(
                  children:[
                    NotificationListener(
                      onNotification : (notif){
                        if(notif is ScrollUpdateNotification){
                          final _index = int.parse(pageCont.page.toStringAsFixed(0));
                          setState((){
                            currentIndex = _index;
                          });
                          indiCont.animateToPage(
                            currentIndex,
                            duration: const Duration(milliseconds : 200),
                            curve : Curves.easeInOut,
                          );
                        }
                      },
                      child: PageView.builder(
                            controller: pageCont,
                              itemCount: widget.post.url.length,
                              itemBuilder: (context, index){
                                  return CachedNetworkImage(
                                    imageUrl:widget.post.url[index],
                                    placeholder: (context,  url) => Center( child: CircularProgressIndicator()),
                                    fit: BoxFit.fitWidth,
                                  );  
                              }
                          ),
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
                      child: AnimatedBuilder(
                            animation: controller,
                          builder: _buildAnimation,
                        )
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
                                    child: CachedNetworkImage(
                                      imageUrl:widget.post.url[currentIndex],
                                      placeholder: (context,  url) => Center( child: CircularProgressIndicator()),
                                      fit: BoxFit.fitWidth,
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
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
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
                              _playAnimation();
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
                            onPressed: (){},
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
