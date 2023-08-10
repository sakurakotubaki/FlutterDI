import 'dart:async';
// カプセル化したいのは、BaseRepositoryのcountプロパティです。
abstract class BaseRepository<T> {
  Future<void> start();
  int get count;
  set count(int value);
}
// このクラスは、BaseRepositoryのcountプロパティをカプセル化します。
class BusinessRepository<T> {
  late final BaseRepository<T> _repository;

  BusinessRepository(this._repository);

  Future<void> start() => _repository.start();

  int get currentCount => _repository.count;

  set currentCount(int value) => _repository.count = value;
}
// T型のデータを処理する具体的なリポジトリの実装
class RepositoryImpl implements BaseRepository<int> {
  int _count = 0;

  @override
  int get count => _count;

  @override
  set count(int value) {
    if (value < 0) {
      throw ArgumentError('Count cannot be negative.');
    }
    _count = value;
  }

  @override
  Future<void> start() async {
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
// このコードは、カプセル化されたcountプロパティを使用して、
// リポジトリの現在の値を取得し、設定する方法を示しています。
void main() {
  final repository = BusinessRepository<int>(RepositoryImpl());
  repository.start();

  // ある時間を待った後、現在の_countの値を取得することができる。
  Future.delayed(Duration(seconds: 2), () {
    print('現在のカウント：${repository.currentCount}');
  });

  // サンプルのためにバリデーションの動作を確認するためのコード
  try {
    repository.currentCount = -5; // これはエラーをスローします
  } catch (e) {
    print(e); // 'Count cannot be negative.'を出力します
  }
}
