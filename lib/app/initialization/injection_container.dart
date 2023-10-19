import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../../domain/domain.dart';
import '../../generated/l10n.dart';
import '../../presentation/presentation.dart';
import '../app.dart';

final _getIt = GetIt.instance;

Future<void> registerDependencies() async {
  await _registerServices();
  await _registerDataSource();
  await _registerRepositories();
  await _registerBlocs();
}

Future<void> _registerServices() async {
  _getIt
    ..registerLazySingleton<SnackBarService>(SnackBarService.new)
    ..registerLazySingleton<Talker>(TalkerFlutter.init)
    ..registerLazySingleton<AppRouter>(AppRouter.new)
    ..registerSingleton<FirebaseAuth>(FirebaseAuth.instance)
    ..registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance)
    ..registerSingleton<FirebaseStorage>(FirebaseStorage.instance)
    ..registerLazySingleton(AuthService.new)
    ..registerLazySingleton<HiveInterface>(
      () => Hive,
    )
    ..registerLazySingleton<S>(S.new)
    ..registerLazySingleton(DurationAdapter.new)
    ..registerLazySingleton<Dio>(Dio.new)
    ..registerLazySingleton(
      NotificationService.new,
    )
    ..registerLazySingleton<ImagePicker>(
      ImagePicker.new,
    )
    ..registerLazySingleton<FileManager>(() => FileManager(dio: _getIt()));
}

Future<void> _registerDataSource() async {
  _getIt
    ..registerLazySingleton<RemoteAuthDataSource>(
      () => RemoteAuthDataSourceImpl(
        firebaseAuth: _getIt<FirebaseAuth>(),
        firebaseFirestore: _getIt<FirebaseFirestore>(),
        localCategoryDataSource: _getIt(),
        fileManager: _getIt(),
      ),
    )
    ..registerSingletonAsync<LocaleCategoryDataSource>(
      () async => LocaleCategoryDataSourceImpl.create(hive: _getIt()),
    )
    ..registerSingletonAsync<LocaleTasksDataSource>(
      () async => LocaleTasksDataSourceImpl.create(hive: _getIt()),
    )
    ..registerSingletonAsync<LocaleUserProfileDataSource>(
      () async => LocaleUserProfileDataSourceImpl.create(hive: _getIt()),
    )
    ..registerSingletonAsync<RemoteUserProfileDataSource>(
      () async => RemoteUserProfileDataSourceImpl(
        firestore: _getIt(),
        fireStorage: _getIt(),
        fileManager: _getIt(),
      ),
    );
}

Future<void> _registerRepositories() async {
  _getIt
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteAuthDataSource: _getIt(),
        userProfileRepositories: _getIt(),
      ),
    )
    ..registerLazySingleton<CategoriesRepository>(
      () => CategoriesRepositoryImpl(localCategoryDataSource: _getIt()),
    )
    ..registerLazySingleton<TaskRepository>(
      () => TaskRepositoryImpl(localeTasksDataSource: _getIt()),
    )
    ..registerSingletonAsync<UserProfileRepositories>(
      () async => UserProfileRepositoriesImpl.create(
        localeUserProfileDataSource: _getIt(),
        remoteUserProfileDataSource: _getIt(),
      ),
      dependsOn: [
        LocaleUserProfileDataSource,
      ],
    );
}

Future<void> _registerBlocs() async {
  _getIt
    ..registerFactory(
      () => LogInBloc(
        authRepository: _getIt(),
      ),
    )
    ..registerFactory(
      () => SignUpBloc(
        authRepository: _getIt(),
      ),
    )
    ..registerFactory(
      ResetPasswordBloc.new,
    )
    ..registerFactory(
      () => TaskerBloc(
        taskRepository: _getIt(),
      ),
    )
    ..registerFactory(
      () => UserProfileBloc(
        userProfileRepositories: _getIt(),
      ),
    )
    ..registerFactory(
      MenuActionsBloc.new,
    );
}
