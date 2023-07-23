import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meme_app/controller/api_controller.dart';
import 'package:meme_app/entity/meme.dart';

class MemeList extends StatelessWidget {
  MemeList({super.key, required this.list});

  final List<Meme> list;

  final APIController apiController = Get.put(APIController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (BuildContext context, i) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListTile(
            //leading: Image.network(list[i].url),
            title: Text(list[i].name),
          ),
        );
      },
    );
  }
}
