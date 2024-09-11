import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/config/routes/routes.dart';
import 'package:todoapp/data/data.dart';
import 'package:todoapp/providers/task/task.dart';
import 'package:todoapp/utils/extensions.dart';
import 'package:todoapp/utils/task_categories.dart';
import 'package:todoapp/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
  const HomeScreen();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final taskState = ref.watch(taskProvider);

    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Container(
              height: deviceSize.height * 0.3,
              width: deviceSize.width,
              color: colors.primary,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DisplayWhiteText(
                    text: 'Aug 7, 2023',
                    fontSize: 20,
                  ),
                  Gap(10),
                  DisplayWhiteText(
                    text: 'Gerenciador de Tarefas',
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
            top: 170,
            right: 0,
            left: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                     DisplayListOfTasks(
                      tasks: taskState.tasks,
                       
                      ),
                    
                    const Gap(20),
                    Text(
                      'Tarefas completadas',
                      style: context.textTheme.headlineMedium,
                    ),
                    const Gap(20),
                      DisplayListOfTasks(
                      tasks: [    
                        Task(
                          title: 'title', 
                          note: '', 
                          time: '10:12', 
                          date: 'Aug, 07', 
                          isCompleted: true,
                          category: TaskCategories.social,
                          ),
                          Task(
                          title: 'title2', 
                          note: 'note2', 
                          time: '20:12', 
                          date: 'Aug, 09', 
                          isCompleted: true,
                          category: TaskCategories.shopping,
                          )
                          ], 
                      isCompletedTasks: true,
                      ),
                  
                    const Gap(20),
                    ElevatedButton(
                      onPressed: () => context.push(RouteLocation.createTask), 
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: DisplayWhiteText(text: 'Adicionar nova tarefa'),
                    ),
                    ),
                  ],
                ),
              ),
            )),
      ]),
    );
  }
}


