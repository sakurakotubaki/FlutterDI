import 'package:di_app/common/color.dart';
import 'package:di_app/common/datetime.dart';
import 'package:di_app/provider/repository_implprovider.dart';
import 'package:di_app/screen/second_screen.dart';
import 'package:di_app/state/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const relativePath = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// [ref.listen]を使って、[repositoryImplProvider]の値が変更されたら、
    /// [SnackBar]を表示する
    ref.listen<CounterState>(repositoryImplProvider, (prev, next) {
      if (next.count == 5) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.green, content: Text('5秒経過しました')),
        );
      }
    });
    // ストップウオッチのカウントを取得
    final count = ref.watch(repositoryImplProvider).count;

    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(SecondScreen.relativePath);
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 3),
            Text('現在時刻: ${DateTime.now().formatted}'), // ここで、extensionメソッドを呼び出す
            const SizedBox(height: 20),
            Text('ストップウォッチ: $count',
                style: const TextStyle(fontSize: FONT_SIZE, color: TEXT_COLOR)),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(24),
                backgroundColor: Colors.blue,
              ),
              onPressed: () =>
                  ref.read(repositoryImplProvider.notifier).start(),
              child: const Text('開始'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(24),
                backgroundColor: Colors.red,
              ),
              onPressed: () => ref.read(repositoryImplProvider.notifier).stop(),
              child: const Text('リセット'),
            ),
          ],
        ),
      ),
    );
  }
}
