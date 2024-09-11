import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/datasource/datasource.dart';
import 'package:todoapp/data/repositories/task_repositories.dart';
import 'package:todoapp/data/repositories/task_repository_impl.dart';

final taskDatasourceProvider = Provider<TaskDatasource>((ref){
  return TaskDatasource();

});
