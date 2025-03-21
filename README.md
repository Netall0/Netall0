# Hi there 🧃


![bd565dcc0a556add0b0a0ed6b26d686e](https://github.com/Netall0/Netall0/assets/113532176/3b1d4b44-6a21-4538-a6ec-2ba2a7c53f63)



<!--START_SECTION:waka-->
![Code Time](http://img.shields.io/badge/Code%20Time-340%20hrs%2042%20mins-blue)

📊 **This Week I Spent My Time On** 

```text
🕑︎ Time Zone: Asia/Novosibirsk

🔥 Editors: 
VS Code                  8 hrs 9 mins        █████████████████████████   100.00 % 

💻 Operating System: 
Windows                  8 hrs 9 mins        █████████████████████████   100.00 % 
```


 Last Updated on 19/10/2024 18:38:59 UTC
<!--END_SECTION:waka-->


import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(StopwatchApp());

class StopwatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stopwatch',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StopwatchPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  String _time = '00:00:00';

  void _updateTime() {
    setState(() {
      _time = _formatTime(_stopwatch.elapsedMilliseconds);
    });
  }

  String _formatTime(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr.$hundredsStr';
  }

  void _startStopwatch() {
    _stopwatch.start();
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) => _updateTime());
  }

  void _stopStopwatch() {
    _stopwatch.stop();
    _timer?.cancel();
  }

  void _resetStopwatch() {
    setState(() {
      _stopwatch.reset();
      _time = '00:00:00';
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Таймер
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.2),
                    blurRadius: 20,
                    spreadRadius: 5,
                  )
                ],
              ),
              child: Center(
                child: Text(
                  _time,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                    color: Colors.deepPurple[800],
                    fontFeatures: [FontFeature.tabularFigures()],
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            // Кнопки управления
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Кнопка сброса
                FloatingActionButton(
                  backgroundColor: Colors.deepPurple[100],
                  onPressed: _resetStopwatch,
                  child: Icon(Icons.replay, color: Colors.deepPurple[800]),
                ),
                SizedBox(width: 20),
                // Основная кнопка старта/паузы
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: FloatingActionButton(
                    backgroundColor: Colors.deepPurple,
                    onPressed: () {
                      if (_stopwatch.isRunning) {
                        _stopStopwatch();
                      } else {
                        _startStopwatch();
                      }
                    },
                    child: Icon(
                      _stopwatch.isRunning ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                      size: 30,
                    ),
                    elevation: 0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

