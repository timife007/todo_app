

import 'package:todos_api/todos_api.dart';

abstract class TodosApi {
  const TodosApi();

  Stream<List<Todo>> getTodos();

  Future<void> saveTodo(Todo todo);

  Future<void> deleteTodo(String id);

  Future<int> clearCompleted();

  Future<int> completeAll({required bool isCompleted});
}
