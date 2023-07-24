import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meme_app/data/app_database.dart';
import 'package:meme_app/entity/meme.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class APIController extends GetxController {
  RxList<Meme> memeData = RxList([]);
  RxList<Meme> memeDataOffline = RxList([]);
  RxString connectionStatus = RxString('');

  final Connectivity connectivity = Connectivity();
  var database;
  @override
  void onInit() async {
    await initConnectivity();
    final connectivityResult = await (Connectivity().checkConnectivity());
    database =
        await $FloorAppDatabase.databaseBuilder('app_database.g.dart').build();
    memeDataOffline.value = await database.memeDao.getAllMeme();
    if (connectivityResult != ConnectivityResult.none) {
      await fetchMemes();
      // await database.memeDao.deleteAll();
      addToList();
    }
    memeDataOffline.value = await database.memeDao.getAllMeme();
    super.onInit();
  }

  addToList()async{
    for (var element in memeData) {
        var foundMeme = await getMemeById(element.id);
        if (foundMeme == null) {
          log(element.id.toString());
          try {
            await addMeme(element);
            // log("if " + memeDataOffline.length.toString());
          } catch (e) {
            log(e.toString());
          }
        } else {
          log(memeDataOffline.length.toString());
        }
      }
  }

  Future<Meme?> getMemeById(int id) async {
    return await database.memeDao.getMemeById(id);
  }

  Future<List<int>> addMemes(List<Meme> memes) async {
    return await database.memeDao.insertMemes(memes);
  }

  Future<void> addMeme(Meme meme) async {
    return await database.memeDao.insertMeme(meme);
  }

  Future<List<int>> addMemesById(
      id, name, url, width, height, boxCount, captions) async {
    Meme temp = Meme(
        id: id,
        name: name,
        url: url,
        width: width,
        height: height,
        boxCount: boxCount,
        captions: captions);
    return await database.memeDao.insertMeme([temp]);
  }

  Future initConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      connectionStatus.value = "Using Mobile Data";
    } else if (connectivityResult == ConnectivityResult.wifi) {
      connectionStatus.value = "Using Wifi";
    } else if (connectivityResult == ConnectivityResult.none) {
      connectionStatus.value = "No Internet Connection";
    }
  }

  final String _url = "https://api.imgflip.com/get_memes";

  Future<void> fetchMemes() async {
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      //log(jsonBody.toString());
      final data = jsonBody['data']['memes'];
      memeData.addAll(data.map<Meme>((json) => Meme.fromJson(json)).toList());

      //*image convert
      // print(jsonBody['data']['memes'][0]['url']);
      // final imageData = jsonBody['data']['memes'][0]['url'];
      // http.Response imageResponse = await http.get(Uri.parse(imageData));
      // String base64 = base64Encode(imageResponse.bodyBytes);
      // log(base64);
      //
    } else {
      // Handle error
      print('Failed to fetch memes');
    }
  }
}
