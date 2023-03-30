// ignore_for_file: use_key_in_widget_constructors, import_of_legacy_library_into_null_safe, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyWidget());

class MyWidget extends StatelessWidget {
  void playSound(int number) {
    final player = AudioPlayer();
    player.play(AssetSource('note$number.wav'));
  }

  Widget buildKey(int number) {
    var color = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.teal,
      Colors.blue,
      Colors.purple
    ];

    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          playSound(number);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color[number - 1],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero),
          ),
        ),
        child: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  for (int i = 1; i < 8; i++) buildKey(i),
                ]),
          ),
        ),
      ),
    );
  }
}
