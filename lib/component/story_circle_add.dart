import "package:flutter/material.dart";
import "package:instastory/models/user_model.dart";
import 'package:cached_network_image/cached_network_image.dart';
import 'package:video_player/video_player.dart';

class StoryCircleAdd extends StatelessWidget {
  final Function press;

  const StoryCircleAdd({
    Key key,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
        child: Column(
          children:[
            Stack(
                children: [
                  Container(
                    width : 75,
                    height : 75,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(3),
                    child : Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                      padding: EdgeInsets.all(3),
                      child : CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(users[0].profilImage)
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right:5,
                      child: Container(
                          width : 20,
                          height : 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1),
                            color: Colors.blue,
                          ),
                          child : Center(
                              child : Icon(Icons.add, color: Colors.white, size : 15)
                          ),
                        ),
                  )
                ]
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 2),
              child: Text("Cerita Anda", style : Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black)),
            )
          ],
        )
      ),
    );  
  }
}
