import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile/core/core.dart';
import 'package:mobile/routes.dart';
import 'package:mobile/ui/models/content_model.dart';

class HomeController extends GetxController
    with GetTickerProviderStateMixin
    implements Core {
  late RxString location;
  late RxList<ContentModel> contentModels;

  late RxBool loadContentModel;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  void onReady() {
    ready();
    super.onReady();
  }

  void change() {}

  @override
  void init() {
    location = ''.obs;

    loadContentModel = true.obs;

    contentModels = <ContentModel>[].obs;
  }

  @override
  void ready() async {
    location.value = 'Jl. Banjarsari RT 01/09';

    await Future.delayed(const Duration(seconds: 2));

    for (var i = 0; i < 10; i++) {
      contentModels.add(
        ContentModel.fromJson(
          {
            'title': 'coba $i',
            'caption':
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
          },
        ),
      );
    }
  }

  void onTap(int i) async {
    await Future.delayed(const Duration(seconds: 2));

    await Get.toNamed(RouteGenerator.routeDetail, arguments: 'nama saya');
  }
}
