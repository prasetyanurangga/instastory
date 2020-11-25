import "package:instastory/models/user_model.dart";
import "package:instastory/models/explore_model.dart";
import 'package:meta/meta.dart';
import 'package:quiver/iterables.dart';

enum MediaType{
	image,
	video
}

class PostModel {
	final List<String> url;
	final MediaType media;
	final UserModel author;
  final UserModel lastLike;
  final String time;
  final String desc;

	PostModel({
		this.url,
		this.media,
		this.author,
		this.lastLike,
    this.time,
    this.desc,
	});
}


final List<PostModel> posts = [
  PostModel(
    url: [
        'https://instagram.fcgk9-1.fna.fbcdn.net/v/t51.2885-15/e35/123136813_725212508077121_7155286665660634922_n.jpg?_nc_ht=instagram.fcgk9-1.fna.fbcdn.net&_nc_cat=105&_nc_ohc=d0gBYFReYwUAX-Da3Pz&tp=1&oh=aa5dbfb2a70da260c16d6eb1d2db24d8&oe=5FE325E5',
    ],
    media: MediaType.image,
    author: users[2],
    lastLike: users[0],
    time: "3 minggu",
    desc: "holi-day",
  ),
  PostModel(
    url: [
        'https://instagram.fcgk9-1.fna.fbcdn.net/v/t51.2885-15/e35/123140665_355030995761254_2310892311522765223_n.jpg?_nc_ht=instagram.fcgk9-1.fna.fbcdn.net&_nc_cat=110&_nc_ohc=ljm24KoobZwAX_BxwD3&tp=1&oh=72f6c0784cbe89d8b830741440f10adb&oe=5FE1E4BB',
    ],
    media: MediaType.image,
    author: users[2],
    lastLike: users[0],
    time: "3 minggu",
    desc: "love yourself;love myself [3/3]",
  ),
  PostModel(
    url: [
        'https://instagram.fcgk9-2.fna.fbcdn.net/v/t51.2885-15/e35/123122252_2831018413794423_6918510816884912477_n.jpg?_nc_ht=instagram.fcgk9-2.fna.fbcdn.net&_nc_cat=103&_nc_ohc=Z4NuqyYW3bEAX_-M9VW&tp=1&oh=6dd997f08766449488c63ffe58357872&oe=5FE4582B',
    ],
    media: MediaType.image,
    author: users[2],
    lastLike: users[0],
    time: "3 minggu",
    desc: "love yourself;love myself [2/3]",
  ),
  PostModel(
    url: [
        'https://instagram.fcgk9-2.fna.fbcdn.net/v/t51.2885-15/e35/123088037_2713948552207621_7013735326950843608_n.jpg?_nc_ht=instagram.fcgk9-2.fna.fbcdn.net&_nc_cat=101&_nc_ohc=dNonuUZUxfAAX_uQSbU&tp=1&oh=a526bd06fb7a31ff58334ea65bd174b3&oe=5FE1439A',
    ],
    media: MediaType.image,
    author: users[2],
    lastLike: users[0],
    time: "3 minggu",
    desc: "love yourself;love myself [1/3]",
  ),
  
  PostModel(
    url: [
        'https://instagram.fcgk9-2.fna.fbcdn.net/v/t51.2885-15/e35/121387671_143178944207862_385745950452666140_n.jpg?_nc_ht=instagram.fcgk9-2.fna.fbcdn.net&_nc_cat=106&_nc_ohc=SeSoZVZJRGIAX9rnBDH&tp=1&oh=2e5afe6f9e6cca0e60b4cc80c98d603f&oe=5FE15152',
    ],
    media: MediaType.image,
    author: users[2],
    lastLike: users[0],
    time: "5 minggu",
    desc: "3/",
  ),
  PostModel(
    url: [
        'https://instagram.fcgk9-2.fna.fbcdn.net/v/t51.2885-15/e35/121616477_3108305179297323_3203251949371626130_n.jpg?_nc_ht=instagram.fcgk9-2.fna.fbcdn.net&_nc_cat=103&_nc_ohc=pL6-tagVEegAX9vm6qH&tp=1&oh=c24c0a1381f747d38917304086b12ac8&oe=5FE34272',
    ],
    media: MediaType.image,
    author: users[2],
    lastLike: users[0],
    time: "5 minggu",
    desc: "2/",
  ),
  PostModel(
    url: [
        'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'
    ],
    media: MediaType.image,
    author: users[1],
    lastLike: users[0],
    time: "1 bulan",
    desc: "Lrem Ipsum dlor sir amet",
  ),
  PostModel(
    url: [
        'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
        'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
          'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
        'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
    ],
    media: MediaType.image,
    author: users[0],
    lastLike: users[1],
    time: "1 bulan",
    desc: "Lrem Ipsum dlor sir amet",
  ),
  
  PostModel(
    url: [
        'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'
    ],
    media: MediaType.image,
    author: users[1],
    lastLike: users[0],
    time: "1 bulan",
    desc: "Lrem Ipsum dlor sir amet",
  ),
  PostModel(
    url: [
        'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
        'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
          'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
        'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
    ],
    media: MediaType.image,
    author: users[0],
    lastLike: users[1],
    time: "1 bulan",
    desc: "Lrem Ipsum dlor sir amet",
  ),
  PostModel(
    url: [
        'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'
    ],
    media: MediaType.image,
    author: users[1],
    lastLike: users[0],
    time: "1 bulan",
    desc: "Lrem Ipsum dlor sir amet",
  ),
  PostModel(
    url: [
        'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
        'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
          'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
        'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
    ],
    media: MediaType.image,
    author: users[0],
    lastLike: users[1],
    time: "1 bulan",
    desc: "Lrem Ipsum dlor sir amet",
  ),
  PostModel(
    url: [
        'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'
    ],
    media: MediaType.image,
    author: users[1],
    lastLike: users[0],
    time: "1 bulan",
    desc: "Lrem Ipsum dlor sir amet",
  ),
  PostModel(
    url: [
        'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
        'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
          'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
        'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
    ],
    media: MediaType.image,
    author: users[0],
    lastLike: users[1],
    time: "1 bulan",
    desc: "Lrem Ipsum dlor sir amet",
  ),
  PostModel(
    url: [
        'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'
    ],
    media: MediaType.image,
    author: users[1],
    lastLike: users[0],
    time: "1 bulan",
    desc: "Lrem Ipsum dlor sir amet",
  ),
  PostModel(
    url: [
        'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
        'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
          'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
        'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
    ],
    media: MediaType.image,
    author: users[0],
    lastLike: users[1],
    time: "1 bulan",
    desc: "Lrem Ipsum dlor sir amet",
  ),
];

class BackendService {
  static Future<List<PostModel>> getPosts(offset, limit) async {
    final pairs = partition(posts, limit).toList();
    return pairs[offset];
  }
}

