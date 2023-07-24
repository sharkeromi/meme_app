import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meme_app/controller/api_controller.dart';


class MemeList extends StatelessWidget {
  MemeList({
    super.key,
  });
  //final AppDatabase database;
  final APIController apiController = Get.put(APIController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: apiController.memeDataOffline.value.length,
        itemBuilder: (BuildContext context, i) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              leading: Image.network(
                apiController.memeDataOffline.value[i].url,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/error.png');
                },
              ),
              title: Text(apiController.memeDataOffline.value[i].name),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  log(apiController.memeDataOffline[i].id.toString());
                  await apiController.database.memeDao
                      .deleteMeme(apiController.memeDataOffline[i].id);
                  apiController.memeDataOffline.value =
                      await apiController.database.memeDao.getAllMeme();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
