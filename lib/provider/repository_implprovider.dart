import 'dart:async';

import 'package:di_app/interface/base_repository.dart';
import 'package:di_app/state/counter_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// [NotifierProvider]を使って、[RepositoryImplNotifier]を提供する
final repositoryImplProvider = NotifierProvider<RepositoryImplNotifier, CounterState>(RepositoryImplNotifier.new);

class RepositoryImplNotifier extends Notifier<CounterState> implements BaseRepository {
  @override
   build() {
    return CounterState(count: 0);
  }

  // ストップウオッチの開始
  @override
  Future<void> start() async {
    Timer.periodic(
      const Duration(seconds: 1), // 1秒ごとにカウントアップ
      (timer) {
        state = CounterState(count: state.count + 1);
        if (state.count == 5) {
          // 5秒でストップ
          timer.cancel();
        }
      },
    );
  }

  // ストップウオッチのリセット
  @override
  Future<void> stop() async {
    state = CounterState(count: 0);
  }
}

/// [StateNotifierProvider]を使って、[RepositoryImplNotifier]を提供する
///
// final repositoryImplProvider =
//     StateNotifierProvider<RepositoryImpl, CounterState>(
//   (ref) => RepositoryImpl(),
// );

// class RepositoryImpl extends StateNotifier<CounterState>
//     implements BaseRepository {
//   RepositoryImpl() : super(CounterState(count: 0));
//   // ストップウオッチの開始
//   @override
//   Future<void> start() async {
//     Timer.periodic(
//       const Duration(seconds: 1), // 1秒ごとにカウントアップ
//       (timer) {
//         state = CounterState(count: state.count + 1);
//         if (state.count == 5) {
//           // 5秒でストップ
//           timer.cancel();
//         }
//       },
//     );
//   }

//   // ストップウオッチのリセット
//   @override
//   Future<void> stop() async {
//     state = CounterState(count: 0);
//   }
// }