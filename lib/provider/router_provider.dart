import 'package:di_app/screen/home_screen.dart';
import 'package:di_app/screen/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// RiverpodのProviderを使用して、goRouterProviderを作成する
final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: HomeScreen.relativePath,
    debugLogDiagnostics: true, // デバッグログを出力する
    errorBuilder: (context, state) {
      return const Scaffold(
        body: Center(
          child: Text('エラーが発生しました'),
        ),
      );
    },
    routes: [
      GoRoute(
        path: HomeScreen.relativePath,
        name: HomeScreen.relativePath,
        builder: (context, state) {
          return const HomeScreen();
        },
        routes: [
          GoRoute(
            path: SecondScreen.relativePath,
            name: SecondScreen.relativePath,
            builder: (context, state) {
              return const SecondScreen();
            },
          ),
        ],
      ),
    ],
  );
});
