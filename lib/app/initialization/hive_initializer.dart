import 'package:hive_flutter/hive_flutter.dart';
import '../../data/data.dart';
import '../../domain/domain.dart';

Future<void> initializeHive() async {
  await Hive.initFlutter();

  Hive
    ..registerAdapter(TaskRequestDtoAdapter())
    ..registerAdapter(SubtaskRequestDtoAdapter())
    ..registerAdapter(CategoryTaskRequestDtoAdapter())
    ..registerAdapter(UserProfileAdapter())
    ..registerAdapter(LevelImportanceAdapter());

  //await Hive.deleteBoxFromDisk(HiveBoxes.tasksBox);
}
