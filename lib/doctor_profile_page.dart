import 'package:flutter/material.dart';
import 'main_page.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_left),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
          ),
          title: Text("Profile",
          style: TextStyle(
            color: Colors.white,
          ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
              width: 200,
              height: 200,
              child:  Center(
                child: Image.network('https://cdn.pixabay.com/photo/2020/07/14/13/07/icon-5404125_1280.png'),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(100, 20, 0, 0),
                  child: Text(
                    'Dr.Jon Doe',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                Icon(Icons.verified_user),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(100, 20, 0, 0),
                  child: Text(
                    'Sarajevo, BiH',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                Icon(Icons.location_on_outlined),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(100, 20, 0, 0),
                  child: Text(
                    'Edit profile',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                Icon(Icons.edit),
              ],
            ),
          ],
        ),
      ),
    );
  }
}