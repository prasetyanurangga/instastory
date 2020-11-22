import "package:flutter/material.dart";
import "package:instastory/models/story_model.dart";
import "package:instastory/models/user_model.dart";
import 'package:cached_network_image/cached_network_image.dart';
import 'package:video_player/video_player.dart';
import "package:instastory/component/animated_bar.dart";
import "package:get/get.dart";

class StoryScreen extends StatefulWidget {
  final UserModel user;
  StoryScreen({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> with SingleTickerProviderStateMixin{
  final _pageCont = PageController();
  StoryModel currentStory = StoryModel();
  AnimationController animaController;
  int currentIndex = 0;
  VideoPlayerController _vidCont;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    currentStory = stories[currentIndex];
    animaController = AnimationController(vsync:this);
    onLoadStory(story : currentStory, toNextPage: false);

    animaController.addStatusListener((status){
    	if(status == AnimationStatus.completed){
    		print("completed");
    		animaController.stop();
    		animaController.reset();
    		setState((){
    			if(currentIndex < (stories.length - 1)){
    				currentIndex++;
    				onLoadStory(story : stories[currentIndex]);

    			}else{
    				Get.back();
    			}
    		});
    	}
    });
  }

  void onLoadStory({StoryModel story, bool toNextPage = true}){
  	animaController.stop();
  	animaController.reset();
  	switch(story.media){
  		case MediaType.image:
  			animaController.duration = story.duration;
  			animaController.forward();
  			break;
  		case MediaType.video:
  			_vidCont = null;
        	_vidCont?.dispose();
	  		_vidCont = VideoPlayerController.network(
		      story.url,
		    );

		    _initializeVideoPlayerFuture = _vidCont.initialize();
		    _initializeVideoPlayerFuture.then((_){
		    	setState((){
		    		animaController.duration = _vidCont.value.duration;
		    		_vidCont.play();
		    		animaController.forward();
		    	});
		    });
  			break;	
  	}

  	if(toNextPage){
  		_pageCont.animateToPage(
  			currentIndex,
  			duration: const Duration(milliseconds : 200),
  			curve : Curves.easeInOut,
  		);
  	}
  }

  @override
  void dispose(){
  	_pageCont.dispose();
  	_vidCont?.dispose();
  	animaController.dispose();
  	super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: GestureDetector(
      	onTapDown: (detail) => onTapStory(detail, currentStory),
      	onTapUp: (detail) => onTapUpStory(detail, currentStory),
      	child : Stack(
	      	children : [
	      		NotificationListener(
	      			onNotification : (notif){
	      				if(notif is ScrollUpdateNotification){
	      					final _index = int.parse(_pageCont.page.toStringAsFixed(0));
	      					setState((){
	      						currentIndex = _index;
	      						currentStory = stories[_index];
	      					});
	      				}
	      			},
	      			child: PageView.builder(
	      			scrollDirection: Axis.horizontal,
	      			controller:_pageCont,
		      			physics: NeverScrollableScrollPhysics(),
		      			itemCount: stories.length,
		      			itemBuilder: (context, index) {
		      				final StoryModel story = stories[index];
		      				switch(story.media){
		      					case MediaType.image:
			      					return CachedNetworkImage(
							  			imageUrl:story.url,
							  			placeholder: (context,  url) => Center( child: CircularProgressIndicator()),
							  			fit: BoxFit.cover,
							  		);
							  	case MediaType.video:
							  		return FutureBuilder(
									  future: _initializeVideoPlayerFuture,
									  builder: (context, snapshot) {
									    if (snapshot.connectionState == ConnectionState.done) {
									    	_vidCont.play();
									      return FittedBox(
					                        fit: BoxFit.cover,
					                        child: SizedBox(
					                          width: _vidCont.value.size.width,
					                          height: _vidCont.value.size.height,
					                          child: VideoPlayer(_vidCont),
					                        ),
					                      );
									    } else {
									      // If the VideoPlayerController is still initializing, show a
									      // loading spinner.
									      return Center(child: CircularProgressIndicator());
									    }
									  },
									);	
		      				}

		      				return const SizedBox.shrink();
		      			}
		      		)
	      		),
	      		Positioned(
	      			left: 10,
	      			right: 10,
	      			top : MediaQuery.of(context).padding.top + 10,
	      			child : Column(
	      				children : [
	      					Row(
				      			children : List.generate(stories.length, (index){
				      				return AnimatedBar(
				      					animaController: animaController,
				      					position: index,
				      					currentIndex: currentIndex,
				      				);
				      			}),

				      		),
				      		Padding(
				      			padding: EdgeInsets.all(8.0),
				      			child :Row(
					      			children: [
					      				SizedBox(
					      					width : 40,
					      					height : 40,
					      					child :CircleAvatar(
						      					radius: 50,
						      					backgroundImage: NetworkImage(widget.user.profilImage)
						      				),
					      				),
					      				SizedBox(width: 10),
					      				Expanded( child: Text(widget.user.name, style : Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white))),

					      				IconButton(
					      					icon : Icon(Icons.clear, color: Colors.white),
					      					onPressed: (){
					      						Get.back();
					      					},
					      				),
					      			]
					      		)
				      		),
	      				],
	      			),
	      		),
	      	],
	    ),
      )
    );
  }

  

  void onTapUpStory(TapUpDetails detail, StoryModel story){
  	if(story.media == MediaType.video){
  			if(!_vidCont.value.isPlaying){
  				_vidCont.play();
  				animaController.forward();
  			}
	}else{
		animaController.forward();
	}
  }

  void onTapStory(TapDownDetails detail, StoryModel story){
  	final sizeScreen = MediaQuery.of(context).size;
  	final leftScreen = sizeScreen.width * 0.3;
  	final rightScreen = sizeScreen.width * 0.6;
  	final currentPosition = detail.globalPosition.dx;
  	print(leftScreen);
  	print(rightScreen);
  	print(detail.globalPosition.dx);

  	if(currentPosition <= leftScreen && currentIndex != 0){
  		
  		setState((){
  			currentIndex--;
  			onLoadStory(story : stories[currentIndex]);
  		});
  	}
  	else if(currentPosition >= rightScreen && currentIndex != (stories.length - 1)){
  		setState((){
  			currentIndex++;
  			onLoadStory(story : stories[currentIndex]);
  		});
  	}
  	else if((currentPosition <= leftScreen && currentIndex == 0) || (currentPosition >= rightScreen && currentIndex == (stories.length - 1))){
  		Get.back();
  	}
  	else{
  		if(story.media == MediaType.video){
  			if(_vidCont.value.isPlaying){
  				_vidCont.pause();
  				animaController.stop();
  			}
  		}else{
  			animaController.stop();
  		}

  	}
  }
}
