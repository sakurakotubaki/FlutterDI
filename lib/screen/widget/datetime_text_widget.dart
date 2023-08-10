import 'package:di_app/common/datetime.dart';
import 'package:flutter/material.dart';

sealed class BaseComponent {
  const BaseComponent();
}

class DateTimeTextWidget extends StatelessWidget {
  const DateTimeTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('現在時刻: ${DateTime.now().formatted}');
  }
}