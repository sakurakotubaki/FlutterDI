abstract class BaseRepository {
  // ストップウオッチの開始
  Future<void> start();
  // ストップウオッチのリセット
  Future<void> stop();
}