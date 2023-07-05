import 'package:flutter/material.dart';
import 'package:mobile/ui/models/content_model.dart';
import 'package:mobile/ui/utils/size.dart';
import 'package:table_calendar/table_calendar.dart';

class DetailPage extends StatelessWidget {
  final ContentModel contentModel;

  const DetailPage(
    this.contentModel, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [],
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [],
      ),
    );
  }
}
