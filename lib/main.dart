import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wallio/app/wallio.dart';

import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;

void main() {
  debugPaintSizeEnabled = false;
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(Wallio());
}