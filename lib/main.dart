// dessa maneira é possível executar o arquivo sem o comando flutter run --no-sound-null-safety
// @dart=2.9
import 'package:flutter/material.dart';
import 'Home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}
