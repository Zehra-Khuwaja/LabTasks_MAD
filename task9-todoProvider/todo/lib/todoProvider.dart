import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex/todo.dart';

class todoProvider extends ChangeNotifier(){
   List<ToDo> todos= [];
   List<ToDo> get todolist=> todos;

   addToDo(ToDo todo){
    todos.add(todo);
    notifyListeners();
   }
removeToDo (int index){
  todos.removeAt(index);
  notifyListeners();
}
toggleIsDone (int index){
  todoList(index).isDone =!todolist [index].isDone;
  notifyListeners();
}

  //  List<ToDo> gettodo(){
  //   List <ToDo> todolist =todos;
  //   return todolist;
  //  }
}