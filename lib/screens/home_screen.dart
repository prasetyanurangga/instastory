import "package:flutter/material.dart";
import "package:instastory/models/story_model.dart";
import "package:instastory/models/user_model.dart";
import "package:instastory/models/post_model.dart";
import "package:instastory/screens/story_screen.dart";
import "package:instastory/screens/explore_screen.dart";
import "package:instastory/component/post_card.dart";
import "package:instastory/constant.dart";
import "package:get/get.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import "package:instastory/component/story_circle.dart";
import "package:instastory/component/story_circle_add.dart";



class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key key
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  int selectedIndex = 0;

  void onTapNavBar(int index) {
    setState(() {
      selectedIndex = index;
    });
    if(index == 1){
      Get.to(ExploreScreen());
    }
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

      final bottomNavigationItem = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home, size: 30),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search, size: 30),
        label: "Search",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add_box_outlined, size: 30),
        label: "Add",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border, size: 30),
        label: "Favorite",
      ),
      BottomNavigationBarItem(
        icon: SizedBox(
            child:CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(users[0].profilImage)
          ),
            width: 30,
            height: 30,
        ),
        label: "Profile",
      ),
    ];


    var parser = EmojiParser();

    final bottomNavBar = BottomNavigationBar(
      elevation: 20,
      items: bottomNavigationItem,
      currentIndex: selectedIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey[600],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: onTapNavBar,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text("Instastory", style: GoogleFonts.lobster(textStyle: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black))),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.camera_alt,
            color: Colors.black
          ),
        ),
        actions:[
          IconButton(
            onPressed : (){},
            icon: Icon(
              Icons.send,
              color: Colors.black
            ),
          )
        ],
      ),
      bottomNavigationBar: bottomNavBar,
      body: RefreshIndicator(
      onRefresh: (){ print("refresh"); }, 
      child : CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.grey[300]),
                ),
              ),
              height: 120,
              child : ListView.builder(
                itemCount: users.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  if(index == 0){
                      return StoryCircleAdd(press: (){
                        Get.to(StoryScreen(user : users[index],));
                      });
                    }else{
                      return StoryCircle(press: (){
                        Get.to(StoryScreen(user : users[index]));
                      }, user : users[index], size: 75, tickBorder: 3.0);
                    }
                }
              ),
            ),
          ),
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



            
           