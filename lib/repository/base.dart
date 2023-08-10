import 'dart:async';

// 基本のリポジトリインターフェース。Tはデータの型を指定します。
abstract class BaseRepository<T> {
  Future<void> start();
}

class BusinessRepository<T> {
  late final BaseRepository<T> _repository;

  BusinessRepository(this._repository);

  Future<void> start() => _repository.start();
}

// T型のデータを処理する具体的なリポジトリの実装
class RepositoryImpl implements BaseRepository<int> {
  @override
  Future<void> start() async {
    int _count = 0;
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _count++;
        print('$_count秒経過');
        if (_count == 3) {
          timer.cancel();
        }
      },
    );
  }
}

void main() {
  final repository = BusinessRepository<int>(RepositoryImpl());
  repository.start();
}
