import 'package:cookie_jar/cookie_jar.dart';
import 'package:shiftsync/main.dart';

final dirPath = appDirectory.path;
final persistentCookieJar = PersistCookieJar(
  ignoreExpires: true,
  storage: FileStorage(dirPath),
);
