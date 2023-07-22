import 'package:flutter/material.dart';
import 'package:meme_app/screens/widgets/meme_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  // final AppDatabase database;

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
                  onPressed: () {},
                  child: Container(
                    child: Center(
                      child: Text("Network Staus"),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    
                  },
                  child: Container(
                    child: Center(
                      child: Text("Network Staus"),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    child: Center(
                      child: Text("Network Staus"),
                    ),
                  ),
                ),
              ],
            ),
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
