import 'package:di_app/common/datetime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecondScreen extends ConsumerWidget {
  const SecondScreen({super.key});

  static const relativePath = 'second_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 4),
            Text('現在時刻: ${DateTime.now().formatted}'),
          ],
        ),
      ),
    );
  }
}
