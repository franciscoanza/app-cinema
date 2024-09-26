import 'package:cinema/infrastructure/datasource/isar_datasource.dart';
import 'package:cinema/infrastructure/repositories/local_storage_facade_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageFacadeImpl(datasource: IsarDatasource());
});
