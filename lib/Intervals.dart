import 'dart:convert';
import 'package:flutter/foundation.dart';


class Intervals with ChangeNotifier {

  late final String name;
  late final String time;
  late final String song;

  Intervals(this.name, this.time, this.song);
}

