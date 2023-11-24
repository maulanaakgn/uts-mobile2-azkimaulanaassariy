import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage(
                'https://i.ytimg.com/vi/GdPEHKnGrdA/maxresdefault.jpg',
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
                child: Text(
                'Azki Maulana Assariy',
                style: TextStyle(
                  fontSize: 16,
                )
              )
            ),
            Center(
                child: Text(
                '21552011144',
                style: TextStyle(
                  fontSize: 16,
                )
              )
            ),
            Center(
                child: Text(
                'TIF 221B',
                style: TextStyle(
                  fontSize: 16,
                )
              )
            ),
          ],
        ),
      ),
    );
  }
}