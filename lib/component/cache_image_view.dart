import "package:flutter/material.dart";
import 'package:transparent_image/transparent_image.dart';

class CacheImageView extends StatelessWidget {
  final String url;

  const CacheImageView({
    Key key,
    @required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: CircularProgressIndicator()),
        Center(
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: url,
            fit: BoxFit.cover,
            height: 400,
            width: double.infinity,
          ),
        ),
      ],
    );  
  }
}
