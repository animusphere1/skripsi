import 'package:mobile/ui/models/trip_model.dart';

class ContentModel {
  String title;
  String caption;
  List<TripModel>? tripModels;

  ContentModel({required this.title, required this.caption, this.tripModels});

  factory ContentModel.fromJson(Map map) => ContentModel(
        title: map['title'] ?? 'title',
        caption: map['caption'] ?? 'caption',
      );

  ContentModel copyWith({String? title, String? caption}) {
    if (title == this.title) {
      title = this.title * 4;
    }

    return ContentModel(
      title: title ?? this.title,
      caption: caption ?? this.caption,
    );
  }
}
