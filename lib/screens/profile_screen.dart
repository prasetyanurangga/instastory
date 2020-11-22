import "package:flutter/material.dart";
import "package:instastory/models/story_model.dart";
import "package:instastory/models/user_model.dart";
import "package:instastory/models/post_model.dart";
import "package:instastory/screens/story_screen.dart";
import "package:instastory/screens/postingan_screen.dart";
import 'package:cached_network_image/cached_network_image.dart';
import 'package:video_player/video_player.dart';
import "package:instastory/component/animated_bar.dart";
import "package:instastory/component/story_circle.dart";
import "package:instastory/component/story_circle_add.dart";
import "package:instastory/component/post_card.dart";
import "package:instastory/component/preview_card.dart";
import "package:instastory/constant.dart";
import "package:get/get.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class ProfileScreen extends StatefulWidget {

  final UserModel user;

  ProfileScreen({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  TabController _controller;

  void onTapNavBar(int index) {
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    var parser = EmojiParser();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(widget.user.name, style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black)),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black
            ),
          ),
          actions:[
            IconButton(
              icon : Icon(Icons.more_vert, color: Colors.black),
              onPressed: (){
              },
            ),
          ],
        ),
        body: CustomScrollView(
            slivers: <Widget>[
                SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      child : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children : [
                          Padding(
                            padding: EdgeInsets.only(right: 20.0,left: 20.0, top: 20.0),
                            child :Row(
                              children: [
                                SizedBox(
                                    width : 75,
                                    height : 75,
                                    child :CircleAvatar(
                                      radius: 50,
                                      backgroundImage: NetworkImage(widget.user.profilImage)
                                    ),
                                ),
                                
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    children:[
                                      Container(
                                        margin: EdgeInsets.symmetric(vertical: 2),
                                        child: Text("${widget.user.countPost}", style : Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black)),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(vertical: 2),
                                        child: Text("Postingan", style : Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black)),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    children:[
                                      Container(
                                        margin: EdgeInsets.symmetric(vertical: 2),
                                        child: Text("${widget.user.countFollow}", style : Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black)),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(vertical: 2),
                                        child: Text("Pengikut", style : Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black)),
                                      )
                                    ],
                                  ),
                                ),   
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    children:[
                                      Container(
                                        margin: EdgeInsets.symmetric(vertical: 2),
                                        child: Text("${widget.user.countFollowed}", style : Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black)),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(vertical: 2),
                                        child: Text("Mengikuti", style : Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black)),
                                      )
                                    ],
                                  ),
                                ),                   
                              ]
                            )
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                            child :Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.4),
                                  child : Text(widget.user.fullName, style : Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
                                ),  
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.4),
                                  child : Text(widget.user.bio, style : Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black)),
                                ),  
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.4),
                                  child : Text("Diikuti oleh ${users[0].name}, ${users[1].name} dan 9 lainnya", style : Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black)),
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                  height: 30,
                                  child: Row(
                                  children: [
                                    Expanded(
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 4,
                                        ),
                                        color: Colors.blue,
                                        child: Text(
                                          "Ikuti",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .copyWith(
                                                color: Colors.white,
                                              ),
                                        ),
                                        onPressed: () {

                                        },
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                          color: Colors.grey[400],
                                          width: 1,
                                          style: BorderStyle.solid
                                        ), borderRadius: BorderRadius.circular(4)),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 5,
                                        ),
                                        color: Colors.white,
                                        child: Text(
                                          "Kirim Pesan",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .copyWith(
                                                color: Colors.black,
                                              ),
                                        ),
                                        onPressed: () {

                                        },
                                      ),
                                    ),  
                                    SizedBox(width: 10),
                                    SizedBox(width: 30, 
                                      child : FlatButton(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                            color: Colors.grey[400],
                                            width: 1,
                                            style: BorderStyle.solid
                                          ), borderRadius: BorderRadius.circular(4)),
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 5,
                                          ),
                                          color: Colors.white,
                                          child: Icon(Icons.keyboard_arrow_down, color: Colors.black),
                                          onPressed: () {

                                          },
                                        ), 
                                      )          
                                  ]
                                )
                                ),           
                              ]
                            )
                          ),
                          Container(
                            margin:EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 1, color: Colors.grey[300]),
                              ),
                            ),
                            height: 110,
                            child : ListView.builder(
                              itemCount: users.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index){
                                return StoryCircle(press: (){
                                      Get.to(StoryScreen(user : users[index]));
                                    }, user : users[index], size: 60, tickBorder: 2.0);
                              }
                            ),
                          ),
                          TabBar(
                            onTap: (index) {
                             // Tab index when user select it, it start from zero
                            },
                            controller: _controller,

                            indicatorColor: Colors.black,
                            indicator: UnderlineTabIndicator(
                             borderSide: BorderSide(width: 1.0),
                            ),
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey[600],
                            tabs: [
                              Tab(icon: Icon(Icons.grid_on)),
                              Tab(icon: Icon(Icons.monitor)),
                              Tab(icon: Icon(Icons.person)),
                            ],
                          ),
                        ]
                      )
                    ),
                  ],
                ),
              ),
              
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 2.4,
                    crossAxisSpacing: 2.4),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return GestureDetector(
                        onLongPress:(){
                          showDialog(
                            context: context,
                            builder: (_) => Dialog(
                                child: Container(
                                    child: PreviewCard(post : posts[index]),
                                    height: 420,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(20.0))
                              )
                            );
                        },
                      child: Container(
                          child : Stack(
                            children : [
                              Container(
                                width: double.infinity,
                                child: CachedNetworkImage(
                                  imageUrl:posts[index].url[0],
                                  placeholder: (context,  url) => Center( child: CircularProgressIndicator()),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              (posts[index].url.length > 1) ? Positioned(
                                top : 10,
                                right : 10,
                                child : Icon(Icons.copy, color: Colors.white)
                              ): Container(),
                            ]
                          ),
                        )
                    ); 
                  },
                  childCount: posts.length,
                ),
              ),
            ],
          ),
      );
  }
 
}

