import 'package:flutter/material.dart';

class MyAppointmentsPage extends StatelessWidget {
  const MyAppointmentsPage({Key key}) : super(key: key);

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
