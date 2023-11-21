import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ClockModel with ChangeNotifier {
  String _currentTime = '';
  late Timer _timer;

  String get currentTime => _currentTime;

  ClockModel() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      updateTime();
    });
  }

  void updateTime() {
    final now = DateTime.now();
    _currentTime = DateFormat.jm().format(now);
    notifyListeners();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
