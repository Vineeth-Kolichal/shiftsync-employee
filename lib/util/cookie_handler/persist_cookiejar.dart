import 'package:cookie_jar/cookie_jar.dart';
import 'package:shiftsync/main.dart';

final dirPath = appDirectory.path;
final persistCookieJar = PersistCookieJar(
  ignoreExpires: true,
  storage: FileStorage(dirPath),
);
