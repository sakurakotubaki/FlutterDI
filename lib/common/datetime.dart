// 現在時刻を取得するだけのExtension
import 'package:intl/intl.dart';

// この拡張メソッドを使うことで、DateTime型の変数に対して、
// formattedプロパティを呼び出すことができる
extension DateTimeExtension on DateTime {
  String get formatted => DateFormat('yyyy/MM/dd HH:mm:ss').format(this);
}