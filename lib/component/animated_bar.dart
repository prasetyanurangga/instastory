import "package:flutter/material.dart";
import "package:instastory/models/story_model.dart";
import 'package:cached_network_image/cached_network_image.dart';
import 'package:video_player/video_player.dart';

class AnimatedBar extends StatelessWidget {

  final AnimationController animaController;
  final int position, currentIndex;

  const AnimatedBar({
    Key key,
    @required this.animaController,
    @required this.position,
    @required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
    	child : Padding(
    		padding: const EdgeInsets.symmetric(horizontal: 1.5),
    		child: LayoutBuilder(
    			builder: (context, constraints){
    				return Stack(
    					children: [
    						buildBarContainer(
    							double.infinity,
    							position < currentIndex ? Colors.white : Colors.white.withOpacity(0.5),
    						),
    						position == currentIndex ? AnimatedBuilder(
    							animation: animaController,
    							builder:(context, child){
    								return buildBarContainer(
    									constraints.maxWidth * animaController.value,
    									Colors.white,
    								);
    							}
    						) : const SizedBox.shrink(),
    					],
    				);
    			}
    		),
    	),
    );   
  }

  Container buildBarContainer(double width, Color color){
  	return Container(
  		height: 2.0,
  		width: width,
  		decoration: BoxDecoration(
  			color: color
  		),
  	);
  }
}
