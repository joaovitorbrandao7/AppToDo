import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/datasource/datasource.dart';
import 'package:todoapp/data/repositories/task_repositories.dart';
import 'package:todoapp/data/repositories/task_repository_impl.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final datasource = ref.watch(taskDatasourceProvider); // Use o datasource correto
  return TaskRepositoryImpl(datasource); // Crie o repositório com o datasource
});
