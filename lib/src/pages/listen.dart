import 'package:flutter/material.dart';
import 'package:flutter_fft/flutter_fft.dart';
import 'package:vibration/vibration.dart';

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
        title: Text('Mi turno'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              isRecording && frequency > 1500.00
                  ? FutureBuilder(
                      future: Vibration.vibrate(duration: 2000),
                      builder: (context, AsyncSnapshot snapshot) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          title: Text('Cambio de turno'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                  'Ha cambiado el turno, por favor verifica si es el tuyo.'),
                              FlutterLogo(size: 100)
                            ],
                          ),
                        );
                      },
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeInImage(
                            placeholder: AssetImage('assets/listen-gif.gif'),
                            image: NetworkImage(
                                'https://media1.giphy.com/media/eNM4NlGpmCxzcXesjr/giphy.gif')),
                        Text(
                          "Estamos escuchando, le avisaremos cuando cambie el turno.",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
            ]),
      ),
    );
  }

  void _initialize() async {
    print("Starting recorder...");
    await flutterFft.startRecorder();
    print("Recorder started.");
    setState(() => isRecording = flutterFft.getIsRecording);
    flutterFft.onRecorderStateChanged.listen(
      (data) => {
        setState(
          () => {
            frequency = data[1],
          },
        ),
        flutterFft.setFrequency = frequency,
      },
    );
  }
}
