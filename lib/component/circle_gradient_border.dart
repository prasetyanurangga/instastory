import "package:flutter/material.dart";
import "package:instastory/models/user_model.dart";
import 'package:cached_network_image/cached_network_image.dart';
import 'package:video_player/video_player.dart';

class CircleGradientBorder extends StatelessWidget {
  final String url;
  final double width, height, tickBorder;
  const CircleGradientBorder({
    Key key,
    @required this.url,
    @required this.width,
    @required this.height,
    @required this.tickBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width : width,
      height : height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: new LinearGradient(
          colors: [Colors.purple, Colors.orange],
        ),
      ),
      padding: EdgeInsets.all(tickBorder),
      child : Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
        padding: EdgeInsets.all(tickBorder),
        child : CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(url)
        ),
      ),
    );  
  }
}
