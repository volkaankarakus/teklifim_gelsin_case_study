import 'package:flutter/material.dart';

class ResetFocus {
  ResetFocus();

  initFocus() {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
  }
}
