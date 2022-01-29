class VideoModel {
  String title;
  String thumbnail;
  String videoUrl;
  String time;
  String description;
  VideoModel({
    required this.description,
    required this.thumbnail,
    required this.time,
    required this.title,
    required this.videoUrl,
  });

  static VideoModel fromJson(List<dynamic> snapshot, int index) {
    return VideoModel(
      description: snapshot[index]["description"],
      thumbnail: snapshot[index]["thumbnail"],
      time: snapshot[index]["time"],
      title: snapshot[index]["title"],
      videoUrl: snapshot[index]["videoUrl"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["description"] = description;
    data["thumbnail"] = thumbnail;
    data["time"] = time;
    data["title"] = title;
    data["videoUrl"] = videoUrl;
    return data;
  }
}
