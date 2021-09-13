import 'package:face_mask_detection/app_const/strings.dart';
import 'package:face_mask_detection/pages/live_camera.dart';
import 'package:face_mask_detection/pages/local_storage.dart';
import 'package:face_mask_detection/pages/take_image.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.red.withOpacity(0.6),
        title: Text(
          'Face Mask Detection',
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LiveCamera(),
                    ));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  liveCamera,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "gilroy",
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LocalStorage(),
                    ));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  fromGallery,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "gilroy",
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TakeImage(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  takeImage,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "gilroy",
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
