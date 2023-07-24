import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meme_app/controller/api_controller.dart';
import 'package:meme_app/screens/widgets/meme_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final APIController apiController = Get.put(APIController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meme App"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    //  final meme =
                  },
                  child: const Center(
                    child: Text("Save Data"),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Center(
                    child: Text("Network Staus"),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Center(
                    child: Text("Network Staus"),
                  ),
                ),
              ],
            ),
            Obx(() => Text(apiController.connectionStatus.value)),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: MemeList(),
            )
          ],
        ),
      ),
    );
  }
}
