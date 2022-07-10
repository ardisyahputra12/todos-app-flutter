import 'package:flutter/material.dart';
import 'package:todos_app/models/todos-model.dart';

class TodosProvider extends ChangeNotifier {
  // controller
  TextEditingController _titleController = TextEditingController();
  TextEditingController get getTitleController => _titleController;
  set setTitleController(val) {
    _titleController = val;
    notifyListeners();
  }

  TextEditingController _descController = TextEditingController();
  TextEditingController get getDescController => _descController;
  set setDescController(val) {
    _descController = val;
    notifyListeners();
  }

  TextEditingController _categoriController = TextEditingController();
  TextEditingController get getCategoriController => _categoriController;
  set setCategoriController(val) {
    _categoriController = val;
    notifyListeners();
  }

  DateTime _dateController = DateTime.now();
  DateTime get getDateController => _dateController;
  set setDateController(val) {
    _dateController = val;
    notifyListeners();
  }

  // mengkosongkan controller
  void empty() {
    setTitleController = TextEditingController();
    setCategoriController = TextEditingController();
    setDescController = TextEditingController();
    setDateController = DateTime.now();
  }

  // increment
  int num = 0;
  addNum() {
    num += 1;
    notifyListeners();
  }

  // penampung item
  List<TodoModel> _todoList = [];
  List<TodoModel> get getTodoList => _todoList;

  void addTodo(TodoModel todo) {
    _todoList.add(todo);
    notifyListeners();
  }

  void removeTodo(TodoModel todo) {
    _todoList = _todoList.where((item) => item.id != todo.id).toList();
    notifyListeners();
  }
}
