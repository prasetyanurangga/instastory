import "package:flutter/material.dart";
import "package:instastory/models/story_model.dart";
import "package:instastory/models/user_model.dart";
import "package:instastory/models/post_model.dart";
import "package:instastory/models/explore_model.dart";
import "package:instastory/screens/story_screen.dart";
import "package:instastory/component/post_card.dart";
import "package:instastory/screens/home_screen.dart";
import "package:instastory/component/cache_image_view.dart";
import "package:instastory/constant.dart";
import "package:get/get.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import "package:instastory/component/story_circle.dart";
import "package:instastory/component/story_circle_add.dart";
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:quiver/iterables.dart';



class ExploreScreen extends StatefulWidget {
  ExploreScreen({
    Key key
  }) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>{
  List<ExploreModel> items = List<ExploreModel>();
  ScrollController _controller;
  var index = 0;
  int selectedIndex = 1;

  void onTapNavBar(int index) {
    setState(() {
      selectedIndex = index;
    });
    if(index == 0){
      Get.to(HomeScreen());
    }
  }

  @override
  void initState() {
    super.initState();
     _controller = ScrollController();
     _controller.addListener(_scrollListener);

      _fetchEntry(index, 20);
      print(exploreList.length);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      print("reach bottom");
      setState((){
          index++;
      });
      _fetchEntry(index, 20);
    }
  }

  _fetchEntry(int pageIndex, int pageSize) async{
      await Future.delayed(Duration(milliseconds: 500));
      final pairs = partition(exploreList, pageSize).toList();
      print(pairs.length);
      if(pairs.length > pageIndex){
        var newItem =  pairs[pageIndex];
        setState((){
            items.addAll(newItem);
        });
      }
      
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
        title: Text("Cari", style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.grey[700])),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: Colors.black
          ),
        ),
        actions:[
          IconButton(
            onPressed : (){},
            icon: Icon(
              Icons.qr_code_scanner,
              color: Colors.black
            ),
          )
        ],
      ),
      bottomNavigationBar: bottomNavBar,
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          new SliverStaggeredGrid.countBuilder(
            crossAxisCount: 3,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) { 
              return Material(
                  child : InkWell(
                  onTap:(){

                    },
                    child: Stack(
                      children: [
                        Center(child: CircularProgressIndicator()),
                        Center(
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: items[index].url,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ],
                    )
                )
              ); 
            },
            staggeredTileBuilder: (int index){
              var newIndex = index+1;
              if(newIndex % 12 == 2  || newIndex % 12 == 10){
                return new StaggeredTile.count(2, 2);
              }else{
                return new StaggeredTile.count(1,1);
              }
            },
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          )  
        ],
      )
    );
  }
 
}