import "package:flutter/material.dart";
import "package:instastory/models/user_model.dart";
import "package:instastory/component/circle_gradient_border.dart";
import 'package:cached_network_image/cached_network_image.dart';
import 'package:video_player/video_player.dart';

class StoryCircle extends StatelessWidget {
  final Function press;
  final UserModel user;

  const StoryCircle({
    Key key,
    @required this.press,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
        child: Column(
          children:[
            CircleGradientBorder(url : user.profilImage, width: 75, height: 75, tickBorder : 3.0),
            Container(
              margin: EdgeInsets.symmetric(vertical: 2),
              child: Text(user.name, style : Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black)),
            )
          ],
        )
      ),
    );  
  }
}
