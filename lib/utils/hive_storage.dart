import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveStorage {
  HiveStorage._();

  static HiveStorage? _instance;

  static HiveStorage get instance => _instance ??= HiveStorage._();

  Future<void> hiveInit() async {
    Hive.init((await getApplicationDocumentsDirectory()).path);
    await Hive.openBox("data");
    hive = Hive.box("data");

  }

  late Box hive;
}
