class VideoPost {
  final String caption;
  final String urlVideo;
  final int likes;
  final int views;


  VideoPost( {
    required this.caption, 
    required this.urlVideo, 
    this.likes = 0, 
    this.views = 0,
  });


}