import 'dart:developer';

import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meme_app/data/app_database.dart';
import 'package:meme_app/entity/meme.dart';

class APIController extends GetxController {
  RxList<Meme> memeData = RxList([]);
  @override
  void onInit() async {
    // TODO: implement onInit
    await fetchMemes();
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final meme = await database.memeDao.getAllMeme();
    print(meme);
    super.onInit();
  }

  final String _url = "https://api.imgflip.com/get_memes";

  Future<void> fetchMemes() async {
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      //log(jsonBody.toString());
      final data = jsonBody['data']['memes'];

      memeData.value = data.map<Meme>((json) => Meme.fromJson(json)).toList();
      // print(memes[)
      // return memes;
    } else {
      // Handle error
      print('Failed to fetch memes');
    }
  }
}
