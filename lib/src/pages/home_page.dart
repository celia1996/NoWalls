import 'package:flutter/material.dart';
import 'package:no_walls/src/pages/listen.dart';

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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListenPage()),
                );
              },
              child: Text('Activar aviso de turno', style: TextStyle(fontWeight: FontWeight.w700),),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
                padding:  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20.0)),
                textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize:20))
              ),
            ),
          ],
        ),
      ),
    );
  }
}
