import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/datasource/datasource.dart';
import 'package:todoapp/data/repositories/task_repositories.dart';
import 'package:todoapp/data/repositories/task_repository_provider.dart';
import 'package:todoapp/providers/providers.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(taskRepositoryProvider); // Altere para o repositório
  return TaskNotifier(repository);
});
