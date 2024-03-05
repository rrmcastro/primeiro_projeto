import 'package:flutter/cupertino.dart';
import 'package:primeiro_projeto/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required super.child,
  });

  final List<Task> taskList = [
    Task('Estudar Flutter', 'assets/images/dash.png', 3),
    Task('Andar de Bike', 'assets/images/bike.jpg', 2),
    Task('Ler 50 páginas', 'assets/images/ler.jpg', 1),
    Task('Meditar', 'assets/images/meditar.jpeg', 4),
    Task('Jogar', 'assets/images/jogar.jpg', 0),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
