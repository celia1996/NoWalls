import 'package:flutter/material.dart';
import 'package:no_walls/src/pages/listen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('WarnMe')),
        backgroundColor: Colors.indigoAccent,
        automaticallyImplyLeading: false,
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
                backgroundColor: MaterialStateProperty.all<Color>(Colors.pink[300]),
                padding:  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15.0)),
                textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize:16)),      
              ),
            ),
          ],
        ),
      ),
    );
  }
}
