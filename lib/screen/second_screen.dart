import 'package:di_app/common/datetime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
            SizedBox(height: MediaQuery.of(context).size.height / 3),
            Text('現在時刻: ${DateTime.now().formatted}'),
            const SizedBox(height: 40),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(34),
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  context.pop();
                },
                child: const Text('戻るボタン')),
          ],
        ),
      ),
    );
  }
}
