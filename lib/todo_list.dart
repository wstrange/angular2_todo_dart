import 'package:angular2/angular2.dart';
import 'dart:html';

import 'todo_service.dart';

@Component(
    selector: 'todo-list',
    properties: const ['todoItems'],
    appInjector: const [ToDoService])
@View(
    templateUrl: "packages/angular2_todo_dart/todo_list.html",
    directives: const [NgFor, TodoItem])
class TodoList {
  ToDoService todoService;
  bool todoFilter = null; // hack from js

  TodoItem todoEdit = null;

  TodoList(this.todoService);

  addTodo(String todo) {
    print('addtodo $todo');
    todoService.addItem(new TodoItem(todo, false));
  }

  doneEditing(KeyboardEvent event, TodoItem todo) {
    var which = event.which;
    var target = event.target;
    if (which == KeyCode.ENTER) {
      todo.text = target.value;
      todoService.saveItem(todo);
      todoEdit = null;
    } else if (which == 27) {
      this.todoEdit = null;
      target.value = todo.text;
    }
  }

  toggleDone(TodoItem item) {
    item.done = !item.done;
  }

  deleteMe(TodoItem item) {
    print("Delete $item");
    todoService.deleteItem(item);
  }

  editTodo(event, TodoItem item) => this.todoEdit = item;

  enterTodo(event, newtodo) {
    if (event.keyCode == KeyCode.ENTER) {
      var todoText = newtodo.value.trim();
      if (todoText.length > 0) {
        this.addTodo(todoText);
        newtodo.value = '';
      }
    }
  }

  toggleAll(event) {
    var isComplete = event.target.checked;
    todoService.items.forEach((todo) => todo.done = isComplete);
    //todoService.save(todo);
  }

  showAll() {
    this.todoFilter = null;
  }
  showActive() {
    this.todoFilter = true;
  }
  showCompleted() {
    this.todoFilter = false;
  }

  completeMe(TodoItem todo) {
    todo.done = !todo.done;
    this.todoService.save(todo);
  }

  clearCompleted() {
    var toClear = [];
    todoService.items.forEach((todo) {
      if (todo.done) {
        toClear.add(todo);
      }
    });
    todoService.bulkDelete(toClear);
  }
}
