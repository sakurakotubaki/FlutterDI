import 'package:di_app/screen/widget/datetime_text_widget.dart';
import 'package:di_app/screen/widget/formWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SecondScreen extends ConsumerWidget {
  const SecondScreen({super.key});

  static const relativePath = 'second_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 3),
              const DateTimeTextWidget(),
              const SizedBox(height: 40),
              FormonChanged(
                labelTextName: '名前',
                onChanged: (value) {
                  print(value);
                },
              ),
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
      ),
    );
  }
}
