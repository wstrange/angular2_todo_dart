
import 'package:angular2/angular2.dart';
import 'package:angular2/src/reflection/reflection.dart' show reflector;
import 'package:angular2/src/reflection/reflection_capabilities.dart' show ReflectionCapabilities;
import 'package:angular2_todo_dart/todo_list.dart';


main() async {
  reflector.reflectionCapabilities = new ReflectionCapabilities();
  await bootstrap(TodoList);
}