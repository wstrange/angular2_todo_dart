import 'package:angular2/angular2.dart';

@Component(selector: 'todo-item')
@View(template: '''
  <div>test text {{text}} done is {{done}}</div>
''')
class TodoItem {
  String text;
  bool done;

  TodoItem(this.text, this.done);

  String toString() => "item: $text done: $done";
}

/// Simple todo service - just holds list of todo's in memory
@Injectable()
class ToDoService {
  List<TodoItem> items = [];

  addItem(TodoItem item) => items.add(item);

  deleteItem(TodoItem item) => items.removeWhere((x) => x.text == item.text);

  save(TodoItem i) {
    // noop right now.. Could update a datastore if we had one
  }

  bulkDelete(Iterable<TodoItem> x) {
    x.forEach((item) {
      items.removeWhere((z) => z.text == item.text);
    });
  }

  saveItem(TodoItem item) {
    deleteItem(item);
    addItem(item);
  }
}
