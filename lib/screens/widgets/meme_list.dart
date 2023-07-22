import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meme_app/controller/api_controller.dart';

class MemeList extends StatelessWidget {
  MemeList({super.key});

  final APIController apiController = Get.put(APIController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: apiController.memeData.length,
        itemBuilder: (BuildContext context, i) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              leading: Image.network(apiController.memeData.value[i].url),
              title: Text(apiController.memeData.value[i].name),
            ),
          );
        },
      ),
    );
  }
}
