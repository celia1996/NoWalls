import 'package:flutter/material.dart';
import 'package:no_walls/src/pages/listen.dart';
import 'package:vibration/vibration.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('WallsOut')),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListenPage()),
                );
              },
              child: Text('Escuchar'),
              color: Colors.pinkAccent,
              textColor: Colors.white,
              shape: StadiumBorder(),
            ),
          ],
        ),
      ),
    );
  }
}
