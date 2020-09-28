import 'package:flutter/material.dart';
import 'package:no_walls/src/pages/configuration.dart';
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
              onPressed: () async {
                if (await Vibration.hasVibrator()) {
                  Vibration.vibrate(duration: 2000);
                }
              },
              child: Text('Vibrar'),
              color: Colors.pinkAccent,
              focusColor: Colors.pink,
              textColor: Colors.white,
              shape: StadiumBorder(),
            ),
            SizedBox(width: 10),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConfigurationPage()),
                );
              },
              child: Text('Configuración'),
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
