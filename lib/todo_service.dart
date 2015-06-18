import 'package:angular2/angular2.dart';

class TodoItem {
  String text;
  bool _done;

  bool get done => _done;
  set done(bool x) { _done = x; print("set done $x"); }

  TodoItem(this.text,this._done);

  String toString() => "item: $text done: $done";

}

/// Simple todo service - just holds list of todo's in memory
@Injectable()
class ToDoService {

  List<TodoItem> items = [];

  addItem(TodoItem item) => items.add(item);

  deleteItem(TodoItem item) =>
    items.removeWhere(  (x) => x.text == item.text);


  save(TodoItem i) {
    // noop right now.. Could update a datastore if we had one
  }

  bulkDelete(Iterable<TodoItem> x) {
    x.forEach(  (item) {
      items.removeWhere( (z) => z.text == item.text);
    });

  }

  saveItem(TodoItem item) {
    deleteItem(item);
    addItem(item);
  }


}