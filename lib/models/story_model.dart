import "package:instastory/models/user_model.dart";
import 'package:meta/meta.dart';

enum MediaType{
	image,
	video
}

class StoryModel {
	final String url;
	final MediaType media;
	final Duration duration;
	final UserModel user;

	StoryModel({
		this.url,
		this.media,
		this.duration,
		this.user,
	});
}


final List<StoryModel> stories = [
  StoryModel(
    url:
        'https://instagram.fcgk9-1.fna.fbcdn.net/v/t51.2885-15/e35/123140665_355030995761254_2310892311522765223_n.jpg?_nc_ht=instagram.fcgk9-1.fna.fbcdn.net&_nc_cat=110&_nc_ohc=ljm24KoobZwAX_BxwD3&tp=1&oh=72f6c0784cbe89d8b830741440f10adb&oe=5FE1E4BB',
    media: MediaType.image,
    duration: const Duration(seconds: 10),
    user: users[0],
  ),
  StoryModel(
    url:
        'https://static.videezy.com/system/resources/previews/000/005/529/original/Reaviling_Sjusj%C3%B8en_Ski_Senter.mp4',
    media: MediaType.video,
    duration: const Duration(seconds: 0),
    user: users[0],
  ),
  StoryModel(
    url:
        'https://instagram.fcgk9-2.fna.fbcdn.net/v/t51.2885-15/e35/123122252_2831018413794423_6918510816884912477_n.jpg?_nc_ht=instagram.fcgk9-2.fna.fbcdn.net&_nc_cat=103&_nc_ohc=Z4NuqyYW3bEAX_-M9VW&tp=1&oh=6dd997f08766449488c63ffe58357872&oe=5FE4582B',
    media: MediaType.image,
    duration: const Duration(seconds: 5),
    user: users[0],
  ),
  StoryModel(
    url:
        'https://static.videezy.com/system/resources/previews/000/007/536/original/rockybeach.mp4',
    media: MediaType.video,
    duration: const Duration(seconds: 0),
    user: users[0],
  ),
  StoryModel(
    url: 'https://instagram.fcgk9-2.fna.fbcdn.net/v/t51.2885-15/e35/123088037_2713948552207621_7013735326950843608_n.jpg?_nc_ht=instagram.fcgk9-2.fna.fbcdn.net&_nc_cat=101&_nc_ohc=dNonuUZUxfAAX_uQSbU&tp=1&oh=a526bd06fb7a31ff58334ea65bd174b3&oe=5FE1439A',
    media: MediaType.image,
    duration: const Duration(seconds: 6),
    user: users[0],
  ),
  StoryModel(
    url: 'https://instagram.fcgk9-1.fna.fbcdn.net/v/t51.2885-15/e35/123136813_725212508077121_7155286665660634922_n.jpg?_nc_ht=instagram.fcgk9-1.fna.fbcdn.net&_nc_cat=105&_nc_ohc=d0gBYFReYwUAX-Da3Pz&tp=1&oh=aa5dbfb2a70da260c16d6eb1d2db24d8&oe=5FE325E5',
    media: MediaType.image,
    duration: const Duration(seconds: 5),
    user: users[0],
  ),
  StoryModel(
    url: 'https://instagram.fcgk9-2.fna.fbcdn.net/v/t51.2885-15/e35/121387671_143178944207862_385745950452666140_n.jpg?_nc_ht=instagram.fcgk9-2.fna.fbcdn.net&_nc_cat=106&_nc_ohc=SeSoZVZJRGIAX9rnBDH&tp=1&oh=2e5afe6f9e6cca0e60b4cc80c98d603f&oe=5FE15152',
    media: MediaType.image,
    duration: const Duration(seconds: 4),
    user: users[0],
  ),
  StoryModel(
    url: 'https://instagram.fcgk9-2.fna.fbcdn.net/v/t51.2885-15/e35/121616477_3108305179297323_3203251949371626130_n.jpg?_nc_ht=instagram.fcgk9-2.fna.fbcdn.net&_nc_cat=103&_nc_ohc=pL6-tagVEegAX9vm6qH&tp=1&oh=c24c0a1381f747d38917304086b12ac8&oe=5FE34272',
    media: MediaType.image,
    duration: const Duration(seconds: 8),
    user: users[0],
  ),
  StoryModel(
    url: 'https://media.giphy.com/media/moyzrwjUIkdNe/giphy.gif',
    media: MediaType.image,
    user: users[0],
    duration: const Duration(seconds: 7),
  ),
];