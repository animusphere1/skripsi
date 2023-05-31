class ContentModel {
  String title;
  String caption;

  ContentModel({required this.title, required this.caption});

  ContentModel copyWith(ContentModel contentModel) {
    return ContentModel(
      title: contentModel.title,
      caption: contentModel.caption,
    );
  }

  factory ContentModel.fromJson(Map map) => ContentModel(
        title: map['title'],
        caption: map['caption'] ?? 'caption',
      );
}
