import 'package:flutter/material.dart';
import 'package:flutter_fft/flutter_fft.dart';
import 'package:no_walls/src/pages/home_page.dart';
import 'package:vibration/vibration.dart';

class ListenPage extends StatefulWidget {
  @override
  _ListenPageState createState() => _ListenPageState();
}

class _ListenPageState extends State<ListenPage> {
  double _frequency;
  bool _isRecording;

  FlutterFft flutterFft = new FlutterFft();

  @override
  void initState() {
    _isRecording = flutterFft.getIsRecording;
    _frequency = flutterFft.getFrequency;
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Mi turno')),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _isRecording && _frequency > 1200.00
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
                                  'Ha cambiado el turno, por favor verifique si es el suyo.'),
                              ClipRRect(
                                child: Image(
                                    image: AssetImage('assets/turnero.png'),
                                    height: 150,
                                    width: 150),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/listen-gif.gif'),
                        ),
                        SizedBox(height: 30),
                        SizedBox(
                          height: 100.0,
                          width: 300.0,
                          child: Text(
                            "Estamos escuchando, le avisaremos cuando cambie el turno.",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              flutterFft.stopRecorder();
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          },
                          child: Text('Desactivar aviso'),
                          color: Colors.indigo[200],
                        )
                      ],
                    ),
            ]),
      ),
    );
  }

  void _initialize() async {
    await flutterFft.startRecorder();
    flutterFft.setSampleRate = 0;
    setState(() => _isRecording = flutterFft.getIsRecording);
    flutterFft.onRecorderStateChanged.listen(
      (sounds) => {
        setState(
          () => {
            _frequency = sounds[1],
          },
        ),
        flutterFft.setFrequency = _frequency,
      },
    );
  }
}
