import 'package:flutter/material.dart';
import 'package:flutter_fft/flutter_fft.dart';

class ListenPage extends StatefulWidget {
  @override
  _ListenPageState createState() => _ListenPageState();
}

class _ListenPageState extends State<ListenPage> {
double frequency;
bool isRecording;

FlutterFft flutterFft = new FlutterFft();

@override
  void initState() {
    isRecording = flutterFft.getIsRecording;
    frequency = flutterFft.getFrequency;
    super.initState();
    _initialize();
      }
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Mis citas')),
            backgroundColor: Colors.indigoAccent,
          ),
        );
      }
    
      void _initialize() async {
        
      }
}