class Post {
  int id;
  String title;
  String body;
  List<String> tags;
  int likes;
  int views;
  int userId;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.tags,
    required this.likes,
    required this.views,
    required this.userId,
  });
}
