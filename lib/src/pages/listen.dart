import 'package:flutter/material.dart';

class ListenPage extends StatefulWidget {
  const ListenPage({Key key}) : super(key: key);

  @override
  _ListenPageState createState() => _ListenPageState();
}

class _ListenPageState extends State<ListenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Mis citas')),
        backgroundColor: Colors.indigoAccent,
      ),
    );
  }
}