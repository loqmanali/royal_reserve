import 'package:flutter/material.dart';
import 'package:royal_reserve/core/di/di.dart';

import 'royal_reserve_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const RoyalReserveApp());
}
