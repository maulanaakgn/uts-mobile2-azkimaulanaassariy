import 'package:flutter/material.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  @override
  Widget build(BuildContext context) {
    const title = 'Grid List';

    List<String> fruitImageUrls = [
      'https://static.vecteezy.com/system/resources/previews/013/442/160/original/red-apple-on-transparent-background-free-png.png',
      'https://clipart-library.com/image_gallery2/Banana.png',
      'https://static.vecteezy.com/system/resources/previews/029/200/379/original/orange-or-tangerine-transparent-background-free-png.png',
      'https://static.vecteezy.com/system/resources/previews/022/430/928/non_2x/free-bunch-of-grapes-on-transparent-background-free-png.png',
    ];

    return MaterialApp(
      title: title,
      home: Scaffold(
        body: GridView.builder(
          padding: EdgeInsets.only(top: 10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: fruitImageUrls.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Image.network(
                  fruitImageUrls[index],
                  width: 160.0,
                  height: 160.0,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
