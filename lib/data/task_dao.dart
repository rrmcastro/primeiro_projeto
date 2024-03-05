import 'package:sqflite/sqflite.dart';

import '../components/task.dart';
import 'database.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task tarefa) async {
    print('Acessando o save: ');
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(tarefa.nome);
    if (itemExists.isEmpty) {
      print('Inserindo tarefa no BD...');
      return await bancoDeDados.insert(
        _tablename,
        values,
      );
    } else {
      print('Atualizando tarefa no BD...');
      return await bancoDeDados.update(
        _tablename,
        values,
        where: '$_name = ?',
        whereArgs: [tarefa.nome],
      );
    }
  }

  Future<List<Task>> findAll() async {
    print('Acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print('Procurando dados no BD... encontrados: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('Convertendo toList...');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(
        linha[_name],
        linha[_image],
        linha[_difficulty],
      );
      tarefas.add(tarefa);
    }
    print('Lista de tarefas: $tarefas');
    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    print('Acessando find: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  delete(String nomedaTarefa) async {}
}
