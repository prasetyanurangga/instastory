import "package:flutter/material.dart";
import "package:instastory/models/story_model.dart";
import "package:instastory/models/user_model.dart";
import "package:instastory/models/post_model.dart";
import "package:instastory/screens/story_screen.dart";
import "package:instastory/component/post_card.dart";
import "package:instastory/constant.dart";
import "package:get/get.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import "package:instastory/component/story_circle.dart";
import "package:instastory/component/story_circle_add.dart";



class PostinganScreen extends StatefulWidget {
  PostinganScreen({
    Key key
  }) : super(key: key);

  @override
  _PostinganScreenState createState() => _PostinganScreenState();
}

class _PostinganScreenState extends State<PostinganScreen>{


  void onTapNavBar(int index) {
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    var parser = EmojiParser();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text("Postingan", style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black)),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black
          ),
        ),
      ),
      body: RefreshIndicator(
      onRefresh: (){ print("refresh"); }, 
      child : CustomScrollView(
        slivers: [
          PagewiseSliverList(
            pageSize: 2,
            itemBuilder: (context, PostModel entry, _) {
              return PostCard(
                post: entry,
                press:  (){
                  Get.bottomSheet(
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.zero,
                        child : Wrap(
                          children:[
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1, color: Colors.grey[300]),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                              child : Row(
                                children:[
                                  Text(parser.emojify(':heart:'), style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 22)),
                                  SizedBox(width: 10),
                                  Text(parser.emojify(':rolling_on_the_floor_laughing:'), style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 22)),
                                  SizedBox(width: 10),
                                  Text(parser.emojify(':heart_eyes:'), style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 22)),
                                  SizedBox(width: 10),
                                  Text(parser.emojify(':clap:'), style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 22)),
                                  SizedBox(width: 10),
                                  Text(parser.emojify(':raised_back_of_hand:'), style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 22)),
                                  SizedBox(width: 10),
                                  Text(parser.emojify(':fire:'), style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 22)),
                                  SizedBox(width: 10),
                                  Text(parser.emojify(':cry:'), style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 22)),
                                  SizedBox(width: 10),
                                  Text(parser.emojify(':astonished:'), style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 22)),

                                ]
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                              child : Row(
                                children: [
                                  SizedBox(
                                    width : 40,
                                    height : 40,
                                    child :CircleAvatar(
                                      radius: 50,
                                      backgroundImage: NetworkImage(entry.author.profilImage)
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                      child :TextField(
                                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                                              color: Colors.black,
                                              fontSize: 16
                                            ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Tambahkan komentar..."
                                        ),
                                        autofocus: true,  
                                      
                                      ),
                                     
                                  ), 
                                  FlatButton(
                                    child: Text("Posting", style: Theme.of(context).textTheme.bodyText1.copyWith(
                                              color: Colors.cyan,
                                              fontSize: 16
                                            ),))
                                ]
                              )
                            )
                          ]
                        ),
                      ),
                    )
                  );
                }
              );
            },
            pageFuture: (pageIndex) =>
                BackendService.getPosts(pageIndex, 2))
        ],
      ),
    ),
    );
  }
 
}



            
           